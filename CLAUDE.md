# CLAUDE.MD - Project Guidelines

> **Comprehensive documentation moved to `docs/` directory.**
> This file contains quick reference and essential information for Claude Code.

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

- **27 psychological tests in 5 categories** (24 standard + 2 special + 1 profile test)
- **195 psychological scales** for aggregate personality analysis
- **Universal profile system** - 24 tests with 7-section detailed profiles ⭐
- **ProfileService** - Automatic profile display in results ⭐
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

**Total Growth:** 10,347 → ~63,000 lines (+509%)
**Latest Addition:** Conflict Communication Style Test (45 questions, 5 styles, TKI model)

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

**Latest Version:** 3.26.0 (2025-12-01)

### Recent Addition: Conflict Communication Style Test

- 45 вопросов, 5 стилей конфликтного поведения
- Based on Thomas-Kilmann Conflict Mode Instrument (TKI)
- Multi-choice format с ситуационными вопросами
- 5 profiles с 7-секционной структурой
- 32 шкалы (24 hierarchical + 8 personality type poles)

### Progress

**Completed:**
- ✅ 27 psychological tests implemented
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

**Version:** 3.26.0
**Date:** 2025-12-01
**Codebase:** ~63,000 lines
**Tests:** 27 (24 std + 2 special + 1 profile)

### Recent Changes

**v3.26.0 (2025-12-01):** Conflict Communication Style Test Added
- 45 вопросов, 5 стилей конфликтного поведения
- Thomas-Kilmann Conflict Mode Instrument (TKI)
- Multi-choice format с ситуационными вопросами
- 5 profiles с 7-секционной структурой
- **Критические исправления:**
  - Удалены 45 невалидных шкал
  - Исправлено использование биполярных полюсов
  - Переработана архитектура multi-choice тестов

**v3.25.0 (2025-12-01):** Attachment Styles Test
**v3.24.0 (2025-11-30):** Values and Priorities Test
**v3.23.0 (2025-11-30):** Universal Profile System Merge

**📖 See [docs/REVISION_HISTORY.md](docs/REVISION_HISTORY.md) for full history**

---

**Last Updated:** 2025-12-01 | **Version:** 3.26.0

> **📖 For detailed information, navigate to the `docs/` directory.**
