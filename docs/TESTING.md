# Testing Guide

## Current State

**Test Files:** 9 files, 3,989 lines (+50% growth from v3.0.0) ⭐ UPDATED

**Test Count:** ~35 tests across unit, widget, and integration categories

**Coverage Status:** ~5-8% of codebase (target: 60%) ⭐ IMPROVED

## Existing Tests

### ✅ Completed Tests

- **Service layer tests** (2 files)
  - `test/services/test_service_test.dart`
  - `test/services/summary_service_test.dart`
- **Model validation tests** (1 file)
  - `test/model_validation_test.dart`
- **Scale configuration tests** (1 file)
  - `test/personality_type_scales_test.dart`
- **Basic widget tests** (1 file)
  - `test/widget_test.dart`
- **Summary calculation tests** (1 file)
  - `test/summary_test.dart`
- **Critical widget tests** (3 files, 1,340 lines) ⭐ NEW
  - `test/widgets/test_screen_test.dart` - Fast clicking, answer saving, navigation
  - `test/widgets/test_result_saving_test.dart` - Data persistence, integrity, serialization
  - `test/widgets/language_switch_test.dart` - i18n switching, UI updates, fallback

### ❌ Still Needed

- **Provider tests** (4 providers)
  - `test_provider_test.dart`
  - `summary_provider_test.dart`
  - `locale_provider_test.dart`
  - `user_preferences_provider_test.dart`
- **Additional widget/screen tests**
  - `error_dialog_test.dart`
  - `summary_charts_test.dart`
  - Critical screen interaction tests
- **Integration tests** (missing)
  - Test flow end-to-end testing

## Test Structure

```
test/
├── services/                      # ✅ DONE (2 files)
│   ├── test_service_test.dart
│   └── summary_service_test.dart
├── widgets/                       # ✅ CRITICAL TESTS DONE (3 files) ⭐ NEW
│   ├── test_screen_test.dart     # Fast clicking, race conditions
│   ├── test_result_saving_test.dart  # Data persistence, integrity
│   ├── language_switch_test.dart     # i18n, language switching
│   ├── error_dialog_test.dart    # ❌ TODO
│   └── summary_charts_test.dart  # ❌ TODO
├── providers/                     # ❌ TODO (4 providers)
│   ├── test_provider_test.dart
│   ├── summary_provider_test.dart
│   ├── locale_provider_test.dart
│   └── user_preferences_provider_test.dart
├── integration/                   # ❌ TODO
│   └── test_flow_test.dart
├── model_validation_test.dart     # ✅ DONE
├── personality_type_scales_test.dart # ✅ DONE
├── summary_test.dart              # ✅ DONE
└── widget_test.dart               # ✅ DONE
```

**Total:** 9 test files, 3,989 lines, ~35 tests

## Critical Widget Tests ⭐ NEW

### 1. test_screen_test.dart (464 lines, 10 tests)

**Purpose:** Prevent race condition bugs in test-taking interface

**Test Scenarios:**
- Fast clicking simulation (5-10 answers/second)
- All answers saved during rapid interaction
- Navigation between questions
- Back button functionality
- Finish button appears on last question
- Visual selection indication
- Exit confirmation dialog
- Progress bar updates

**Why Critical:** Protects against bugs from Nov 4 and Nov 8, 2025 where answers were lost during fast clicking.

```dart
// Example: Fast clicking stress test
testWidgets('All answers are saved during fast clicking', (tester) async {
  for (int i = 0; i < 10; i++) {
    await tester.tap(find.text('Answer'));
    await tester.pump(Duration(milliseconds: 100)); // Fast!
  }
  expect(answersCount, 10); // All saved
});
```

### 2. test_result_saving_test.dart (419 lines, 13 tests)

**Purpose:** Ensure psychological test data integrity

**Test Scenarios:**
- Single test result saved to SharedPreferences
- Multiple results saved correctly
- Results loaded on app restart
- Multi-factor tests preserve factor scores
- 80+ answer map preservation
- DateTime serialization accuracy
- Hierarchical scale scores (195 scales)
- Special characters in interpretations
- Corrupted JSON data handling gracefully
- Empty result lists handled

**Why Critical:** User psychological profiles must never be lost!

```dart
// Example: Multi-factor result persistence
test('Multi-factor test results preserve factor scores', () async {
  final result = TestResult(
    factorScores: {
      'openness': FactorScore(...),
      'conscientiousness': FactorScore(...),
      // ... 5 factors
    },
  );
  await provider.saveTestResult(result);

  // Reload from storage
  final loaded = await loadFromStorage();
  expect(loaded.factorScores['openness'].score, 70);
});
```

### 3. language_switch_test.dart (457 lines, 12 tests)

**Purpose:** Multilingual support correctness

**Test Scenarios:**
- Default language is Russian
- Switch to English works
- Language preference persisted
- Language loaded on init
- Summary cache cleared on language change
- No-op when switching to same language
- Reset to default (Russian)
- Test titles display in correct language
- UI updates immediately on switch
- Unsupported language fallback to Russian
- Multiple language switches work correctly

**Why Critical:** International users rely on correct translations.

```dart
// Example: Language switch updates UI
testWidgets('Test titles update when language switches', (tester) async {
  await localeProvider.setLocale(Locale('en'));
  await tester.pumpAndSettle();

  expect(find.text('Big Five Personality Test (IPIP)'), findsOneWidget);
  expect(find.text('Большая пятёрка (IPIP)'), findsNothing);
});
```

---

## Running Tests

### Basic Commands

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific directory
flutter test test/services/

# Run specific file
flutter test test/services/test_service_test.dart

# Run with verbose output
flutter test --verbose
```

### Coverage Analysis

```bash
# Generate coverage report
flutter test --coverage

# View coverage (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Writing Tests

### Unit Test Example

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/services/test_service.dart';

void main() {
  group('TestService', () {
    late TestService testService;

    setUp(() {
      testService = TestService();
    });

    test('should load test data', () {
      final test = testService.getTestById('ipip_big_five');
      expect(test, isNotNull);
      expect(test!.questions.length, 50);
    });

    test('should validate answers', () {
      final answers = {'q1': 'a1', 'q2': 'a2'};
      final isValid = testService.validateAnswers('ipip_big_five', answers);
      expect(isValid, isFalse); // Incomplete
    });
  });
}
```

### Widget Test Example

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psycho_app/screens/home_screen.dart';
import 'package:psycho_app/providers/test_provider.dart';

void main() {
  testWidgets('HomeScreen displays test list', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => TestProvider(),
          child: HomeScreen(),
        ),
      ),
    );

    expect(find.text('IPIP Big Five'), findsOneWidget);
    expect(find.text('Fisher Temperament'), findsOneWidget);
  });
}
```

### Provider Test Example

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/providers/test_provider.dart';

void main() {
  group('TestProvider', () {
    late TestProvider provider;

    setUp(() {
      provider = TestProvider();
    });

    test('should start with empty completed tests', () {
      expect(provider.completedTests, isEmpty);
    });

    test('should add completed test', () async {
      // Mock test result
      final result = TestResult(
        testId: 'test1',
        timestamp: DateTime.now(),
        scores: {'factor1': 75},
      );

      await provider.saveTestResult(result);
      expect(provider.completedTests.length, 1);
    });
  });
}
```

## Testing Best Practices

### 1. Test Organization

- Group related tests using `group()`
- Use descriptive test names
- One assertion per test (when possible)
- Use `setUp()` and `tearDown()` for common setup

### 2. Coverage Goals

- **Critical paths:** 90%+ coverage
- **Business logic:** 80%+ coverage
- **UI components:** 60%+ coverage
- **Overall target:** 60%+ coverage

### 3. Test Types

- **Unit tests:** Test individual functions/methods
- **Widget tests:** Test UI components
- **Integration tests:** Test complete user flows
- **Golden tests:** Test UI appearance (optional)

### 4. Mock Data

- Use realistic test data
- Test edge cases (empty, null, invalid)
- Test error conditions

### 5. Continuous Integration

```yaml
# .github/workflows/test.yml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v2
```

## Priority Roadmap

### ✅ Phase 0: Critical Widget Tests (COMPLETED) ⭐
**Status:** DONE (2025-11-08)
**Effort:** 6-8 hours (actual)

- [x] `test_screen_test.dart` - Fast clicking, race condition protection
- [x] `test_result_saving_test.dart` - Data persistence, integrity
- [x] `language_switch_test.dart` - i18n, language switching
- **Result:** 32+ tests, 1,340 lines, protection against critical bugs

### Phase 1: Provider Tests (High Priority)
**Effort:** 8-10 hours

- [ ] `TestProvider` tests
- [ ] `SummaryProvider` tests
- [ ] `LocaleProvider` tests
- [ ] `UserPreferencesProvider` tests

### Phase 2: Additional Widget Tests (Medium Priority)
**Effort:** 4-6 hours (reduced - critical tests done)

- [ ] `ErrorDialog` tests
- [ ] `SummaryCharts` tests
- [ ] Additional screen interaction tests

### Phase 3: Integration Tests (Medium Priority)
**Effort:** 4-6 hours

- [ ] Test flow end-to-end
- [ ] Navigation tests
- [ ] State persistence tests

**Total Remaining Effort:** 16-22 hours (down from 18-24 hours)

---

**Last Updated:** 2025-11-08 (v3.1.0)
**Current Coverage:** ~5-8% (improved from ~3%)
**Target Coverage:** 60%
**Recent Achievement:** ✅ Critical widget tests completed (+1,340 lines, +50% test coverage)
