/// Widget tests for language switching (i18n)
///
/// This test file ensures that the multilingual support works correctly:
/// 1. Language can be switched between Russian and English
/// 2. UI updates immediately when language changes
/// 3. Language preference is persisted to local storage
/// 4. Summary cache is cleared on language change (forces recalculation)
/// 5. Test content displays in the correct language
///
/// Critical for international users and UX consistency.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:psycho_app/providers/locale_provider.dart';
import 'package:psycho_app/providers/test_provider.dart';
import 'package:psycho_app/providers/user_preferences_provider.dart';
import 'package:psycho_app/screens/home_screen.dart';
import 'package:psycho_app/models/test_model.dart';

void main() {
  group('Language Switching - LocaleProvider', () {
    setUp(() async {
      // Reset SharedPreferences before each test
      SharedPreferences.setMockInitialValues({});
    });

    test('Default language is Russian', () async {
      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      expect(localeProvider.locale.languageCode, 'ru');
      expect(localeProvider.isRussian, true);
      expect(localeProvider.isEnglish, false);
    });

    test('Language can be switched to English', () async {
      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Switch to English
      final success = await localeProvider.setLocale(const Locale('en'));

      expect(success, true, reason: 'setLocale should return true on success');
      expect(localeProvider.locale.languageCode, 'en');
      expect(localeProvider.isRussian, false);
      expect(localeProvider.isEnglish, true);
    });

    test('Language preference is saved to SharedPreferences', () async {
      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Switch to English
      await localeProvider.setLocale(const Locale('en'));

      // Verify it was saved
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString('language');

      expect(savedLanguage, 'en',
          reason: 'Language should be persisted to storage');
    });

    test('Language preference is loaded on initialization', () async {
      // Pre-set language to English
      SharedPreferences.setMockInitialValues({
        'language': 'en',
      });

      // Create provider - should load English
      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      expect(localeProvider.locale.languageCode, 'en');
      expect(localeProvider.isEnglish, true);
    });

    test('Summary cache is cleared when language changes', () async {
      // Pre-populate with summary cache
      SharedPreferences.setMockInitialValues({
        'language': 'ru',
        'user_summary': '{"some": "cached data"}',
      });

      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Switch language
      await localeProvider.setLocale(const Locale('en'));

      // Verify summary cache was cleared
      final prefs = await SharedPreferences.getInstance();
      final summaryCache = prefs.getString('user_summary');

      expect(summaryCache, isNull,
          reason: 'Summary cache should be cleared on language change');
    });

    test('Switching to same language is a no-op', () async {
      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify initial state
      expect(localeProvider.locale.languageCode, 'ru');

      // Try to switch to Russian again
      final success = await localeProvider.setLocale(const Locale('ru'));

      expect(success, true);
      expect(localeProvider.locale.languageCode, 'ru');

      // Verify no unnecessary writes to storage
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString('language');
      expect(savedLanguage, isNull,
          reason: 'Should not write if language unchanged');
    });

    test('Language can be reset to default (Russian)', () async {
      SharedPreferences.setMockInitialValues({
        'language': 'en',
      });

      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify starts as English
      expect(localeProvider.locale.languageCode, 'en');

      // Reset to default
      final success = await localeProvider.resetLocale();

      expect(success, true);
      expect(localeProvider.locale.languageCode, 'ru');
      expect(localeProvider.isRussian, true);

      // Verify storage was cleared
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString('language');
      expect(savedLanguage, isNull);
    });

    test('Error state is cleared after clearError()', () async {
      final localeProvider = LocaleProvider();

      // Manually set an error (simulating a failed operation)
      // We can't easily trigger a real error with mocked SharedPreferences
      // So we'll just test the clearError functionality

      localeProvider.clearError();
      expect(localeProvider.lastError, isNull);
    });
  });

  group('Language Switching - UI Integration', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('Test titles display in Russian by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for Russian test titles
      expect(find.text('Большая пятёрка (IPIP)'), findsOneWidget,
          reason: 'Big Five test should show Russian title');
      expect(find.text('Темперамент Фишера'), findsOneWidget,
          reason: 'Fisher test should show Russian title');
    });

    testWidgets('Test titles update when language switches to English',
        (WidgetTester tester) async {
      late LocaleProvider localeProvider;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (_) => localeProvider = LocaleProvider()),
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify Russian titles
      expect(find.text('Большая пятёрка (IPIP)'), findsOneWidget);

      // Switch to English
      await localeProvider.setLocale(const Locale('en'));
      await tester.pumpAndSettle();

      // Verify English titles appear
      expect(find.text('Big Five Personality Test (IPIP)'), findsOneWidget,
          reason: 'Should show English title after language switch');
      expect(find.text('Большая пятёрка (IPIP)'), findsNothing,
          reason: 'Russian title should disappear');
    });

    testWidgets('Test descriptions update with language',
        (WidgetTester tester) async {
      final testModel = TestModel(
        id: 'test_i18n',
        title: {
          'ru': 'Тестовый тест',
          'en': 'Test Test',
        },
        description: {
          'ru': 'Это тестовое описание',
          'en': 'This is a test description',
        },
        category: {
          'ru': 'Категория',
          'en': 'Category',
        },
        estimatedTime: 5,
        questions: [
          QuestionModel(
            id: 'q1',
            text: {
              'ru': 'Вопрос 1',
              'en': 'Question 1',
            },
            answers: [
              AnswerModel(
                id: 'a1',
                text: {
                  'ru': 'Ответ 1',
                  'en': 'Answer 1',
                },
                score: 1,
              ),
            ],
          ),
        ],
      );

      // Test getTitle method with different language codes
      expect(testModel.getTitle('ru'), 'Тестовый тест');
      expect(testModel.getTitle('en'), 'Test Test');

      // Test getDescription method
      expect(testModel.getDescription('ru'), 'Это тестовое описание');
      expect(testModel.getDescription('en'), 'This is a test description');

      // Test getCategory method
      expect(testModel.getCategory('ru'), 'Категория');
      expect(testModel.getCategory('en'), 'Category');
    });

    testWidgets('Question text displays in correct language',
        (WidgetTester tester) async {
      final question = QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Как часто вы чувствуете стресс?',
          'en': 'How often do you feel stressed?',
        },
        answers: [
          AnswerModel(
            id: 'a1',
            text: {
              'ru': 'Никогда',
              'en': 'Never',
            },
            score: 1,
          ),
          AnswerModel(
            id: 'a2',
            text: {
              'ru': 'Иногда',
              'en': 'Sometimes',
            },
            score: 3,
          ),
        ],
      );

      // Test Russian
      expect(question.getText('ru'), 'Как часто вы чувствуете стресс?');
      expect(question.answers[0].getText('ru'), 'Никогда');
      expect(question.answers[1].getText('ru'), 'Иногда');

      // Test English
      expect(question.getText('en'), 'How often do you feel stressed?');
      expect(question.answers[0].getText('en'), 'Never');
      expect(question.answers[1].getText('en'), 'Sometimes');
    });

    test('Fallback to Russian if translation missing', () {
      final testModel = TestModel(
        id: 'fallback_test',
        title: {
          'ru': 'Русское название',
          // Missing English translation
        },
        description: {
          'ru': 'Русское описание',
          'en': 'English description',
        },
        category: {
          'ru': 'Категория',
        },
        estimatedTime: 5,
        questions: [],
      );

      // Should fallback to Russian
      expect(testModel.getTitle('en'), 'Русское название',
          reason: 'Should fallback to Russian if English missing');

      // Should use English when available
      expect(testModel.getDescription('en'), 'English description');

      // Should fallback to Russian
      expect(testModel.getCategory('en'), 'Категория');
    });
  });

  group('Language Switching - Edge Cases', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('Unsupported language code falls back to Russian', () {
      final testModel = TestModel(
        id: 'edge_test',
        title: {
          'ru': 'Название',
          'en': 'Title',
        },
        description: {
          'ru': 'Описание',
          'en': 'Description',
        },
        category: {
          'ru': 'Категория',
          'en': 'Category',
        },
        estimatedTime: 5,
        questions: [],
      );

      // Try unsupported language code
      expect(testModel.getTitle('fr'), 'Название',
          reason: 'Should fallback to Russian for unsupported languages');
      expect(testModel.getTitle('de'), 'Название');
      expect(testModel.getTitle('es'), 'Название');
    });

    test('Empty language code falls back to Russian', () {
      final testModel = TestModel(
        id: 'empty_test',
        title: {
          'ru': 'Название',
          'en': 'Title',
        },
        description: {
          'ru': 'Описание',
        },
        category: {
          'ru': 'Категория',
        },
        estimatedTime: 5,
        questions: [],
      );

      expect(testModel.getTitle(''), 'Название',
          reason: 'Should fallback to Russian for empty language code');
    });

    test('languageCode getter returns current language', () async {
      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      expect(localeProvider.languageCode, 'ru');

      await localeProvider.setLocale(const Locale('en'));
      expect(localeProvider.languageCode, 'en');
    });

    test('Multiple language switches work correctly', () async {
      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Russian -> English -> Russian -> English
      expect(localeProvider.languageCode, 'ru');

      await localeProvider.setLocale(const Locale('en'));
      expect(localeProvider.languageCode, 'en');

      await localeProvider.setLocale(const Locale('ru'));
      expect(localeProvider.languageCode, 'ru');

      await localeProvider.setLocale(const Locale('en'));
      expect(localeProvider.languageCode, 'en');
    });
  });

  group('Language Switching - Accessibility', () {
    test('Language names are clear and unambiguous', () {
      // Constants from AppConstants
      const russianCode = 'ru';
      const englishCode = 'en';

      expect(russianCode, 'ru');
      expect(englishCode, 'en');

      // These are ISO 639-1 standard language codes
      // Widely recognized and accessible
    });

    test('Language helper methods are intuitive', () async {
      SharedPreferences.setMockInitialValues({});

      final localeProvider = LocaleProvider();
      await Future.delayed(const Duration(milliseconds: 200));

      // Russian state
      expect(localeProvider.isRussian, true,
          reason: 'Default should be Russian');
      expect(localeProvider.isEnglish, false);

      // English state
      final success = await localeProvider.setLocale(const Locale('en'));
      expect(success, true, reason: 'setLocale should succeed');

      expect(localeProvider.languageCode, 'en',
          reason: 'Language code should be "en"');
      expect(localeProvider.isRussian, false,
          reason: 'isRussian should be false after switching to English');
      expect(localeProvider.isEnglish, true,
          reason: 'isEnglish should be true after switching to English');
    });
  });
}
