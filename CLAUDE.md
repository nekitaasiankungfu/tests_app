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

- **16 psychological tests organized in 5 categories:**
  - 🎭 **Типология личности:** IPIP Big Five (50 q), 16 Personality Types (80 q), DISC Personality (56 q)
  - 🧠 **Темперамент:** Fisher Temperament (56 q), Temperament Profile (60 q), Social Battery (40 q)
  - ❤️ **Отношения:** Love Profile (60 q), Love Languages (30 q)
  - 🌟 **Эмоциональное состояние:** Stress Test, Self-Esteem Test, Digital Detox (50 q), Burnout Diagnostic (54 q), Color Psychology (6 stages), Anxiety Symptoms Inventory (24 q)
  - 💼 **Карьера:** Holland Code RIASEC (60 q), Career Compass (56 forced_choice)
- **Category-based test grouping** with collapsible sections
- **Two test architectures:**
  - Standard tests (14) - questionnaires with Likert scales
  - Special tests (2) - visual/interactive with custom UI (Color Psychology, Career Compass)
- Multilingual support (Russian/English)
- Daily mood tracking
- Result history and archive
- Aggregate summary analysis with **195 psychological scales**
- **Cross-test personality type calculation** - all tests contribute to personality type
- **Automatic direction detection** - negative weights auto-invert scale values
- **Answer text display** - shows actual answer text in summary (e.g., "2/4 (Иногда)")
- **Color Psychology Test features:**
  - 6 interactive stages (12-15 minutes)
  - 34+ unique interactions
  - Drag-and-drop, paired comparisons, emotional associations
  - Consistency metrics across stages
  - 12 psychological scales
- **Career Compass Test features:** ⭐ NEW
  - 56 forced_choice questions (paired comparisons)
  - 8 career interest scales (people, analysis, creation, technology, business, nature, order, care)
  - Ipsative scoring (points distributed between scales)
  - Radar chart visualization
  - Career profile matching with recommendations
  - ~15 minutes completion time
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
/mnt/r/maindev/
├── lib/                           # Main application (~40,000+ lines)
│   ├── main.dart                  # App entry point
│   ├── config/                    # Configuration (17 files, 12,700 lines)
│   │   └── summary/question_weights/  # Personality type weights (8 files)
│   │       ├── sixteen_types_weights.dart  # 80 questions
│   │       ├── digital_detox_weights.dart  # 50 questions
│   │       ├── burnout_diagnostic_weights.dart  # 54 questions
│   │       └── ...
│   ├── data/                      # Test data (14+ files, 10,000+ lines)
│   │   ├── color_psychology_data.dart  # Color Psychology test data ⭐ NEW
│   │   └── ...
│   ├── models/                    # Data models (4+ files, 3,000+ lines)
│   │   ├── test_model.dart        # TestModel with categoryId
│   │   ├── test_category.dart     # Category definitions
│   │   ├── color_psychology_model.dart  # Color test models ⭐ NEW
│   │   └── summary_model.dart
│   ├── providers/                 # State management (5 files)
│   │   ├── category_provider.dart # Category state
│   │   └── ...
│   ├── services/                  # Business logic (3+ files, 2,500+ lines)
│   │   ├── summary_service.dart   # Cross-test personality type
│   │   ├── color_psychology_service.dart  # Color test scoring ⭐ NEW
│   │   └── ...
│   ├── utils/                     # Utilities (2 files, 121 lines)
│   ├── constants/                 # Constants (2 files, 148 lines)
│   ├── exceptions/                # Custom exceptions (132 lines)
│   ├── screens/                   # UI screens (14+ files, 11,000+ lines)
│   │   ├── home_screen.dart       # Grouped categories
│   │   ├── color_psychology_test_screen.dart     # Color test main screen ⭐ NEW
│   │   ├── color_psychology_result_screen.dart   # Color test results (1150 lines) ⭐ NEW
│   │   └── ...
│   └── widgets/                   # Reusable components (9+ files)
│       ├── color_selection_widget.dart              # Stage 1: Quick choice ⭐ NEW
│       ├── color_ranking_widget.dart                # Stage 2: Ranking ⭐ NEW
│       ├── color_paired_comparisons_widget.dart     # Stage 3: Paired comparisons ⭐ NEW
│       ├── color_emotional_associations_widget.dart # Stage 4: Emotions ⭐ NEW
│       ├── color_life_domains_widget.dart           # Stage 5: Life domains ⭐ NEW
│       ├── color_temporal_perspective_widget.dart   # Stage 6: Time perspective ⭐ NEW
│       └── ...
├── test/                          # Tests (9 files, 3,989 lines)
│   ├── services/                  # Service tests (2 files)
│   ├── widgets/                   # Widget tests (3 files)
│   ├── model_validation_test.dart
│   ├── personality_type_scales_test.dart
│   ├── summary_test.dart
│   └── widget_test.dart
├── docs/                          # Documentation
│   ├── ARCHITECTURE.md
│   ├── BUGFIXES.md
│   ├── TESTING.md
│   ├── SECURITY.md
│   ├── DEPLOYMENT.md
│   ├── PERFORMANCE.md
│   └── adding-new-test/           # Test creation guides ⭐ UPDATED
│       ├── ADDING_NEW_TEST_INDEX.md       # Main index (v3.2.0)
│       ├── ADDING_TEST_CHECKLIST.md       # 65-point checklist
│       ├── ADDING_TEST_RULES.md           # 8 critical rules
│       ├── ADDING_TEST_ERRORS.md          # 14 common errors
│       ├── ADDING_TEST_EXAMPLES.md        # Code templates
│       └── ADDING_SPECIAL_TESTS.md        # Special tests guide (v1.2.0) - Color + Career Compass
├── android/                       # Android platform
├── ios/                           # iOS platform
├── pubspec.yaml                   # Dependencies
├── CHANGELOG.md                   # Version history
├── CLAUDE.md                      # This file
└── README.md                      # Project overview (Russian)
```

**Total Growth:** 10,347 → 42,000+ lines (+305%)
**Latest Addition:** Career Compass Test - 56 forced_choice questions, 8 career scales, radar chart, ipsative scoring

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

### ✅ Completed (18 major items)

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
11. ✅ **Legacy Dart Architecture** - All tests use Legacy Dart (13/14) except 1 special test
12. ✅ **Digital Detox Test** - Technology addiction diagnostic (50 questions, 7 factors)
13. ✅ **Burnout Diagnostic Test** - Professional burnout assessment (54 questions, 7 factors)
14. ✅ **DISC Personality Test** - Behavioral assessment (56 questions, 4 factors)
15. ✅ **Social Battery Test** - Social energy assessment (40 questions, 6 factors)
16. ✅ **Holland Code Test** - Career interests RIASEC (60 questions, 6 factors)
17. ✅ **Love Languages Test** - Five love languages (30 questions, 5 languages)
18. ✅ **Color Psychology Test** - Visual projective test (6 stages, 12 scales, 34+ interactions)
19. ✅ **Anxiety Symptoms Inventory** - Anxiety assessment (24 questions, 4 factors, 5 minutes) ⭐ NEW

### 🔄 In Progress

20. 🔄 **Large File Refactoring** - Services extracted, data files remain
21. 🔄 **Documentation Coverage** - 5-7% (target: 60%+) - improved with special tests guide
22. 🔄 **Test Coverage** - 3,989 lines, ~35 tests (target: 60% of codebase)

### 🔴 High Priority

23. 🔴 **Encrypted Storage** - Migrate to `flutter_secure_storage` (4-6 hours)
24. 🔴 **Incomplete TODOs** - Resolve remaining TODO items in code (3-4 hours)

### 🟢 Low Priority

25. 🟢 **i18n Enhancement** - ARB-based internationalization (10 hours)
26. 🟢 **Analytics** - Firebase Analytics integration (4 hours)
27. 🟢 **Accessibility** - Screen reader support (8 hours)
28. ~~🟢 **JSON Test Data** - Extract to JSON files~~ **CANCELLED** - Using Legacy Dart + Special architecture

**📊 Progress:** 19 critical items completed, 3 in progress, 2 high-priority remaining

**📌 Architecture Decisions:**
- Legacy Dart chosen for standard tests (scalability, performance, type safety)
- Special architecture for visual/interactive tests (Color Psychology as reference)

---

## Key Files Reference

| File | Lines | Purpose |
|------|-------|---------|
| **Core Application Files** |||
| `lib/main.dart` | 171 | App entry point, theme setup |
| `lib/screens/home_screen.dart` | 398 | Test selection, navigation |
| `lib/screens/test_screen.dart` | 631 | Test-taking interface (standard tests) |
| `lib/services/test_service.dart` | 853 | Test business logic |
| `lib/services/summary_service.dart` | 387 | Summary calculation |
| `lib/config/summary/hierarchical_scales.dart` | 5,068 | 195 psychological scales |
| **Standard Tests Data** |||
| `lib/data/digital_detox_data.dart` | 1,150 | Digital Detox test (50 questions) |
| `lib/data/burnout_diagnostic_data.dart` | 1,540 | Burnout Diagnostic test (54 questions) |
| `lib/data/holland_code_data.dart` | 1,150 | Holland Code test (60 questions) |
| `lib/config/summary/question_weights/holland_code_weights.dart` | 960 | Holland Code weights |
| **Anxiety Symptoms Inventory** ||| ⭐ NEW
| `lib/data/tests/anxiety_symptoms_inventory_test.dart` | 90 | Test stub with metadata |
| `lib/data/anxiety_symptoms_inventory_data.dart` | 500 | 24 questions (bilingual), 4 factors |
| `lib/config/summary/question_weights/anxiety_symptoms_inventory_weights.dart` | 430 | Weights mapping (~30 scales) |
| **Color Psychology Test (Special)** |||
| `lib/models/color_psychology_model.dart` | 280 | Color test data models (6 result types) |
| `lib/data/color_psychology_data.dart` | 450 | Color test data (10 colors, 8 emotions, scales) |
| `lib/screens/color_psychology_test_screen.dart` | 495 | Main test screen (6 stages management) |
| `lib/screens/color_psychology_result_screen.dart` | 1,150 | Results screen (all 6 stages display) |
| `lib/services/color_psychology_service.dart` | 850 | Color test scoring (12 scales + metrics) |
| `lib/widgets/color_selection_widget.dart` | 200 | Stage 1: Quick choice (30 sec) |
| `lib/widgets/color_ranking_widget.dart` | 250 | Stage 2: Drag-and-drop ranking (60 sec) |
| `lib/widgets/color_paired_comparisons_widget.dart` | 280 | Stage 3: Paired comparisons (2 min) |
| `lib/widgets/color_emotional_associations_widget.dart` | 220 | Stage 4: Emotional associations |
| `lib/widgets/color_life_domains_widget.dart` | 260 | Stage 5: Life domains + situations |
| `lib/widgets/color_temporal_perspective_widget.dart` | 230 | Stage 6: Temporal perspective |
| **Career Compass Test (Special)** ||| ⭐ NEW
| `lib/models/career_compass_model.dart` | 210 | Career test models (ForcedChoice, Config) |
| `lib/data/career_compass_data.dart` | 700 | 56 questions, 8 scales, profiles, interpretations |
| `lib/screens/career_compass_test_screen.dart` | 410 | Main test screen (intro + questions) |
| `lib/screens/career_compass_result_screen.dart` | 700 | Results with radar chart, profiles |
| `lib/services/career_compass_service.dart` | 200 | Ipsative scoring, profile matching |
| `lib/widgets/career_compass_question_widget.dart` | 300 | Forced choice UI (A vs B cards) |
| `lib/data/tests/career_compass_test.dart` | 145 | Test stub (questions: []) |

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

### 🎨 Adding New Tests Documentation ⭐ UPDATED

Comprehensive modular guide for adding psychological tests (v3.2.0):

- **[Main Index](docs/adding-new-test/ADDING_NEW_TEST_INDEX.md)** - Navigation hub, quick start guide
- **[65-Point Checklist](docs/adding-new-test/ADDING_TEST_CHECKLIST.md)** - Complete implementation checklist
- **[8 Critical Rules](docs/adding-new-test/ADDING_TEST_RULES.md)** - Must-follow rules to avoid bugs
- **[14 Common Errors](docs/adding-new-test/ADDING_TEST_ERRORS.md)** - Typical mistakes and solutions
- **[Code Templates](docs/adding-new-test/ADDING_TEST_EXAMPLES.md)** - Ready-to-use code examples
- **[Special Tests Guide](docs/adding-new-test/ADDING_SPECIAL_TESTS.md)** (v1.2.0) - Visual/interactive tests
  - When to use special architecture vs standard
  - **Two types of special tests:**
    - Visual tests (Color Psychology - 6 stages, drag-and-drop)
    - **Forced Choice tests (Career Compass - 56 paired comparisons)** ⭐ NEW
  - Critical `maxScaleScore` calculation formula
  - Complete widget examples and checklists

### 📄 Other Documentation

- **[README.md](README.md)** - Project overview (Russian)
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and release notes
- **[IMPLEMENTATION_NOTES.md](IMPLEMENTATION_NOTES.md)** - Feature implementation details
- **[ARCHITECTURE_ANALYSIS.md](ARCHITECTURE_ANALYSIS.md)** - Architecture comparison report

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
| 3.15.0 | 2025-11-23 | Claude Code | **Merge: Anxiety Symptoms Inventory + Career Compass** ⭐<br>- **Объединение двух тестов из параллельных веток**<br>- **Anxiety Symptoms Inventory:** 24 вопроса, 4 фактора (somatic, cognitive, affective, behavioral), 4-point intensity scale (0-3)<br>- **Career Compass:** 56 forced_choice вопросов, 8 шкал, ipsative scoring<br>- **Всего тестов:** 16 (14 стандартных + 2 специальных)<br>- **Test Architecture:** 14 Legacy Dart + 2 Special = 16 total tests |
| 3.14.0 | 2025-11-23 | Claude Code | **Anxiety Symptoms Inventory Test Added** ⭐<br>- **Новый тест:** Anxiety Symptoms Inventory (24 вопроса, 4 фактора, 5 минут)<br>- **4 Factors:** somatic (телесные), cognitive (когнитивные), affective (эмоциональные), behavioral (поведенческие)<br>- **4-point intensity scale:** scores 0-3 (Совсем нет / Слегка / Умеренно / Сильно)<br>- **Interpretation levels:** minimal (0-20%), mild (21-42%), moderate (43-69%), severe (70-100%)<br>- **Created 3 files:**<br>  • Test stub: `anxiety_symptoms_inventory_test.dart` (90 lines)<br>  • Data file: `anxiety_symptoms_inventory_data.dart` (500 lines, bilingual ru/en)<br>  • Weights: `anxiety_symptoms_inventory_weights.dart` (430 lines, ~30 scales)<br>- **Integrated in 7 files:** test_registry, test_loader_service, test_service (3 blocks), summary_service (2 places), summary_screen (2 switches), summary_config<br>- **Scales mapped:** anxiety, panic_tendency, stress_tolerance, emotional_resilience, worry_tendency, attention_control, calmness, composure, vulnerability, neuroticism, and more<br>- **Note:** Does NOT affect 4 bipolar personality type scales (E/I, S/N, T/F, J/P) - тест измеряет симптоматику, а не когнитивные предпочтения<br>- **Всего тестов:** 15 (14 стандартных + 1 специальный)<br>- **Test Architecture:** 14 Legacy Dart + 1 Special = 15 total tests |
| 3.14.0-career | 2025-01-23 | Claude Code | **Career Compass Test Added** ⭐ NEW<br>- **Новый тест:** Career Compass (56 forced_choice вопросов, 8 шкал, ~15 минут)<br>- **Второй специальный тест** - использует парные сравнения (A vs B)<br>- **8 Career Interest Scales:** people, analysis, creation, technology, business, nature, order, care<br>- **Ipsative Scoring:** очки распределяются между выбранными шкалами<br>- **Created 7 files:**<br>  • Models: `career_compass_model.dart` (210 lines)<br>  • Data: `career_compass_data.dart` (700 lines, 56 questions, 8 profiles)<br>  • Widget: `career_compass_question_widget.dart` (300 lines, VS cards)<br>  • Service: `career_compass_service.dart` (200 lines, ipsative scoring)<br>  • Main screen: `career_compass_test_screen.dart` (410 lines)<br>  • Results: `career_compass_result_screen.dart` (700 lines, radar chart)<br>  • Test stub: `career_compass_test.dart` (145 lines)<br>- **Bug fix:** maxScaleScore исправлен с 7 на 14 (формула: questions×2/scales)<br>- **Documentation updated:**<br>  • `ADDING_SPECIAL_TESTS.md` v1.2.0 - добавлен Forced Choice раздел<br>  • `ADDING_NEW_TEST_INDEX.md` v3.2.0 - Career Compass в примерах<br>- **Всего тестов:** 15 (13 стандартных + 2 специальных)<br>- **Test Architecture:** 13 Legacy Dart + 2 Special = 15 total tests |
| 3.13.0 | 2025-01-18 | Claude Code | **Color Psychology Test + Special Tests Architecture** ⭐ MAJOR<br>- **Новый тест:** Color Psychology (6 этапов, 12-15 минут, 34+ взаимодействий)<br>- **Первый тест со специальной архитектурой** - не использует стандартный вопрос-ответ формат<br>- **6 Interactive Stages:**<br>  1. Быстрый выбор (30 сек, 3+3 цвета)<br>  2. Ранжирование (60 сек, drag-and-drop всех 10 цветов)<br>  3. Парные сравнения (2 мин, 20 пар из 45)<br>  4. Эмоциональные ассоциации (8 базовых эмоций → цвета)<br>  5. Жизненные сферы (6 сфер + 4 ситуации → цвета)<br>  6. Временная перспектива (прошлое/настоящее/будущее/идеал/страх)<br>- **Created 13 files:**<br>  • Models: `color_psychology_model.dart` (280 lines, 6 result types)<br>  • Data: `color_psychology_data.dart` (450 lines, 10 colors, 8 emotions, 12 scales)<br>  • 7 Widgets: selection, ranking, paired_comparisons, emotional_associations, life_domains, temporal_perspective, association (200-280 lines each)<br>  • Main screen: `color_psychology_test_screen.dart` (495 lines, stage management)<br>  • Results screen: `color_psychology_result_screen.dart` (1,150 lines, all 6 stages display) ⭐<br>  • Service: `color_psychology_service.dart` (850 lines, 12 scales + consistency metrics)<br>  • Test stub: `color_psychology_test.dart` (empty questions list)<br>- **Results screen features:** 12 scales, 6 stage results, consistency metrics, patterns, recommendations<br>- **Documentation updated:**<br>  • `ADDING_NEW_TEST_INDEX.md` v3.1.0 - added special tests section<br>  • `ADDING_SPECIAL_TESTS.md` v1.1.0 created - comprehensive guide (1900+ lines)<br>  • ЭТАП 9 added: Creating results screen (400+ lines of templates and examples)<br>- **Всего тестов:** 14 (13 стандартных + 1 специальный)<br>- **Test Architecture:** 13 Legacy Dart + 1 Special = 14 total tests<br>- **Codebase growth:** 38,000 → 40,000+ lines (+287% с v1.0.0) |
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

**Last Updated:** 2025-11-23
**Document Version:** 3.15.0
**Codebase State:** ~43,000+ lines across 87+ files (+315% growth since v1.0.0)
**Test Coverage:** 9 test files, 3,989 lines, ~35 unit tests
**Psychological Tests:** 16 tests across 5 categories
  - 14 standard tests (664 questions total)
  - 2 special tests:
    - Color Psychology (6 interactive stages, 34+ interactions)
    - Career Compass (56 forced_choice questions, 8 career scales)
**Architecture Status:** Production-ready with dual architecture support
**Test Architecture:** 14 Legacy Dart + 2 Special = 16 total tests
**Recent Updates:**
- Merge: Anxiety Symptoms Inventory + Career Compass (v3.15.0)
- Anxiety Symptoms Inventory: 24 вопроса, 4 фактора, 4-point intensity scale
- Career Compass: 56 forced_choice вопросов, 8 career scales, ipsative scoring

---

> **📖 For detailed information, navigate to the respective documentation file in the `docs/` directory.**
