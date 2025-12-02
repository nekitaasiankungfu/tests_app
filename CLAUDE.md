# CLAUDE.MD - Project Guidelines

> **Comprehensive documentation moved to `docs/` directory.**
> This file contains quick reference and essential information for Claude Code.

---

## ⚠️ КРИТИЧЕСКИ ВАЖНО: Добавление новых тестов

> **ЭТО ПРАВИЛО ОБЯЗАТЕЛЬНО ДЛЯ ВЫПОЛНЕНИЯ!**
> При добавлении ЛЮБОГО нового теста СНАЧАЛА прочитай документацию, ЗАТЕМ выполняй работу.

### 🔴 ОБЯЗАТЕЛЬНЫЕ ШАГИ (в этом порядке!)

1. **СНАЧАЛА** прочитать `docs/adding-new-test/ADDING_TEST_RULES.md` (8 критических правил)
2. **ЗАТЕМ** прочитать `docs/adding-new-test/ADDING_TEST_CHECKLIST.md` (78 пунктов, v3.5.0)
3. **⭐ НОВОЕ v3.5.0:** Создавать профили результатов СРАЗУ после интеграции (ФАЗА 5), ПЕРЕД тестированием (ФАЗА 6)!
4. **ИСПОЛЬЗОВАТЬ** `bash tools/validate_test.sh test_id` после создания weights файла

### 🔴 ПРАВИЛО #6: Используй ТОЛЬКО существующие 195 шкал!

**❌ ЗАПРЕЩЕНО** выдумывать новые шкалы! Все шкалы ДОЛЖНЫ существовать в `hierarchical_scales.dart`.

<details>
<summary>📋 Полный список 195 валидных hierarchical шкал (нажми чтобы развернуть)</summary>

```
abstract_reasoning, acceptance, accountability, achievement_motivation, achievement_striving,
achievement_value, actions, active_listening, activity, adaptability_leadership, aesthetics,
affection_expression, affiliation_motivation, altruism, ambition, analytical_thinking, anger,
anxiety, anxious_attachment, artistic_appreciation, assertiveness, attention_control,
authenticity, autonomy_need, autonomy_wellbeing, avoidant_attachment, avoidant_coping,
benevolence, body_image, boundary_setting, callousness, calmness, catastrophizing, charisma,
cognitive_flexibility, cognitive_reappraisal, commitment, communication_quality, compassion,
competence, competence_need, compliance, composure, confidence_building, conflict_management,
conflict_resolution, conformity, convergent_thinking, cooperativeness, critical_thinking,
curiosity, decisiveness, decisiveness_behavior, delegation, deliberation, dependability,
depression, diligence, divergent_thinking, dominance, drive_for_excellence, dutifulness,
elaboration, emotion_focused_coping, emotional_intelligence, emotional_intimacy,
emotional_openness, emotional_reactivity, emotional_resilience, empathy, entitlement,
environmental_mastery, excitement_seeking, expressiveness, extrinsic_motivation, fantasy,
fear_of_abandonment, feelings, flexibility_creative, fluency, forgiveness, frustration_tolerance,
gender_identity_comfort, grandiosity, gregariousness, growth_mindset, happiness, harm_avoidance,
hedonism, humor, ideas, identity_clarity, identity_flexibility, impulsiveness,
impulsivity_behavior, impulsivity_dark, inspirational_motivation, intellectual_curiosity,
intimacy_comfort, intrinsic_motivation, jealousy, learning_ability, life_satisfaction,
liveliness, loyalty, machiavellianism, manipulation, maturity, meaning_purpose, mentoring,
mindfulness_coping, modesty, mood_stability, narcissism, negotiation, networking,
nonverbal_communication, novelty_seeking, numerical_ability, order, organization, originality,
overall_adjustment, panic_tendency, passion_vitality, patience, perfectionism, persistence,
personal_growth, persuasion, physical_intimacy, playfulness, politeness, positive_emotions,
positive_relations, power_motivation, power_value, problem_focused_coping, problem_solving,
processing_speed, procrastination, prudence, psychopathy, punctuality, relatedness_need,
relationship_security, reliability_partnership, resilience_meta, responsibility,
reward_dependence, risk_taking, risk_taking_creative, rumination, secure_attachment,
security_value, self_acceptance, self_awareness, self_compassion, self_consciousness,
self_direction, self_discipline, self_efficacy, self_esteem, self_monitoring, sensation_seeking,
shared_goals, social_boldness, social_confidence, social_perception, social_support_seeking,
spatial_reasoning, spontaneity, stimulation, straightforwardness, strategic_thinking,
stress_tolerance, support_giving, team_building, tender_mindedness, tradition, trust,
trust_in_relationships, type_a_behavior, universalism, values, verbal_communication,
verbal_intelligence, vision, vitality, vulnerability, vulnerability_sharing, warmth, wisdom,
working_memory, worry_tendency
```

</details>

### 🔴 8 биполярных полюсов (Personality Type)

**ТОЛЬКО положительные веса!** Вместо `-0.5` на `extraversion` используй `+0.5` на `introversion`.

- `extraversion` ↔ `introversion`
- `sensing` ↔ `intuition`
- `thinking` ↔ `feeling`
- `judging` ↔ `perceiving`

### 🔴 8 точек интеграции (ВСЕ обязательны!)

| # | Файл | Что добавить |
|---|------|--------------|
| 1 | `lib/data/test_registry.dart` | import + тест в allTests |
| 2 | `lib/services/test_loader_service.dart` | import + case в _loadLegacyTest |
| 3 | `lib/services/test_service.dart` | import + 3 блока (maxScore, factorNames, interpretations) |
| 4 | `lib/services/summary_service.dart` | import + weights в 2 местах |
| 5 | `lib/screens/summary_screen.dart` | import + 2 switch cases |
| 6 | `lib/config/summary_config.dart` | import + weights в _weights |
| 7 | `lib/services/profile_service.dart` | import + 4 места (если есть профили) |
| 8 | Weights файл | Создать в question_weights/ |

### 🔴 ОБЯЗАТЕЛЬНАЯ проверка после создания weights

```bash
bash tools/validate_test.sh your_test_id
```

> ⚠️ **СТОП! Перед продолжением работы:**
> 1. Запустить validate_test.sh
> 2. Показать результат пользователю
> 3. Исправить ВСЕ ошибки перед интеграцией
> 4. НЕ ПРОДОЛЖАТЬ если есть ошибки в CHECK B (невалидные шкалы)!

Скрипт проверит:
- **CHECK A:** Файлы существуют
- **CHECK B:** Валидность всех шкал (КРИТИЧНО!)
- **CHECK C:** Отсутствие дубликатов ключей
- **CHECK D:** Отсутствие отрицательных весов на биполярных полюсах
- **CHECK E-J:** Регистрацию во всех точках интеграции

### 📚 Справочник шкал

Полный список 195 шкал с категориями: [`docs/adding-new-test/ADDING_TEST_REFERENCE.md`](docs/adding-new-test/ADDING_TEST_REFERENCE.md)

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

- **29 psychological tests in 7 categories** (25 standard + 3 special + 1 profile test)
- **195 psychological scales** for aggregate personality analysis
- **Universal profile system** - 25 tests with 7-section detailed profiles ⭐
- **ProfileService** - Automatic profile display in results ⭐
- **Visual Micro Tests** - 10 visual micro-tests with trait accumulation scoring ⭐ NEW
- **Multilingual support** (Russian/English)
- **Daily mood tracking** and result history
- **Cross-test personality type calculation**
- **Theme customization** (6 pastel colors + dark mode)
- **Offline-first architecture** with local persistence

📖 **For detailed test descriptions:** [`docs/TESTS_REFERENCE.md`](docs/TESTS_REFERENCE.md)

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
| **Logger** | ^2.0.2 | Production Logging ⭐ |

### Dependencies

**Production:**
- `provider: ^6.0.5` - State management
- `shared_preferences: ^2.2.2` - Key-value storage
- `cupertino_icons: ^1.0.2` - iOS icons
- `logger: ^2.0.2` - Production logging

**Development:**
- `flutter_test` - Testing framework
- `flutter_lints: ^4.0.0` - Dart linting

---

## Quick Start

### Setup

```bash
# Check Flutter installation
flutter doctor

# Install dependencies
flutter pub get

# Run on device/emulator
flutter run
```

### Development Commands

```bash
flutter run          # Run app
dart format lib/     # Format code
flutter analyze      # Analyze code
flutter test         # Run tests
flutter build apk    # Build for Android
flutter build ios    # Build for iOS
```

---

## Architecture Overview

The application follows a **Provider-based Clean Architecture** with clear separation of concerns:

```
Presentation Layer (Screens, Widgets)
         ↓
Provider Layer (State Management)
         ↓
Service Layer (Business Logic)
         ↓
Model Layer (Data Models)
         ↓
Utilities & Constants
         ↓
Data & Config Layer (Test Data, Storage)
```

### Key Layers

- **Presentation** (`lib/screens/`, `lib/widgets/`) - UI components
- **Providers** (`lib/providers/`) - State management (5 providers)
- **Services** (`lib/services/`) - Business logic (ProfileService, SummaryService, etc.)
- **Models** (`lib/models/`) - Data structures (TestProfile, TestCategory, etc.)
- **Utils** (`lib/utils/`) - Shared utilities
- **Constants** (`lib/constants/`) - Centralized constants
- **Data** (`lib/data/`) - Test content
- **Config** (`lib/config/`) - App configuration

**📖 For detailed architecture, see:** [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)

---

## Project Structure

```
├── lib/                           # Main application (~63,000 lines)
│   ├── main.dart                  # App entry point
│   ├── config/                    # Configuration
│   │   └── summary/question_weights/  # Personality type weights
│   ├── data/                      # Test data (28+ files)
│   ├── models/                    # Data models
│   ├── providers/                 # State management (5 providers)
│   ├── services/                  # Business logic
│   ├── screens/                   # UI screens (15+ files)
│   └── widgets/                   # Reusable components
├── test/                          # Tests (9 files, 3,989 lines)
├── docs/                          # Documentation
│   ├── ARCHITECTURE.md
│   ├── TESTING.md
│   ├── SECURITY.md
│   ├── DEPLOYMENT.md
│   ├── TODO_LIST.md              # Current TODO items ⭐ NEW
│   ├── REVISION_HISTORY.md       # Detailed version history ⭐ NEW
│   └── adding-new-test/          # Test creation guides
│       ├── ADDING_NEW_TEST_INDEX.md       # Main index (v3.5.0)
│       ├── ADDING_TEST_CHECKLIST.md       # 78-point checklist
│       ├── ADDING_TEST_RULES.md           # 8 critical rules
│       ├── ADDING_TEST_ERRORS.md          # 16 common errors
│       ├── ADDING_TEST_FAILURES.md        # Case study of failures ⭐ NEW
│       ├── ADDING_TEST_EXAMPLES.md        # Code templates
│       ├── ADDING_SPECIAL_TESTS.md        # Special tests guide
│       └── ADDING_TEST_RESULTS.md         # 7-section results
├── android/                       # Android platform
├── ios/                           # iOS platform
├── pubspec.yaml                   # Dependencies
├── CHANGELOG.md                   # Version history
└── README.md                      # Project overview (Russian)
```

**Total Growth:** 10,347 → ~67,000 lines (+548%)
**Latest Addition:** Visual Micro Tests (10 visual micro-tests, trait accumulation, top-5 results)

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

  rethrow;
}
```

**Features:**
- ✅ Centralized logging with `appLogger`
- ✅ User-facing error dialogs
- ✅ 9 custom exception types
- ✅ Error recovery mechanisms

### Documentation Requirements

**Current State:** ~8-10% coverage

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

## Current Status

**Latest Version:** 3.28.0 (2025-12-02)

### Recent Addition: Visual Micro Tests ⭐ NEW

- **Special test type** - custom screen with visual interface
- **10 visual micro-tests** - quick perception-based assessments
- **Trait accumulation scoring** - 15 personality traits scored across tests
- **Top-5 results** - Shows strongest 5 traits with descriptions
- **Overall portrait** - Synthesized personality description
- **Auto-save** - Results saved automatically (no manual save button)
- **New "Visual" category** - 7th test category
- **11 new files** - Complete architecture: models, screens, widgets, service, data

### Architecture Details

**Files Added:**
- `lib/models/visual_micro_tests_model.dart` - Data models (MicroTest, TraitProfile, VisualMicroTestsResult)
- `lib/screens/visual_micro_tests_screen.dart` - Main test screen with progress tracking
- `lib/screens/visual_micro_tests_result_screen.dart` - Results display with top-5 traits
- `lib/widgets/visual_micro_test_widget.dart` - Individual micro-test widget
- `lib/services/visual_micro_tests_service.dart` - Scoring and result generation
- `lib/data/visual_micro_tests_data.dart` - Test content and trait mappings
- `lib/data/tests/visual_micro_tests_test.dart` - TestStub for registration
- `add_tests/visual_micro_tests.json` - Source test data

**Integration Points:**
- TestRegistry - Registered as special test (type='special')
- Results screen - Custom navigation with JSON serialization/deserialization
- Home screen - New "Visual" category with icon and description

### Progress

**Completed:**
- ✅ 29 psychological tests implemented (25 std + 3 special + 1 profile)
- ✅ Visual Micro Tests with custom architecture ⭐ NEW
- ✅ Universal profile system (ProfileService)
- ✅ Production-ready error handling
- ✅ Comprehensive test documentation
- ✅ Critical UI tests

**In Progress:**
- 🔄 Documentation coverage (target: 60%+)
- 🔄 Test coverage (target: 60% of codebase)

**📊 For complete TODO list:** [`docs/TODO_LIST.md`](docs/TODO_LIST.md)
**📖 For detailed version history:** [`docs/REVISION_HISTORY.md`](docs/REVISION_HISTORY.md)

---

## Key Files Reference

| Component | File | Purpose |
|-----------|------|---------|
| **Entry** | `lib/main.dart` | App initialization |
| **Home** | `lib/screens/home_screen.dart` | Test selection |
| **Testing** | `lib/screens/test_screen.dart` | Standard test interface |
| **Visual Tests** | `lib/screens/visual_micro_tests_screen.dart` | Visual micro-tests ⭐ NEW |
| **Results** | `lib/screens/test_result_screen.dart` | Result display + profiles |
| **Summary** | `lib/screens/summary_screen.dart` | Personality analysis |
| **Scales** | `lib/config/summary/hierarchical_scales.dart` | 195 scales definition |
| **ProfileService** | `lib/services/profile_service.dart` | Universal profile system |
| **TestProfile** | `lib/models/test_profile_model.dart` | Profile model |
| **Service** | `lib/services/test_service.dart` | Test logic |
| **Registry** | `lib/data/test_registry.dart` | All tests list |

**📖 For complete file listing:** [`docs/FILES_MAP.md`](docs/FILES_MAP.md)

---

## Documentation Index

### 📚 Detailed Guides

All comprehensive documentation is in the `docs/` directory:

- **[Architecture Guide](docs/ARCHITECTURE.md)** - Detailed architecture, layers, data flow
- **[Bug Fixes](docs/BUGFIXES.md)** - Critical bug fixes and lessons learned
- **[Testing Guide](docs/TESTING.md)** - Test structure, coverage, best practices
- **[Security Guide](docs/SECURITY.md)** - Security posture, vulnerabilities
- **[Deployment Guide](docs/DEPLOYMENT.md)** - Build configuration, release checklist
- **[Performance Guide](docs/PERFORMANCE.md)** - Performance metrics, optimization
- **[TODO List](docs/TODO_LIST.md)** ⭐ - Current tasks and progress
- **[Revision History](docs/REVISION_HISTORY.md)** ⭐ - Detailed version history

### 🎨 Adding New Tests Documentation

Comprehensive modular guide for adding psychological tests (v3.5.0):

- **[Main Index](docs/adding-new-test/ADDING_NEW_TEST_INDEX.md)** - Navigation hub, quick start
- **[78-Point Checklist](docs/adding-new-test/ADDING_TEST_CHECKLIST.md)** - Complete implementation checklist
- **[8 Critical Rules](docs/adding-new-test/ADDING_TEST_RULES.md)** - Must-follow rules
- **[16 Common Errors](docs/adding-new-test/ADDING_TEST_ERRORS.md)** - Typical mistakes and solutions
- **[Failure Case Study](docs/adding-new-test/ADDING_TEST_FAILURES.md)** ⭐ **NEW** - Learn from mistakes!
- **[Code Templates](docs/adding-new-test/ADDING_TEST_EXAMPLES.md)** - Ready-to-use examples
- **[7-Section Results](docs/adding-new-test/ADDING_TEST_RESULTS.md)** - Enhanced result structure
- **[Special Tests Guide](docs/adding-new-test/ADDING_SPECIAL_TESTS.md)** - Visual/interactive tests

### 📄 Other Documentation

- **[README.md](README.md)** - Project overview (Russian)
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and release notes
- **[IMPLEMENTATION_NOTES.md](IMPLEMENTATION_NOTES.md)** - Feature implementation details

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
- **Thomas-Kilmann TKI** - Conflict Mode Instrument

---

## Contact & Support

**Project Maintainer:** [Add your contact info]
**Repository:** [Add Git repository URL]
**Issue Tracker:** [Add issue tracker URL]

---

## Quick Reference

### Latest Version

**Version:** 3.28.0
**Date:** 2025-12-02
**Codebase:** ~67,000 lines
**Tests:** 29 (25 std + 3 special + 1 profile)

### Recent Changes

**v3.28.0 (2025-12-02):** Visual Micro Tests Added ⭐ NEW
- **Special test type** - custom visual interface with 10 micro-tests
- **Trait accumulation** - 15 personality traits scored across tests
- **Top-5 results** - Shows strongest traits with icons and descriptions
- **Overall portrait** - AI-synthesized personality description
- **Auto-save** - No manual save button, results saved automatically
- **New category:** Visual (7th category)
- **Architecture:**
  - 11 new files (models, screens, widgets, service, data)
  - Custom navigation with JSON serialization/deserialization
  - TestRegistry integration as special test
  - Results screen handles restoration from JSON

**v3.27.0 (2025-12-02):** Creative Type Test Added
- 48 questions (40 frequency + 8 multiple choice)
- 6 creative types + 2 additional scales
- Dual question format with 6 profiles

**v3.26.0 (2025-12-01):** Conflict Communication Style Test
**v3.25.0 (2025-12-01):** Attachment Styles Test
**v3.24.0 (2025-11-30):** Values and Priorities Test

**📖 See [docs/REVISION_HISTORY.md](docs/REVISION_HISTORY.md) for full history**

---

**Last Updated:** 2025-12-02 | **Version:** 3.28.0

> **📖 For detailed information, navigate to the `docs/` directory.**
