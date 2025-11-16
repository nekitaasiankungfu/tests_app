# Architecture Documentation

## Architecture Pattern

The application follows a **Provider-based Clean Architecture** with clear separation of concerns:

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (Screens, Widgets, UI Components)      │
│  + Error Dialogs ⭐ NEW                 │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│         Provider Layer                  │
│  (State Management, UI Notification)    │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│      Service Layer ⭐ NEW                │
│  (Business Logic, Testable)             │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│         Model Layer                     │
│  (Data Models, Validation)              │
│  + Custom Exceptions ⭐ NEW             │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│    Utilities & Constants ⭐ NEW          │
│  (Logger, Theme Utils, Constants)       │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│         Data & Config Layer             │
│  (Test Data, Storage, Configuration)    │
│  + Hierarchical Scales (195) ⭐ NEW     │
└─────────────────────────────────────────┘
```

## Layer Responsibilities

### 1. Data Layer (`lib/data/`)
- **Purpose:** Static test definitions with questions, answers, and interpretations
- **Files (5 tests):**
  - `test_data.dart` - Test registry and loader
  - `ipip_big_five_data.dart` - IPIP Big Five personality test (50 questions)
  - `fisher_temperament_data.dart` - Fisher Temperament test (56 questions)
  - `love_profile_data.dart` - Love Profile test (60 questions)
  - `sixteen_types_data.dart` - 16 Personality Types/Personality Type (80 questions) ⭐ NEW
- **Responsibility:** Provide test content in multiple languages

### 2. Model Layer (`lib/models/`)
- **Purpose:** Define data structures, serialization, and validation
- **Files:**
  - `test_model.dart` - TestModel, QuestionModel, AnswerModel, TestResult, TestQualityValidation
  - `summary_model.dart` - SummaryData, FactorScore, HierarchicalScore, personality axes
- **Responsibility:** Data validation, JSON serialization, type safety

### 3. Service Layer (`lib/services/`) ⭐ NEW
- **Purpose:** Business logic separated from UI (testable without widget context)
- **Files:**
  - `test_service.dart` (853 lines) - Test loading, answer validation, score calculation
  - `summary_service.dart` (387 lines) - Summary calculation with hierarchical scales
- **Responsibility:** Reusable business logic, complex calculations, data transformations

### 4. Provider Layer (`lib/providers/`)
- **Purpose:** State management and UI notification (business logic moved to services)
- **Providers:**
  - `TestProvider` - Manages test list, answers, completed results (uses TestService)
  - `LocaleProvider` - Language preference management
  - `UserPreferencesProvider` - User settings (name, theme, dark mode)
  - `SummaryProvider` - Aggregate personality analysis (uses SummaryService)
- **Responsibility:** State changes, data persistence, UI notifications

### 5. Configuration Layer (`lib/config/`)
- **Purpose:** App-wide configuration, constants, and hierarchical scale system
- **Files (14 files, 9,868 lines):**
  - `summary_config.dart` - Legacy 6-axis system (backward compatibility)
  - `summary_config_new.dart` - New hierarchical system loader
  - `bipolar_scales.dart` - Bipolar scale definitions
  - **`summary/` subdirectory:** ⭐ NEW
    - `hierarchical_scales.dart` - 195 psychological scales in 18 categories
    - `scale_categories.dart` - Category definitions and metadata
    - `personality_type_scales.dart` - Personality Type dimension mappings
    - `legacy_axes.dart` - Legacy system compatibility
    - `test_mappings.dart` - Test-to-scale mappings
    - `question_weights/` - Question weight configurations per test
- **Responsibility:** Define interpretation rules, calculation weights, scale hierarchies

### 6. Utilities & Constants (`lib/utils/`, `lib/constants/`) ⭐ NEW
- **Purpose:** Shared utilities and centralized constants
- **Files:**
  - `utils/app_logger.dart` (31 lines) - Centralized logging with debug/production modes
  - `utils/theme_utils.dart` (90 lines) - Theme generation utilities
  - `constants/app_constants.dart` (46 lines) - Storage keys, UI constants (25+ constants)
  - `constants/color_constants.dart` (102 lines) - Theme colors and helpers
- **Responsibility:** Logging, theme management, shared constants

### 7. Exception Handling (`lib/exceptions/`) ⭐ NEW
- **Purpose:** Custom exception types for validation and error handling
- **Files:**
  - `validation_exceptions.dart` (132 lines) - 9 custom exception types
- **Responsibility:** Type-safe error handling, validation feedback

### 8. Presentation Layer (`lib/screens/`, `lib/widgets/`)
- **Purpose:** User interface and user experience
- **Screens (12 total):**
  - `onboarding_screen.dart` - First-time user setup
  - `mood_check_screen.dart` - Daily mood tracking
  - `home_screen.dart` - Main test selection screen
  - `test_screen.dart` - Test-taking interface
  - `test_result_screen.dart` - Individual test results (multi-factor)
  - `love_profile_result_screen.dart` - Love profile-specific results
  - `sixteen_types_result_screen.dart` - 16 Personality Types results ⭐ NEW
  - `results_screen.dart` - Result history/archive
  - `summary_screen.dart` - Aggregate personality analysis
  - `settings_screen.dart` - User preferences
  - `test_disclaimer_screen.dart` - Test disclaimers
- **Widgets:**
  - `summary_charts.dart` - Chart visualizations for summary analysis
  - `error_dialog.dart` - User-facing error communication ⭐ NEW
- **Responsibility:** Display data, handle user input, navigation, error display

---

## Directory Organization

| Directory | Purpose | File Count | Lines of Code | Status |
|-----------|---------|-----------|---------------|--------|
| `lib/` | Main application source | 45 files | 28,546 lines | +176% ⭐ |
| `lib/config/` | Configuration & scales | 14 files | 9,868 lines | Expanded ⭐ |
| `lib/data/` | Test data and content | 5 files | 5,498 lines | +1 test |
| `lib/models/` | Data models | 2 files | 2,083 lines | Enhanced |
| `lib/providers/` | State management | 4 files | ~900 lines | Refactored |
| `lib/services/` | Business logic | 2 files | 1,240 lines | NEW ⭐ |
| `lib/screens/` | UI screens | 12 files | 8,565 lines | +1 screen |
| `lib/widgets/` | Reusable components | 2 files | ~900 lines | +1 widget |
| `lib/utils/` | Utilities | 2 files | 121 lines | NEW ⭐ |
| `lib/constants/` | App constants | 2 files | 148 lines | NEW ⭐ |
| `lib/exceptions/` | Custom exceptions | 1 file | 132 lines | NEW ⭐ |
| `test/` | Tests | 6 files | 2,649 lines | +26x growth ⭐ |

**Total Growth:** 10,347 → 28,546 lines (+18,199 lines, +176%)

---

## Entry Points & Navigation

### Application Entry Point

**File:** `lib/main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PsychoTestApp());
}
```

### Navigation Flow

```
App Launch
    ↓
Check if First Launch
    ↓
┌───────────────────┐
│  First Launch?    │
└─────┬─────────────┘
      │
  Yes │        No
      │         │
      ↓         ↓
Onboarding → Mood Check → Home Screen
                              ↓
                    ┌─────────┼─────────┐
                    ↓         ↓         ↓
                  Tests   Results   Settings
                    ↓
             ┌──────┴──────┐
             ↓             ↓
      Test Screen    Test Result
                          ↓
                    Save to History
                          ↓
                    Update Summary
```

### Route Configuration

```dart
initialRoute: prefsProvider.isFirstLaunch ? '/onboarding' : '/mood-check'

Routes:
  '/onboarding'  → OnboardingScreen
  '/mood-check'  → MoodCheckScreen
  '/home'        → HomeScreen
```

---

## Data Flow & State Management

### State Management Pattern: Provider

The app uses the **Provider** package for state management with dependency injection.

#### Provider Setup (lib/main.dart)

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
    ChangeNotifierProvider(create: (_) => LocaleProvider()),
    ChangeNotifierProvider(create: (_) => TestProvider()),
    ChangeNotifierProvider(create: (_) => SummaryProvider()),
  ],
  child: MaterialApp(...),
)
```

### Data Flow Diagram

```
User Input (Test Answers)
        ↓
   TestProvider
        ↓
   Save Answers
        ↓
   Calculate Score
        ↓
   Create TestResult
        ↓
SharedPreferences (Local Storage)
        ↓
   Load All Results
        ↓
  SummaryProvider
        ↓
Calculate Aggregate Analysis
        ↓
Display in Summary Screen
```

### Storage Mechanism

**Technology:** SharedPreferences (Key-Value Store)

**Stored Data:**
- Completed test results (JSON serialized)
- User preferences (name, theme color, dark mode)
- Language preference (Russian/English)
- First launch flag
- Last mood check date

**Storage Keys:**
```dart
'completedTests'       // List<TestResult> as JSON
'userName'             // String
'themeColor'           // int (color value)
'isDarkMode'           // bool
'language'             // String ('ru' or 'en')
'isFirstLaunch'        // bool
'lastMoodCheckDate'    // String (ISO 8601)
```

---

## Test System Architecture

### Test Types

The application supports two types of psychological tests:

#### 1. Simple Tests
- Single overall score
- One interpretation result
- Example: Basic personality screening

#### 2. Multi-Factor Tests
- Multiple factor scores (e.g., Big Five: 5 factors)
- Complex interpretation per factor
- Example: IPIP Big Five (Openness, Conscientiousness, Extraversion, Agreeableness, Neuroticism)

### Test Data Structure

```dart
class TestModel {
  final String id;                    // Unique test identifier
  final Map<String, String> name;     // Multilingual test name
  final Map<String, String> description;
  final List<QuestionModel> questions;
  final Map<String, Map<String, dynamic>> interpretations;
  final bool isMultiFactor;           // Simple vs Multi-factor
  final List<String>? factors;        // For multi-factor tests
}
```

### Question Types

**Standard Question:**
```dart
QuestionModel(
  id: 'q1',
  questionText: {'ru': 'Вопрос...', 'en': 'Question...'},
  answers: [AnswerModel(...)],
  isReversed: false,  // Normal scoring
)
```

**Reversed Question:**
```dart
QuestionModel(
  isReversed: true,  // Inverts scoring (5 → 1, 4 → 2, etc.)
)
```

### Summary Analysis System

The **SummaryProvider** aggregates results from multiple tests to create a comprehensive personality profile using a **hierarchical scale system**.

**Architecture V2.0 - Hierarchical Scale System:**
- **195 psychological scales** organized into **18 top-level categories**
- Each test question can contribute to 3-10 scales simultaneously with different weights
- Scores aggregate from subscales → categories for multi-level analysis
- Supports both legacy (v1) and hierarchical (v2) scoring systems for backward compatibility

**18 Top-Level Categories:**
1. **Emotional Stability** (15 subscales) - Stress resilience, anxiety, mood stability
2. **Extraversion & Sociability** (11 subscales) - Social energy, assertiveness, warmth
3. **Agreeableness** (11 subscales) - Empathy, cooperation, trust
4. **Conscientiousness** (12 subscales) - Organization, discipline, responsibility
5. **Openness to Experience** (10 subscales) - Creativity, curiosity, flexibility
6. **Relationship Quality** (24 subscales) - Intimacy, attachment, communication
7. **Cognitive Abilities** (12 subscales) - Analytical thinking, problem-solving, memory
8. **Motivation & Drive** (11 subscales) - Achievement, persistence, autonomy
9. **Social Skills** (15+ subscales) - Emotional intelligence, conflict resolution
10. **Dark Triad** - Narcissism, Machiavellianism, psychopathy
11. **Leadership** - Influence, decision-making, team building
12. **Values** - Moral compass, cultural dimensions
13. **Well-being** - Life satisfaction, happiness, flow
14. **Identity** - Self-concept, authenticity
15. **Stress & Coping** - Resilience strategies
16. **Creativity** - Divergent thinking, innovation
17. **Behavioral Styles** - Time management, risk-taking
18. **Meta-Indicators** - Response consistency, social desirability

**Calculation Method:**
- Each question can map to multiple scales with configurable weights (0.0-1.0)
- Scores normalized to 0-100 scale for each subscale
- Category scores calculated as weighted averages of subscales
- Confidence levels based on test coverage and data quality
- Backward compatible with legacy 6-axis system

---

**Last Updated:** 2025-11-08
