# Files Map - Карта ключевых файлов проекта

> **Навигация по основным файлам с указанием размера и назначения**
> Последнее обновление: 2025-11-30

## Содержание

1. [Core Application Files](#core-application-files)
2. [Standard Tests Data](#standard-tests-data)
3. [Special Tests](#special-tests)
4. [Profile Tests](#profile-tests)
5. [Configuration & Weights](#configuration--weights)
6. [Services & Providers](#services--providers)
7. [Documentation](#documentation)

---

## Core Application Files

| File | Lines | Purpose |
|------|-------|---------|
| `lib/main.dart` | 171 | App entry point, theme setup |
| `lib/screens/home_screen.dart` | 398 | Test selection with categories, navigation |
| `lib/screens/test_screen.dart` | 631 | Test-taking interface for standard tests |
| `lib/screens/test_result_screen.dart` | 900+ | Universal results display |
| `lib/screens/summary_screen.dart` | 800+ | Aggregate personality analysis |
| `lib/screens/settings_screen.dart` | 250 | User preferences and theme |
| `lib/screens/onboarding_screen.dart` | 150 | First-time user experience |
| `lib/screens/mood_check_screen.dart` | 200 | Daily mood tracking |

---

## Standard Tests Data

### Core Tests (1000+ lines each)

| File | Lines | Test | Questions |
|------|-------|------|-----------|
| `lib/data/sixteen_types_data.dart` | 2,400 | 16 Personality Types | 80 |
| `lib/data/ipip_big_five_data.dart` | 1,500 | IPIP Big Five | 50 |
| `lib/data/disc_personality_data.dart` | 1,680 | DISC Personality | 56 |
| `lib/data/fisher_temperament_data.dart` | 1,680 | Fisher Temperament | 56 |
| `lib/data/temperament_profile_test_data.dart` | 934 | Temperament Profile | 60 |
| `lib/data/love_profile_data.dart` | - | Love Profile | 60 |
| `lib/data/social_battery_data.dart` | 1,200 | Social Battery | 40 |

### Diagnostic Tests

| File | Lines | Test | Questions |
|------|-------|------|-----------|
| `lib/data/digital_detox_data.dart` | 1,150 | Digital Detox | 50 |
| `lib/data/burnout_diagnostic_data.dart` | 1,540 | Burnout Diagnostic | 54 |
| `lib/data/anxiety_symptoms_inventory_data.dart` | 500 | Anxiety Symptoms | 24 |
| `lib/data/depression_symptoms_inventory_data.dart` | 750 | Depression Symptoms | 27 |
| `lib/data/self_confidence_multiscale_data.dart` | 900 | Self Confidence | 36 |

### Relationship Tests

| File | Lines | Test | Questions |
|------|-------|------|-----------|
| `lib/data/love_languages_data.dart` | 750 | Love Languages | 30 |
| `lib/data/romantic_potential_data.dart` | 850 | Romantic Potential | 36 |
| `lib/data/relationship_compatibility_data.dart` | 750 | Relationship Compatibility | 24 |
| `lib/data/friendship_psychology_data.dart` | 900 | Friendship Psychology | 24 |

### Career Tests

| File | Lines | Test | Questions |
|------|-------|------|-----------|
| `lib/data/holland_code_data.dart` | 1,150 | Holland Code RIASEC | 60 |
| `lib/data/cognitive_ability_data.dart` | 900 | Cognitive Ability | 60 |
| `lib/data/digital_career_fit_data.dart` | 800 | Digital Career Fit | 18 |

---

## Special Tests

### Color Psychology Test

| File | Lines | Purpose |
|------|-------|---------|
| `lib/models/color_psychology_model.dart` | 280 | Data models (6 result types) |
| `lib/data/color_psychology_data.dart` | 450 | 10 colors, 8 emotions, scales |
| `lib/screens/color_psychology_test_screen.dart` | 495 | Main test screen (6 stages) |
| `lib/screens/color_psychology_result_screen.dart` | 1,150 | Results display (all stages) |
| `lib/services/color_psychology_service.dart` | 850 | Scoring (12 scales + metrics) |
| **Widgets:** | | |
| `lib/widgets/color_selection_widget.dart` | 200 | Stage 1: Quick choice |
| `lib/widgets/color_ranking_widget.dart` | 250 | Stage 2: Drag-and-drop |
| `lib/widgets/color_paired_comparisons_widget.dart` | 280 | Stage 3: Paired comparisons |
| `lib/widgets/color_emotional_associations_widget.dart` | 220 | Stage 4: Emotions |
| `lib/widgets/color_life_domains_widget.dart` | 260 | Stage 5: Life domains |
| `lib/widgets/color_temporal_perspective_widget.dart` | 230 | Stage 6: Time perspective |

### Career Compass Test

| File | Lines | Purpose |
|------|-------|---------|
| `lib/models/career_compass_model.dart` | 210 | ForcedChoice, Config models |
| `lib/data/career_compass_data.dart` | 700 | 56 questions, 8 scales |
| `lib/screens/career_compass_test_screen.dart` | 410 | Main test screen |
| `lib/screens/career_compass_result_screen.dart` | 700 | Results with radar chart |
| `lib/services/career_compass_service.dart` | 200 | Ipsative scoring |
| `lib/widgets/career_compass_question_widget.dart` | 300 | A vs B choice cards |

---

## Profile Tests

| File | Lines | Purpose |
|------|-------|---------|
| **Digital Career Fit:** | | |
| `lib/data/tests/digital_career_fit_test.dart` | 100 | Test stub |
| `lib/data/digital_career_fit_data.dart` | 800 | 18 questions, 7 profiles |
| **Romantic Potential:** | | |
| `lib/data/tests/romantic_potential_test.dart` | 90 | Test stub |
| `lib/data/romantic_potential_data.dart` | 850 | 36 questions, 3 profiles |
| **Relationship Compatibility:** | | |
| `lib/data/tests/relationship_compatibility_test.dart` | 95 | Test stub |
| `lib/data/relationship_compatibility_data.dart` | 750 | 24 questions, 3 profiles |
| **Friendship Psychology:** | | |
| `lib/data/tests/friendship_psychology_test.dart` | 95 | Test stub |
| `lib/data/friendship_psychology_data.dart` | 900 | 24 questions, 13 profiles |

---

## Configuration & Weights

### Core Configuration

| File | Lines | Purpose |
|------|-------|---------|
| `lib/config/summary/hierarchical_scales.dart` | 5,068 | 195 psychological scales |
| `lib/config/summary_config_new.dart` | 500+ | Summary configuration |
| `lib/config/summary/scale_categories.dart` | 300 | Scale categorization |
| `lib/config/summary/test_mappings.dart` | 200 | Test ID mappings |
| `lib/config/summary/personality_type_scales.dart` | 150 | Personality type scales |

### Question Weights (Major Files)

| File | Lines | Test | Coverage |
|------|-------|------|----------|
| `lib/config/.../sixteen_types_weights.dart` | 1,600 | 16 Types | 80 questions |
| `lib/config/.../digital_detox_weights.dart` | 1,115 | Digital Detox | 50 questions → 195 scales |
| `lib/config/.../burnout_diagnostic_weights.dart` | 1,115 | Burnout | 54 questions → 105 scales |
| `lib/config/.../cognitive_ability_weights.dart` | 1,115 | Cognitive | 60 questions → 15 scales/q |
| `lib/config/.../holland_code_weights.dart` | 960 | Holland Code | 60 questions |
| `lib/config/.../love_profile_weights.dart` | 978 | Love Profile | 60 questions |
| `lib/config/.../romantic_potential_weights.dart` | 750 | Romantic | 36 questions → 60 scales |

---

## Services & Providers

### Services

| File | Lines | Purpose |
|------|-------|---------|
| `lib/services/test_service.dart` | 853 | Test business logic, scoring |
| `lib/services/summary_service.dart` | 387 | Cross-test personality calculation |
| `lib/services/test_loader_service.dart` | 300+ | Test data loading |
| `lib/services/color_psychology_service.dart` | 850 | Color test scoring |
| `lib/services/career_compass_service.dart` | 200 | Career test scoring |

### Providers

| File | Lines | Purpose |
|------|-------|---------|
| `lib/providers/test_provider.dart` | 400+ | Test data and results |
| `lib/providers/locale_provider.dart` | 150 | Language switching |
| `lib/providers/user_preferences_provider.dart` | 300 | Settings and theme |
| `lib/providers/summary_provider.dart` | 200 | Aggregate analysis |
| `lib/providers/category_provider.dart` | 100 | Category grouping |

---

## Documentation

### Main Guides

| File | Lines | Purpose |
|------|-------|---------|
| `CLAUDE.md` | 621 | Project overview for AI |
| `README.md` | 400+ | Project overview (Russian) |
| `CHANGELOG.md` | 800+ | Version history |
| `docs/ARCHITECTURE.md` | 800+ | Detailed architecture |
| `docs/TESTS_REFERENCE.md` | 500+ | All tests catalog |
| `docs/FILES_MAP.md` | 400+ | This file |

### Adding New Test Documentation

| File | Lines | Purpose |
|------|-------|---------|
| `docs/adding-new-test/ADDING_NEW_TEST_INDEX.md` | 300 | Navigation hub |
| `docs/adding-new-test/ADDING_TEST_CHECKLIST.md` | 400 | 75-point checklist |
| `docs/adding-new-test/ADDING_TEST_RULES.md` | 300 | 8 critical rules |
| `docs/adding-new-test/ADDING_TEST_ERRORS.md` | 400 | 15 common errors |
| `docs/adding-new-test/ADDING_TEST_EXAMPLES.md` | 500 | Code templates |
| `docs/adding-new-test/ADDING_TEST_RESULTS.md` | 400 | 7-section results |
| `docs/adding-new-test/ADDING_SPECIAL_TESTS.md` | 1,900 | Special tests guide |

### Other Documentation

| File | Lines | Purpose |
|------|-------|---------|
| `docs/BUGFIXES.md` | 300 | Critical bug fixes |
| `docs/TESTING.md` | 400 | Test structure |
| `docs/SECURITY.md` | 300 | Security posture |
| `docs/DEPLOYMENT.md` | 400 | Build configuration |
| `docs/PERFORMANCE.md` | 300 | Performance metrics |

---

## Statistics

- **Total Files:** 150+
- **Total Lines:** 50,000+
- **Test Files:** 100+ (data, stubs, weights)
- **Documentation:** 10,000+ lines
- **Widget Files:** 20+
- **Service Files:** 5
- **Provider Files:** 5

---

## Quick Navigation Tips

1. **To find a test:** Check `lib/data/tests/` for stubs
2. **To find test data:** Check `lib/data/[test_name]_data.dart`
3. **To find weights:** Check `lib/config/summary/question_weights/`
4. **To find screens:** Check `lib/screens/`
5. **To find documentation:** Check `docs/` directory

---

## См. также

- [CLAUDE.md](../CLAUDE.md) - Основной файл проекта
- [TESTS_REFERENCE.md](TESTS_REFERENCE.md) - Детальное описание тестов
- [ARCHITECTURE.md](ARCHITECTURE.md) - Архитектура приложения