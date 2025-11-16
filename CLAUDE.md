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

- **13 psychological tests organized in 5 categories:**
  - 🎭 **Типология личности:** IPIP Big Five (50 q), 16 Personality Types (80 q), DISC Personality (56 q)
  - 🧠 **Темперамент:** Fisher Temperament (56 q), Temperament Profile (60 q), Social Battery (40 q)
  - ❤️ **Отношения:** Love Profile (60 q), Love Languages (30 q) ⭐ NEW
  - 🌟 **Эмоциональное состояние:** Stress Test, Self-Esteem Test, Digital Detox (50 q), Burnout Diagnostic (54 q)
  - 💼 **Карьера:** Holland Code RIASEC (60 q)
- **Category-based test grouping** with collapsible sections
- Multilingual support (Russian/English)
- Daily mood tracking
- Result history and archive
- Aggregate summary analysis with **195 psychological scales**
- **Cross-test personality type calculation** - all tests contribute to personality type
- **Automatic direction detection** - negative weights auto-invert scale values ⭐ NEW
- **Answer text display** - shows actual answer text in summary (e.g., "2/4 (Иногда)") ⭐ NEW
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
│   │   └── summary/question_weights/  # Personality type weights (8 files)
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
│   │   └── summary_service.dart   # Cross-test personality type ⭐ UPDATED
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

**Total Growth:** 10,347 → 37,000+ lines (+257%)

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

### ✅ Completed (15 major items)

1. ✅ **Logging System** - Centralized logging with `logger` package
2. ✅ **Hardcoded Constants** - Extracted to `constants/` directory
3. ✅ **Error Handling** - Production-ready error dialogs and messages
4. ✅ **Data Validation** - Custom exceptions and validation logic
5. ✅ **Service Layer** - Business logic separated from UI
6. ✅ **Critical UI Tests** - Widget tests for race conditions, persistence, i18n
7. ✅ **Love Profile Weights** - All 60 questions with full weights (was 13)
8. ✅ **Personality Type Cross-Test Questions** - Summary screen shows questions from ALL tests
9. ✅ **Question Text Display** - Real question/answer texts with percentage influence
10. ✅ **Test Categorization** - 5 categories with collapsible sections, state persistence
11. ✅ **Legacy Dart Architecture** - All tests use Legacy Dart (10/12) except 2 JSON tests
12. ✅ **Digital Detox Test** - Technology addiction diagnostic (50 questions, 7 factors)
13. ✅ **Burnout Diagnostic Test** - Professional burnout assessment (54 questions, 7 factors)
14. ✅ **DISC Personality Test** - Behavioral assessment (56 questions, 4 factors)
15. ✅ **Social Battery Test** - Social energy assessment (40 questions, 6 factors)
16. ✅ **Holland Code Test** - Career interests RIASEC (60 questions, 6 factors) ⭐ NEW

### 🔄 In Progress

17. 🔄 **Large File Refactoring** - Services extracted, data files remain
18. 🔄 **Documentation Coverage** - 2-3% (target: 60%+)
19. 🔄 **Test Coverage** - 3,989 lines, ~35 tests (target: 60% of codebase)

### 🔴 High Priority

20. 🔴 **Encrypted Storage** - Migrate to `flutter_secure_storage` (4-6 hours)
21. 🔴 **Incomplete TODOs** - Resolve remaining TODO items in code (3-4 hours)

### 🟢 Low Priority

22. 🟢 **i18n Enhancement** - ARB-based internationalization (10 hours)
23. 🟢 **Analytics** - Firebase Analytics integration (4 hours)
24. 🟢 **Accessibility** - Screen reader support (8 hours)
25. ~~🟢 **JSON Test Data** - Extract to JSON files~~ **CANCELLED** - Using Legacy Dart architecture

**📊 Progress:** 16 critical items completed, 3 in progress, 2 high-priority remaining

**📌 Architecture Decision:** Legacy Dart chosen over JSON for test data (scalability, performance, type safety)

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
| `lib/data/burnout_diagnostic_data.dart` | 1,540 | Burnout Diagnostic test (54 questions) |
| `lib/data/holland_code_data.dart` | 1,150 | Holland Code test (60 questions) ⭐ NEW |
| `lib/config/summary/question_weights/holland_code_weights.dart` | 960 | Holland Code weights ⭐ NEW |

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
- **[Adding New Test Guide](docs/adding-new-test/ADDING_NEW_TEST_INDEX.md)** - Модульное руководство (v3.0.0) ⭐
  - [65-пунктовый чеклист](docs/adding-new-test/ADDING_TEST_CHECKLIST.md)
  - [8 критических правил](docs/adding-new-test/ADDING_TEST_RULES.md)
  - [13 типичных ошибок](docs/adding-new-test/ADDING_TEST_ERRORS.md)
  - [Примеры кода](docs/adding-new-test/ADDING_TEST_EXAMPLES.md)

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
| 3.12.0 | 2025-01-16 | Claude Code | **Love Languages Test Added** ⭐<br>- **Новый тест:** Love Languages (30 вопросов, 5 языков любви, 8 минут)<br>- **5 Love Languages:** Words of Affirmation (💬), Quality Time (⏰), Receiving Gifts (🎁), Acts of Service (🤝), Physical Touch (🤗)<br>- Created: test stub, data file (bilingual), weights file (41 scales: 37 unipolar + 4 bipolar)<br>- Integrated in 7 points: test_registry, test_loader_service, test_service (3 blocks), summary_service (2 places), summary_screen (2 switches), summary_config<br>- **Fixed:** Ошибка #14 - использование `testResult.testId` вместо `test.id` в test_service.dart<br>- **Обновлена документация:** ADDING_TEST_ERRORS.md теперь содержит 14 ошибок (было 13)<br>- **Всего тестов:** 13 (5 категорий, 616 вопросов)<br>- **Test Architecture:** 11 Legacy Dart + 2 JSON = 13 total tests |
| 3.11.0 | 2025-01-16 | Claude Code | **Holland Code Test + Documentation Fix** ⭐<br>- **Добавлен тест:** Holland Code RIASEC (60 вопросов, 6 факторов)<br>- **Новая категория:** 'career' для профориентационных тестов<br>- **Исправлена ошибка:** Weights не отображались в результатах<br>- **Обновлена документация:** Добавлена Ошибка #13 про summary_config._weights<br>- **Всего тестов:** 12 (5 категорий)<br>- **Codebase:** 37,000+ строк (+257% с v1.0.0) |
| 3.10.0 | 2025-01-16 | Claude Code | **ADDING_NEW_TEST.md модульная структура v3.0.0** ⭐<br>- **Проблема:** Файл 3200+ строк превышал лимит токенов Claude Code (25000)<br>- **Решение:** Разбито на модульную структуру в `docs/adding-new-test/`<br>- **Создано 5 модулей:**<br>  • `ADDING_NEW_TEST_INDEX.md` - главный индекс<br>  • `ADDING_TEST_CHECKLIST.md` - 65-пунктовый чеклист<br>  • `ADDING_TEST_RULES.md` - 8 критических правил с ПРАВИЛОМ #8 (maxQuestionScore)<br>  • `ADDING_TEST_ERRORS.md` - 13 типичных ошибок с решениями<br>  • `ADDING_TEST_EXAMPLES.md` - готовые примеры кода<br>- **Результат:** Claude Code теперь читает каждый модуль полностью<br>- **Удалены:** устаревшие версии (v2.6.0, v3.md, v3_renum.md)<br>- **Польза:** Снижение ошибок при добавлении тестов благодаря каталогу проблем и правильным примерам |
| 3.9.0 | 2025-01-15 | Claude Code | **CRITICAL FIX: Bipolar scales calculation** ⭐<br>- **FIXED:** Bipolar scales showed 100% on one pole with mixed answers (e.g., 2×"Never" + 2×"Always" → "Emotions 100%")<br>- **Root cause 1:** Score normalization used `(answerScore - 1) / 4.0` (assumed scores 1-5) instead of `answerScore / 4.0` (scores 0-4)<br>- **Root cause 2:** `_calculateBipolarPercentage()` didn't handle single-pole data correctly<br>- **Solution 1:** Fixed normalization in `summary_service.dart:162` to `answerScore / 4.0`<br>- **Solution 2:** New logic for 3 scenarios: both poles, one pole, no data<br>- **Result:** Bipolar scales now calculate correctly (2×0% + 2×100% → 50%) ✅<br>- **Updated ADDING_NEW_TEST.md v2.6.0** with RULE #7 (220+ lines: scale structure, bipolar calculation, examples)<br>- **Files changed:** 2 (summary_service.dart lines 162-166, 189-215; ADDING_NEW_TEST.md)<br>- **Bug impact:** All personality type scales (E/I, S/N, T/F, J/P) now accurate ✅<br>- **Documentation:** Complete explanation of 195 unipolar + 8 bipolar pole scales |
| 3.8.0 | 2025-01-15 | Claude Code | **CRITICAL FIX: Direction auto-detection + Answer text display** ⭐<br>- **FIXED:** Scales with negative weights showed 0% instead of inverted values<br>- **Root cause:** `getDirection()` didn't check weight sign, only `axisDirections` (unused)<br>- **Solution:** Auto-detect direction from weight sign (`weight < 0` → `direction = -1`)<br>- Modified `question_weight_models.dart`: `getDirection()` now checks weight sign<br>- Modified `test_service.dart`: use `weight.abs()` when passing to accumulator<br>- **Result:** Negative weights now work correctly (75% answer → 25% scale) ✅<br>- **Summary Screen:** Added answer text display "2/4 (Иногда)" instead of "2/4"<br>- Created global `_getAnswerText()` function in `summary_screen.dart`<br>- Supports bilingual (ru/en) with error handling<br>- **Updated ADDING_NEW_TEST.md v2.5.0** with RULE #3 (direction auto-detection)<br>- **Files changed:** 3 (question_weight_models.dart, test_service.dart, summary_screen.dart, ADDING_NEW_TEST.md, CLAUDE.md)<br>- **Bug impact:** All 501 fixed negative weights now functional ✅ |
| 3.7.0 | 2025-01-09 | Claude Code | **BURNOUT DIAGNOSTIC TEST ADDED:** Professional burnout assessment ⭐<br>- **New Test:** Burnout Diagnostic (54 questions, 7 factors, 12 minutes)<br>- Created test stub: `burnout_diagnostic_test.dart` (118 lines)<br>- Created test data: `burnout_diagnostic_data.dart` (1,540 lines, bilingual, NaN protection)<br>- Created weights mapping: `burnout_diagnostic_weights.dart` (1,115 lines, 105 scales coverage)<br>- **7 Factors:** emotional_exhaustion, depersonalization, reduced_efficacy, physical_symptoms, cognitive_impairment, motivation_loss, work_environment<br>- **10 reversed questions:** [21, 24, 28, 35, 38, 40, 45, 52, 53, 54]<br>- **Critical fixes:** 9 errors resolved (NaN, 20% minimum score, personality type weights, scale coverage)<br>- **Scale coverage:** 57 → 105 scales (+84% expansion)<br>- Added expandable "Affected Scales" section in test results<br>- Fixed Personality Type bipolar weights: 10 negative weights inverted to opposite poles<br>- Updated summary_service.dart: added burnout weights to allWeights map<br>- **Updated ADDING_NEW_TEST.md v2.3.0** with 4 critical rules and 11 typical problems<br>- Integrated in 7 files: test_registry, test_service, test_loader_service, summary_screen (×2), summary_service, test_result_screen<br>- **Test Architecture:** 7 Legacy Dart + 2 JSON = 9 total tests<br>- **Codebase growth:** 33,400 → 35,000 lines (+4.8%) ✅ |
| 3.6.0 | 2025-01-09 | Claude Code | **DIGITAL DETOX TEST ADDED:** Technology addiction diagnostic<br>- **New Test:** Digital Detox (50 questions, 7 factors, 10 minutes)<br>- Created test stub: `digital_detox_test.dart` (118 lines)<br>- Created test data: `digital_detox_data.dart` (1,150 lines, bilingual)<br>- Created weights mapping: `digital_detox_weights.dart` (1,115 lines, 50 questions → 195 scales)<br>- **7 Factors:** dependency_level, attention_control, social_impact, physical_health, productivity_loss, emotional_state, usage_patterns<br>- **Scientific basis:** Digital Wellbeing Framework, Nomophobia Research, FOMO Theory, Cognitive Load Theory<br>- Integrated in 6 files: test_registry, test_service, test_loader_service, summary_screen (×2), summary_config<br>- Fixed class naming issue: `DigitalDetoxTestData` → alias imports<br>- Updated ADDING_NEW_TEST.md v2.2.0 with naming verification step<br>- **Test Architecture:** 6 Legacy Dart + 2 JSON = 8 total tests<br>- **Codebase growth:** 31,000 → 33,400 lines (+7.7%) ✅ |
| 3.5.0 | 2025-01-09 | Claude Code | **LEGACY DART MIGRATION:** Converted to Legacy Dart architecture ⭐<br>- **Architecture Decision:** Legacy Dart chosen for 100-200 test scalability<br>- Converted temperament_profile_test from JSON to Legacy Dart (934 lines)<br>- Updated all 7 TestStub files with correct assetPath (5 empty, 2 JSON)<br>- Updated test_loader_service.dart: added temperament_profile_test case<br>- Optimized pubspec.yaml: only 2 JSON files (stress_test, self_esteem_test)<br>- Removed 4 placeholder JSON files (ipip_big_five, fisher_temperament, love_profile, sixteen_types)<br>- Fixed test loading: empty assetPath → Legacy Dart, non-empty → JSON<br>- Removed "should be converted to JSON" warnings<br>- Updated ADDING_NEW_TEST.md v2.0.0 with Legacy Dart instructions<br>- **Test Architecture:** 5 Legacy Dart + 2 JSON = 7 total tests<br>- All tests now load successfully without errors ✅ |
| 3.4.0 | 2025-01-09 | Claude Code | **NEW TEST:** Temperament Profile Test added (60 questions, 6 factors) ⭐<br>- Created comprehensive temperament assessment based on Pavlov/Eysenck theories<br>- Added Dart stub: `temperament_profile_test.dart` (103 lines)<br>- Initially created with JSON (later converted to Legacy Dart in v3.5.0)<br>- Mapped all questions to 195 scales: `temperament_profile_test_weights.dart` (1,231 lines)<br>- 6 temperament factors: Energy, Emotional Stability, Self-Control, Social Openness, Tempo, Flexibility<br>- Added disclaimer and detailed interpretations (low/medium/high)<br>- Updated test registry and documentation<br>- Total tests: 6 → 7 |
| 3.3.0 | 2025-01-09 | Claude Code | **TEST CATEGORIZATION:** Organized home screen with collapsible categories<br>- Created TestCategory model with 4 categories (🎭🧠❤️🌟)<br>- Implemented CategoryProvider with state persistence<br>- Redesigned home screen with animated collapsible sections<br>- Added categoryId to all test models (6 test data files)<br>- Categories collapsed by default for clean UX<br>- AnimatedSize + AnimatedRotation for smooth interactions<br>- Updated TODO: 10 items completed (+1 new) |
| 3.2.0 | 2025-01-08 | Claude Code | **Personality Type ENHANCEMENTS:** Complete Love Profile weights + cross-test display<br>- Separated Love Profile into dedicated file (978 lines, 60 questions)<br>- Fixed import conflicts and QuestionWeight type mismatches<br>- Implemented cross-test Personality Type question aggregation in SummaryService<br>- Added real question/answer text loading with i18n support<br>- Added percentage influence display (weight/totalWeight × 100)<br>- Summary screen now shows questions from ALL tests, not just 16 Types<br>- Updated TODO: 9 items completed (+3 new) |
| 3.1.0 | 2025-11-08 | Claude Code | **UI TESTS COMPLETE:** Critical widget tests implemented<br>- Added 3 widget test files (1,340 lines, 32+ tests)<br>- test_screen_test.dart: Fast clicking, race condition protection<br>- test_result_saving_test.dart: Data persistence, integrity<br>- language_switch_test.dart: i18n switching, UI updates<br>- Test coverage: 2,649 → 3,989 lines (+50%)<br>- Updated TODO list: 6 completed items |
| 3.0.0 | 2025-11-08 | Claude Code | **MAJOR REFACTOR:** Documentation restructuring<br>- Split CLAUDE.md into modular docs/ directory<br>- Created 6 specialized guides (Architecture, Testing, etc.)<br>- Reduced main file from ~900 to ~400 lines<br>- Added CHANGELOG.md for version tracking<br>- Improved navigation and findability |
| 2.1.0 | 2025-11-08 | Claude Code | Critical fix: blocking issue during fast clicks |
| 2.0.0 | 2025-11-08 | Claude Code | Major update: architecture analysis and refresh |
| 1.1.0 | 2025-11-04 | Claude Code | Added race condition bug fix documentation |
| 1.0.0 | 2025-10-28 | Claude Code | Initial documentation via codebase analysis |

---

**Last Updated:** 2025-01-16
**Document Version:** 3.12.0
**Codebase State:** ~38,000+ lines across 63+ files (+266% growth since v1.0.0)
**Test Coverage:** 9 test files, 3,989 lines, ~35 unit tests
**Psychological Tests:** 13 tests across 5 categories (616 total questions)
**Architecture Status:** Production-ready with clean separation of concerns
**Test Architecture:** 11 Legacy Dart + 2 JSON = 13 total tests
**Recent Updates:**
- Love Languages Test добавлен (v3.12.0) ⭐ NEW
- Исправлена Ошибка #14 (test.id vs testResult.testId)
- Документация обновлена: ADDING_TEST_ERRORS.md теперь 14 ошибок

---

> **📖 For detailed information, navigate to the respective documentation file in the `docs/` directory.**
