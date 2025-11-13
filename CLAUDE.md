# CLAUDE.MD - Project Guidelines

> **Comprehensive documentation moved to `docs/` directory.**
> This file contains quick reference and essential information.

---

## Project Overview

**Name:** Психологические тесты (Psycho Tests)
**Type:** Flutter Mobile Application
**Version:** 1.0.0+1 (Development Branch: 0.0.1.x_dev)
**Platforms:** iOS, Android
**Language:** Dart 3.0+
**Framework:** Flutter 3.0+

### Purpose

A mobile application providing professional psychological tests for self-assessment and personal development. The app offers scientifically validated psychological assessments with multilingual support (Russian/English), local result storage, and comprehensive personality analysis.

### Core Features

- **9 psychological tests organized in 4 categories:**
  - 🎭 **Типология личности:** IPIP Big Five (50 q), 16 Personality Types (80 q)
  - 🧠 **Темперамент:** Fisher Temperament (56 q), Temperament Profile (60 q)
  - ❤️ **Отношения:** Love Profile (60 q)
  - 🌟 **Эмоциональное состояние:** Stress Test, Self-Esteem Test, Digital Detox (50 q), Burnout Diagnostic (54 q) ⭐ NEW
- **Category-based test grouping** with collapsible sections ⭐ NEW
- Multilingual support (Russian/English)
- Daily mood tracking
- Result history and archive
- Aggregate summary analysis with **195 psychological scales**
- **Cross-test MBTI calculation** - all tests contribute to personality type ⭐ NEW
- Theme customization (6 pastel colors + dark mode)
- Onboarding experience for new users
- Offline-first architecture with local persistence
- Production-ready logging system
- Comprehensive error handling

---

## Technology Stack

### Core Technologies

| Technology | Version | Purpose |
|-----------|---------|---------|
| **Flutter** | 3.0+ | UI Framework |
| **Dart** | 3.0+ | Programming Language |
| **Provider** | ^6.0.5 | State Management |
| **SharedPreferences** | ^2.2.2 | Local Data Persistence |
| **Material Design** | 3 | Design System |
| **Logger** | ^2.0.2 | Production Logging ⭐ NEW |

### Dependencies

**Production:**
- `provider: ^6.0.5` - State management and dependency injection
- `shared_preferences: ^2.2.2` - Key-value local storage
- `cupertino_icons: ^1.0.2` - iOS design icons
- `logger: ^2.0.2` - Production-ready logging

**Development:**
- `flutter_test` - Testing framework
- `flutter_lints: ^4.0.0` - Dart linting rules

---

## Quick Start

### Setup

1. **Install Flutter:**
   ```bash
   flutter doctor
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on Device/Emulator:**
   ```bash
   flutter run
   ```

### Development Commands

```bash
# Run app
flutter run

# Format code
dart format lib/

# Analyze code
flutter analyze

# Run tests
flutter test

# Build for Android
flutter build apk

# Build for iOS
flutter build ios
```

---

## Architecture Overview

The application follows a **Provider-based Clean Architecture** with clear separation of concerns:

```
Presentation Layer (Screens, Widgets)
         ↓
Provider Layer (State Management)
         ↓
Service Layer (Business Logic) ⭐ NEW
         ↓
Model Layer (Data Models)
         ↓
Utilities & Constants ⭐ NEW
         ↓
Data & Config Layer (Test Data, Storage)
```

### Key Layers

- **Presentation** (`lib/screens/`, `lib/widgets/`) - UI components
- **Providers** (`lib/providers/`) - State management (5 providers)
  - `TestProvider` - Test data and results
  - `LocaleProvider` - Language switching
  - `UserPreferencesProvider` - Settings and theme
  - `SummaryProvider` - Aggregate analysis
  - `CategoryProvider` - Category grouping ⭐ NEW
- **Services** (`lib/services/`) - Business logic
- **Models** (`lib/models/`) - Data structures (including TestCategory ⭐ NEW)
- **Utils** (`lib/utils/`) - Shared utilities ⭐ NEW
- **Constants** (`lib/constants/`) - Centralized constants ⭐ NEW
- **Data** (`lib/data/`) - Test content
- **Config** (`lib/config/`) - App configuration

**📖 For detailed architecture, see:** [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)

---

## Project Structure

```
/mnt/d/Work/psycho_app/0.0.1.x_dev/
├── lib/                           # Main application (~32,000 lines)
│   ├── main.dart                  # App entry point
│   ├── config/                    # Configuration (17 files, 12,700 lines)
│   │   └── summary/question_weights/  # MBTI weights (8 files)
│   │       ├── sixteen_types_weights.dart  # 80 questions
│   │       ├── digital_detox_weights.dart  # 50 questions
│   │       ├── burnout_diagnostic_weights.dart  # 54 questions ⭐ NEW
│   │       └── ...
│   ├── data/                      # Test data (10 files, 8,200 lines)
│   ├── models/                    # Data models (3 files, 2,200 lines)
│   │   ├── test_model.dart        # TestModel with categoryId ⭐ UPDATED
│   │   ├── test_category.dart     # Category definitions ⭐ NEW
│   │   └── summary_model.dart
│   ├── providers/                 # State management (5 files)
│   │   ├── category_provider.dart # Category state ⭐ NEW
│   │   └── ...
│   ├── services/                  # Business logic (2 files, 1,500 lines)
│   │   └── summary_service.dart   # Cross-test MBTI ⭐ UPDATED
│   ├── utils/                     # Utilities (2 files, 121 lines)
│   ├── constants/                 # Constants (2 files, 148 lines)
│   ├── exceptions/                # Custom exceptions (132 lines)
│   ├── screens/                   # UI screens (12 files, 9,000 lines)
│   │   └── home_screen.dart       # Grouped categories ⭐ UPDATED
│   └── widgets/                   # Reusable components (2 files)
├── test/                          # Tests (9 files, 3,989 lines) ⭐ UPDATED
│   ├── services/                  # Service tests (2 files)
│   ├── widgets/                   # Widget tests (3 files) ⭐ NEW
│   ├── model_validation_test.dart
│   ├── personality_type_scales_test.dart
│   ├── summary_test.dart
│   └── widget_test.dart
├── docs/                          # Documentation ⭐ NEW
│   ├── ARCHITECTURE.md
│   ├── BUGFIXES.md
│   ├── TESTING.md
│   ├── SECURITY.md
│   ├── DEPLOYMENT.md
│   └── PERFORMANCE.md
├── android/                       # Android platform
├── ios/                           # iOS platform
├── pubspec.yaml                   # Dependencies
├── CHANGELOG.md                   # Version history
├── CLAUDE.md                      # This file
└── README.md                      # Project overview (Russian)
```

**Total Growth:** 10,347 → 35,000 lines (+238%)

---

## Coding Guidelines

### File Organization

**Maximum File Size:** 400-500 lines (recommended)

**Naming Conventions:**
- Files: `snake_case.dart`
- Classes: `PascalCase`
- Variables/Methods: `camelCase`
- Constants: `camelCase` or `UPPER_SNAKE_CASE`

### Code Style

**Follow:**
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Style Guide](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#style-guide)
- Use `flutter_lints` package (already configured)

**Formatting:**
```bash
dart format lib/
```

### Error Handling ✅ PRODUCTION-READY

**Current Approach:**

```dart
import 'package:psycho_app/utils/app_logger.dart';
import 'package:psycho_app/widgets/error_dialog.dart';
import 'package:psycho_app/exceptions/validation_exceptions.dart';

try {
  await prefs.saveData();
} catch (e, stackTrace) {
  appLogger.e('Failed to save preferences', error: e, stackTrace: stackTrace);

  if (mounted) {
    ErrorDialog.showSnackbar(
      context,
      'Unable to save settings. Please try again.',
      isError: true,
    );
  }

  rethrow;  // or return default value
}
```

**Features:**
- ✅ Centralized logging with `appLogger`
- ✅ User-facing error dialogs
- ✅ 9 custom exception types
- ✅ Error recovery mechanisms
- ✅ No `print()` statements

### Documentation Requirements

**Current State:** ~2-3% coverage (improved from 0.45%)

**Required:**
- All public classes must have dartdoc comments
- All public methods must have dartdoc comments
- Complex algorithms must have inline comments
- TODO comments must include context

**Example:**
```dart
/// Calculates the aggregate personality profile across multiple test results.
///
/// Returns a [SummaryData] object containing normalized scores (0-100) for each axis.
/// Returns null if insufficient test data is available.
SummaryData? calculateSummary(List<TestResult> results) {
  // Implementation...
}
```

---

## Current TODO List

### ✅ Completed (11 major items)

1. ✅ **Logging System** - Centralized logging with `logger` package
2. ✅ **Hardcoded Constants** - Extracted to `constants/` directory
3. ✅ **Error Handling** - Production-ready error dialogs and messages
4. ✅ **Data Validation** - Custom exceptions and validation logic
5. ✅ **Service Layer** - Business logic separated from UI
6. ✅ **Critical UI Tests** - Widget tests for race conditions, persistence, i18n
7. ✅ **Love Profile Weights** - All 60 questions with full weights (was 13)
8. ✅ **MBTI Cross-Test Questions** - Summary screen shows questions from ALL tests
9. ✅ **Question Text Display** - Real question/answer texts with percentage influence
10. ✅ **Test Categorization** - 4 categories with collapsible sections, state persistence
11. ✅ **Legacy Dart Architecture** - Converted temperament_profile_test from JSON to Dart (7/9 tests use Legacy Dart)
12. ✅ **Digital Detox Test** - Technology addiction diagnostic (50 questions, 7 factors, 1,115 lines weights)
13. ✅ **Burnout Diagnostic Test** - Professional burnout assessment (54 questions, 7 factors, 1,115 lines weights) ⭐ NEW

### 🔄 In Progress

14. 🔄 **Large File Refactoring** - Services extracted, data files remain
15. 🔄 **Documentation Coverage** - 2-3% (target: 60%+)
16. 🔄 **Test Coverage** - 3,989 lines, ~35 tests (target: 60% of codebase)

### 🔴 High Priority

17. 🔴 **Encrypted Storage** - Migrate to `flutter_secure_storage` (4-6 hours)
18. 🔴 **Incomplete TODOs** - Resolve remaining TODO items in code (3-4 hours)

### 🟢 Low Priority

19. 🟢 **i18n Enhancement** - ARB-based internationalization (10 hours)
20. 🟢 **Analytics** - Firebase Analytics integration (4 hours)
21. 🟢 **Accessibility** - Screen reader support (8 hours)
22. ~~🟢 **JSON Test Data** - Extract to JSON files (6-8 hours)~~ **CANCELLED** - Using Legacy Dart architecture instead

**📊 Progress:** 13 critical items completed, 3 in progress, 2 high-priority remaining

**📌 Architecture Decision:** Legacy Dart chosen over JSON for test data (scalability to 100-200 tests, better performance, type safety)

---

## Key Files Reference

| File | Lines | Purpose |
|------|-------|---------|
| `lib/main.dart` | 171 | App entry point, theme setup |
| `lib/screens/home_screen.dart` | 398 | Test selection, navigation |
| `lib/screens/test_screen.dart` | 631 | Test-taking interface |
| `lib/services/test_service.dart` | 853 | Test business logic |
| `lib/services/summary_service.dart` | 387 | Summary calculation |
| `lib/config/summary/hierarchical_scales.dart` | 5,068 | 195 psychological scales |
| `lib/data/digital_detox_data.dart` | 1,150 | Digital Detox test (50 questions) |
| `lib/data/burnout_diagnostic_data.dart` | 1,540 | Burnout Diagnostic test (54 questions) ⭐ NEW |
| `lib/config/summary/question_weights/burnout_diagnostic_weights.dart` | 1,115 | Burnout weights (105 scales) ⭐ NEW |

---

## Documentation Index

### 📚 Detailed Guides

All comprehensive documentation is in the `docs/` directory:

- **[Architecture Guide](docs/ARCHITECTURE.md)** - Detailed architecture, layers, data flow
- **[Bug Fixes](docs/BUGFIXES.md)** - Critical bug fixes and lessons learned
- **[Testing Guide](docs/TESTING.md)** - Test structure, coverage, best practices
- **[Security Guide](docs/SECURITY.md)** - Security posture, vulnerabilities, best practices
- **[Deployment Guide](docs/DEPLOYMENT.md)** - Build configuration, release checklist
- **[Performance Guide](docs/PERFORMANCE.md)** - Performance metrics, optimization opportunities

### 📄 Other Documentation

- **[README.md](README.md)** - Project overview (Russian)
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and release notes
- **[IMPLEMENTATION_NOTES.md](IMPLEMENTATION_NOTES.md)** - Feature implementation details
- **[ARCHITECTURE_ANALYSIS.md](ARCHITECTURE_ANALYSIS.md)** - Architecture comparison report
- **[ADDING_NEW_TEST.md](ADDING_NEW_TEST.md)** - Comprehensive guide for adding new tests (v2.3.0) ⭐ UPDATED

---

## Resources & References

### External Links

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design 3](https://m3.material.io/)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

### Psychological Tests References

- **IPIP Big Five** - International Personality Item Pool
- **Fisher Temperament Inventory** - Dr. Helen Fisher's temperament assessment
- **Love Languages** - Gary Chapman's relationship framework

---

## Contact & Support

**Project Maintainer:** [Add your contact info]
**Repository:** [Add Git repository URL]
**Issue Tracker:** [Add issue tracker URL]

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 3.7.0 | 2025-01-09 | Claude Code | **BURNOUT DIAGNOSTIC TEST ADDED:** Professional burnout assessment ⭐<br>- **New Test:** Burnout Diagnostic (54 questions, 7 factors, 12 minutes)<br>- Created test stub: `burnout_diagnostic_test.dart` (118 lines)<br>- Created test data: `burnout_diagnostic_data.dart` (1,540 lines, bilingual, NaN protection)<br>- Created weights mapping: `burnout_diagnostic_weights.dart` (1,115 lines, 105 scales coverage)<br>- **7 Factors:** emotional_exhaustion, depersonalization, reduced_efficacy, physical_symptoms, cognitive_impairment, motivation_loss, work_environment<br>- **10 reversed questions:** [21, 24, 28, 35, 38, 40, 45, 52, 53, 54]<br>- **Critical fixes:** 9 errors resolved (NaN, 20% minimum score, MBTI weights, scale coverage)<br>- **Scale coverage:** 57 → 105 scales (+84% expansion)<br>- Added expandable "Affected Scales" section in test results<br>- Fixed MBTI bipolar weights: 10 negative weights inverted to opposite poles<br>- Updated summary_service.dart: added burnout weights to allWeights map<br>- **Updated ADDING_NEW_TEST.md v2.3.0** with 4 critical rules and 11 typical problems<br>- Integrated in 7 files: test_registry, test_service, test_loader_service, summary_screen (×2), summary_service, test_result_screen<br>- **Test Architecture:** 7 Legacy Dart + 2 JSON = 9 total tests<br>- **Codebase growth:** 33,400 → 35,000 lines (+4.8%) ✅ |
| 3.6.0 | 2025-01-09 | Claude Code | **DIGITAL DETOX TEST ADDED:** Technology addiction diagnostic<br>- **New Test:** Digital Detox (50 questions, 7 factors, 10 minutes)<br>- Created test stub: `digital_detox_test.dart` (118 lines)<br>- Created test data: `digital_detox_data.dart` (1,150 lines, bilingual)<br>- Created weights mapping: `digital_detox_weights.dart` (1,115 lines, 50 questions → 195 scales)<br>- **7 Factors:** dependency_level, attention_control, social_impact, physical_health, productivity_loss, emotional_state, usage_patterns<br>- **Scientific basis:** Digital Wellbeing Framework, Nomophobia Research, FOMO Theory, Cognitive Load Theory<br>- Integrated in 6 files: test_registry, test_service, test_loader_service, summary_screen (×2), summary_config<br>- Fixed class naming issue: `DigitalDetoxTestData` → alias imports<br>- Updated ADDING_NEW_TEST.md v2.2.0 with naming verification step<br>- **Test Architecture:** 6 Legacy Dart + 2 JSON = 8 total tests<br>- **Codebase growth:** 31,000 → 33,400 lines (+7.7%) ✅ |
| 3.5.0 | 2025-01-09 | Claude Code | **LEGACY DART MIGRATION:** Converted to Legacy Dart architecture ⭐<br>- **Architecture Decision:** Legacy Dart chosen for 100-200 test scalability<br>- Converted temperament_profile_test from JSON to Legacy Dart (934 lines)<br>- Updated all 7 TestStub files with correct assetPath (5 empty, 2 JSON)<br>- Updated test_loader_service.dart: added temperament_profile_test case<br>- Optimized pubspec.yaml: only 2 JSON files (stress_test, self_esteem_test)<br>- Removed 4 placeholder JSON files (ipip_big_five, fisher_temperament, love_profile, sixteen_types)<br>- Fixed test loading: empty assetPath → Legacy Dart, non-empty → JSON<br>- Removed "should be converted to JSON" warnings<br>- Updated ADDING_NEW_TEST.md v2.0.0 with Legacy Dart instructions<br>- **Test Architecture:** 5 Legacy Dart + 2 JSON = 7 total tests<br>- All tests now load successfully without errors ✅ |
| 3.4.0 | 2025-01-09 | Claude Code | **NEW TEST:** Temperament Profile Test added (60 questions, 6 factors) ⭐<br>- Created comprehensive temperament assessment based on Pavlov/Eysenck theories<br>- Added Dart stub: `temperament_profile_test.dart` (103 lines)<br>- Initially created with JSON (later converted to Legacy Dart in v3.5.0)<br>- Mapped all questions to 195 scales: `temperament_profile_test_weights.dart` (1,231 lines)<br>- 6 temperament factors: Energy, Emotional Stability, Self-Control, Social Openness, Tempo, Flexibility<br>- Added disclaimer and detailed interpretations (low/medium/high)<br>- Updated test registry and documentation<br>- Total tests: 6 → 7 |
| 3.3.0 | 2025-01-09 | Claude Code | **TEST CATEGORIZATION:** Organized home screen with collapsible categories<br>- Created TestCategory model with 4 categories (🎭🧠❤️🌟)<br>- Implemented CategoryProvider with state persistence<br>- Redesigned home screen with animated collapsible sections<br>- Added categoryId to all test models (6 test data files)<br>- Categories collapsed by default for clean UX<br>- AnimatedSize + AnimatedRotation for smooth interactions<br>- Updated TODO: 10 items completed (+1 new) |
| 3.2.0 | 2025-01-08 | Claude Code | **MBTI ENHANCEMENTS:** Complete Love Profile weights + cross-test display<br>- Separated Love Profile into dedicated file (978 lines, 60 questions)<br>- Fixed import conflicts and QuestionWeight type mismatches<br>- Implemented cross-test MBTI question aggregation in SummaryService<br>- Added real question/answer text loading with i18n support<br>- Added percentage influence display (weight/totalWeight × 100)<br>- Summary screen now shows questions from ALL tests, not just 16 Types<br>- Updated TODO: 9 items completed (+3 new) |
| 3.1.0 | 2025-11-08 | Claude Code | **UI TESTS COMPLETE:** Critical widget tests implemented<br>- Added 3 widget test files (1,340 lines, 32+ tests)<br>- test_screen_test.dart: Fast clicking, race condition protection<br>- test_result_saving_test.dart: Data persistence, integrity<br>- language_switch_test.dart: i18n switching, UI updates<br>- Test coverage: 2,649 → 3,989 lines (+50%)<br>- Updated TODO list: 6 completed items |
| 3.0.0 | 2025-11-08 | Claude Code | **MAJOR REFACTOR:** Documentation restructuring<br>- Split CLAUDE.md into modular docs/ directory<br>- Created 6 specialized guides (Architecture, Testing, etc.)<br>- Reduced main file from ~900 to ~400 lines<br>- Added CHANGELOG.md for version tracking<br>- Improved navigation and findability |
| 2.1.0 | 2025-11-08 | Claude Code | Critical fix: blocking issue during fast clicks |
| 2.0.0 | 2025-11-08 | Claude Code | Major update: architecture analysis and refresh |
| 1.1.0 | 2025-11-04 | Claude Code | Added race condition bug fix documentation |
| 1.0.0 | 2025-10-28 | Claude Code | Initial documentation via codebase analysis |

---

**Last Updated:** 2025-01-09
**Document Version:** 3.7.0
**Codebase State:** ~35,000 lines across 59 files (+238% growth since v1.0.0)
**Test Coverage:** 9 test files, 3,989 lines, ~35 tests (+50% since v3.0.0)
**Architecture Status:** Production-ready with clean separation of concerns
**Test Architecture:** 7 Legacy Dart + 2 JSON = 9 total tests ⭐ UPDATED
**Recent Updates:** Added Burnout Diagnostic Test - professional burnout assessment (54 questions, 7 factors, 105 scales) ⭐ NEW

---

> **📖 For detailed information, navigate to the respective documentation file in the `docs/` directory.**
