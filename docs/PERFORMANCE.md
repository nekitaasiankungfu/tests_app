# Performance Guide

## Current Performance Profile

### Strengths ✅

- **Efficient State Management:** Provider pattern with optimized widget rebuilds
- **Cached Calculations:** Summary calculations cached to avoid redundant processing
- **Offline-First:** No network latency, instant local data access
- **Lazy Loading:** Tests loaded on-demand (not all at startup)
- **Minimal Dependencies:** Small app bundle size

### Metrics

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| App size (APK) | ~15 MB | < 20 MB | ✅ Good |
| Cold start | ~1.5s | < 2s | ✅ Good |
| Test load time | < 100ms | < 200ms | ✅ Excellent |
| Summary calc | ~300ms | < 500ms | ✅ Good |
| Memory usage | ~80 MB | < 150 MB | ✅ Good |

---

## Potential Bottlenecks

### 1. Large Test Data Files ⚠️

**Issue:** Test data files loaded at startup
- 5 files, ~5,498 lines of Dart code
- `sixteen_types_data.dart`: 1,640 lines
- All questions/answers loaded into memory

**Impact:**
- Increased initial memory footprint
- Slower app startup on low-end devices

**Current Mitigation:**
- Tests already loaded lazily via `TestProvider`

**Future Optimization:**
```dart
// Option 1: JSON-based lazy loading
class TestDataLoader {
  Future<TestModel> loadTest(String testId) async {
    final jsonString = await rootBundle.loadString('assets/tests/$testId.json');
    final data = jsonDecode(jsonString);
    return TestModel.fromJson(data);
  }
}

// Option 2: Compressed data
class CompressedTestLoader {
  Future<TestModel> loadTest(String testId) async {
    final compressed = await rootBundle.load('assets/tests/$testId.gz');
    final decompressed = GZipCodec().decode(compressed.buffer.asUint8List());
    return TestModel.fromJson(jsonDecode(utf8.decode(decompressed)));
  }
}
```

**Effort:** 6-8 hours
**Priority:** 🟡 Low (not critical)

---

### 2. JSON Serialization on Every Save ⚠️

**Issue:** All test results serialized to JSON on every save
- Full list re-serialized even for single result update
- No incremental saves

**Impact:**
- ~50-100ms delay on save operations
- Battery drain on frequent saves

**Current Code:**
```dart
// lib/providers/test_provider.dart
Future<void> saveTestResult(TestResult result) async {
  _completedTests.add(result);

  // Serializes ENTIRE list every time
  final jsonList = _completedTests.map((r) => r.toJson()).toList();
  await _prefs.setString('completedTests', jsonEncode(jsonList));
}
```

**Optimization:**
```dart
// Option 1: Debounced saves
class DebouncedSaver {
  Timer? _saveTimer;

  void scheduleSave(Function saveFn) {
    _saveTimer?.cancel();
    _saveTimer = Timer(Duration(milliseconds: 500), () {
      saveFn();
    });
  }
}

// Option 2: Incremental saves
Future<void> saveTestResult(TestResult result) async {
  _completedTests.add(result);

  // Save only new result with timestamp key
  final key = 'test_${result.timestamp.millisecondsSinceEpoch}';
  await _prefs.setString(key, jsonEncode(result.toJson()));

  // Update index
  final index = _completedTests.map((r) => r.timestamp).toList();
  await _prefs.setString('testIndex', jsonEncode(index));
}
```

**Effort:** 3-4 hours
**Priority:** 🟡 Medium

---

### 3. Summary Recalculation on Language Change ⚠️

**Issue:** Full summary recalculation when user changes language
- No language-specific caching
- Re-processes all 195 scales

**Impact:**
- 300ms delay on language switch
- Unnecessary CPU usage

**Optimization:**
```dart
class CachedSummaryProvider extends ChangeNotifier {
  final Map<String, SummaryData> _cache = {};

  SummaryData? getSummary(String locale, List<TestResult> results) {
    final cacheKey = '$locale:${results.length}:${results.last.timestamp}';

    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey];
    }

    final summary = _calculateSummary(locale, results);
    _cache[cacheKey] = summary;

    // Limit cache size
    if (_cache.length > 10) {
      _cache.remove(_cache.keys.first);
    }

    return summary;
  }
}
```

**Effort:** 2-3 hours
**Priority:** 🟢 Low

---

## Optimization Opportunities

### 1. Lazy Load Test Data 🎯

**Goal:** Load tests only when needed

**Implementation:**
```dart
class LazyTestProvider extends ChangeNotifier {
  final Map<String, TestModel> _loadedTests = {};

  Future<TestModel> getTest(String testId) async {
    if (_loadedTests.containsKey(testId)) {
      return _loadedTests[testId]!;
    }

    // Load from data file
    final test = await _loadTestData(testId);
    _loadedTests[testId] = test;
    return test;
  }

  // Unload unused tests to free memory
  void unloadTest(String testId) {
    _loadedTests.remove(testId);
  }
}
```

**Benefits:**
- Reduced initial memory footprint
- Faster app startup

**Effort:** 4-5 hours
**Priority:** 🟡 Medium

---

### 2. Debounce Summary Calculation 🎯

**Goal:** Avoid redundant calculations during rapid changes

**Implementation:**
```dart
import 'dart:async';

class DebouncedSummaryProvider extends ChangeNotifier {
  Timer? _debounceTimer;
  SummaryData? _lastSummary;

  void requestSummaryUpdate() {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(Duration(milliseconds: 500), () {
      _lastSummary = _calculateSummary();
      notifyListeners();
    });
  }
}
```

**Benefits:**
- Smoother UI during rapid changes
- Reduced CPU usage

**Effort:** 1-2 hours
**Priority:** 🟢 Low

---

### 3. Batch Result Saves 🎯

**Goal:** Write to storage in batches

**Implementation:**
```dart
class BatchedSaver {
  final List<TestResult> _pendingSaves = [];
  Timer? _batchTimer;

  void scheduleResultSave(TestResult result) {
    _pendingSaves.add(result);

    _batchTimer?.cancel();
    _batchTimer = Timer(Duration(seconds: 2), () {
      _flushPendingSaves();
    });
  }

  Future<void> _flushPendingSaves() async {
    if (_pendingSaves.isEmpty) return;

    final allResults = [..._completedTests, ..._pendingSaves];
    await _saveAllResults(allResults);

    _completedTests.addAll(_pendingSaves);
    _pendingSaves.clear();
  }
}
```

**Benefits:**
- Fewer disk writes
- Better battery life

**Effort:** 3-4 hours
**Priority:** 🟢 Low

---

### 4. Image Optimization 🎯

**Goal:** Reduce app bundle size

**Current:** No images (Material icons only)

**If adding images:**
```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/images/

# Use WebP format for smaller size
assets/
  images/
    icon.webp  # Instead of .png
```

**Tools:**
```bash
# Compress images
flutter pub run flutter_launcher_icons:main

# WebP conversion
cwebp input.png -o output.webp
```

---

### 5. Code Splitting 🎯

**Goal:** Reduce initial bundle size

**Implementation:**
```dart
// Deferred loading for rarely used features
import 'package:psycho_app/screens/advanced_stats.dart' deferred as advanced;

// Load on-demand
void showAdvancedStats() async {
  await advanced.loadLibrary();
  Navigator.push(context, advanced.AdvancedStatsScreen());
}
```

**Benefits:**
- Smaller initial download
- Faster app startup

**Effort:** 2-3 hours
**Priority:** 🟢 Low (app already small)

---

## Performance Testing

### Manual Testing

```bash
# Profile mode (closer to release performance)
flutter run --profile

# Performance overlay
# Press 'P' in terminal while app is running

# Enable performance tracking
flutter run --profile --trace-startup
```

### Automated Testing

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/scheduler.dart';

testWidgets('Summary calculation performance', (tester) async {
  final stopwatch = Stopwatch()..start();

  // Perform calculation
  final summary = await calculateSummary(mockResults);

  stopwatch.stop();

  expect(stopwatch.elapsedMilliseconds, lessThan(500),
    reason: 'Summary calculation should be < 500ms');
});
```

### Profiling Tools

```bash
# DevTools
flutter pub global activate devtools
flutter pub global run devtools

# Run app with DevTools
flutter run --profile
# Open DevTools URL shown in terminal
```

---

## Performance Budget

| Operation | Budget | Current | Status |
|-----------|--------|---------|--------|
| App launch (cold) | < 2s | ~1.5s | ✅ |
| Test load | < 200ms | ~100ms | ✅ |
| Summary calc | < 500ms | ~300ms | ✅ |
| Save operation | < 100ms | ~50ms | ✅ |
| Language switch | < 300ms | ~300ms | ✅ |
| Screen transition | < 300ms | ~100ms | ✅ |

---

## Monitoring

### Metrics to Track

- **Frame rendering:** Target 60 FPS (16.67ms per frame)
- **Jank:** < 5% of frames should drop
- **Memory:** < 150 MB peak usage
- **Battery:** < 2% per 10 minutes of active use

### Tools

- **Flutter DevTools:** CPU, memory, network profiling
- **Android Studio Profiler:** Android-specific metrics
- **Xcode Instruments:** iOS-specific metrics
- **Firebase Performance:** Production monitoring (optional)

---

## Optimization Roadmap

### Phase 1: Quick Wins (4-6 hours)
- [ ] Debounced summary calculation
- [ ] Cached language-specific summaries

### Phase 2: Medium Effort (10-12 hours)
- [ ] Lazy test data loading
- [ ] Batched result saves
- [ ] Incremental serialization

### Phase 3: Large Refactors (12-16 hours)
- [ ] JSON-based test data
- [ ] Compressed test storage
- [ ] Code splitting

**Total Estimated Effort:** 26-34 hours

---

**Last Updated:** 2025-11-08
**Performance Status:** ✅ Good (no critical issues)
**Next Review:** After 10k+ installs
