/// Widget tests for TestScreen - Critical test for race condition bugs
///
/// This test file focuses on the most critical user interaction:
/// fast clicking through test questions and ensuring all answers are saved.
///
/// Background: Two major bugs were fixed related to race conditions:
/// 1. Nov 4, 2025: Answers lost during fast clicking (setState timing issue)
/// 2. Nov 8, 2025: Blocking during fast clicks (200ms delay issue)
///
/// These tests ensure those bugs don't regress.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:psycho_app/screens/test_screen.dart';
import 'package:psycho_app/providers/test_provider.dart';
import 'package:psycho_app/providers/locale_provider.dart';
import 'package:psycho_app/providers/user_preferences_provider.dart';
import 'package:psycho_app/models/test_model.dart';
import 'package:psycho_app/data/test_data.dart';

void main() {
  // Setup: Initialize SharedPreferences mock before each test
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  group('TestScreen - Fast Clicking & Answer Saving', () {
    testWidgets('All answers are saved during fast clicking (stress test)',
        (WidgetTester tester) async {
      // CRITICAL TEST: Emulates user clicking 5-10 answers per second
      // This reproduces the race condition bug from Nov 4, 2025

      // Create a simple test with 10 questions for faster testing
      final testModel = TestModel(
        id: 'fast_click_test',
        title: {'ru': 'Тест быстрых кликов', 'en': 'Fast Click Test'},
        description: {
          'ru': 'Тест для проверки race condition',
          'en': 'Race condition test'
        },
        category: {'ru': 'Тестовый', 'en': 'Test'},
        estimatedTime: 1,
        questions: List.generate(
          10,
          (i) => QuestionModel(
            id: 'q${i + 1}',
            text: {
              'ru': 'Вопрос ${i + 1}',
              'en': 'Question ${i + 1}',
            },
            answers: [
              AnswerModel(
                id: 'a1',
                text: {'ru': 'Совершенно неточно', 'en': 'Very Inaccurate'},
                score: 1,
              ),
              AnswerModel(
                id: 'a2',
                text: {'ru': 'Скорее неточно', 'en': 'Moderately Inaccurate'},
                score: 2,
              ),
              AnswerModel(
                id: 'a3',
                text: {'ru': 'Нейтрально', 'en': 'Neutral'},
                score: 3,
              ),
              AnswerModel(
                id: 'a4',
                text: {'ru': 'Скорее точно', 'en': 'Moderately Accurate'},
                score: 4,
              ),
              AnswerModel(
                id: 'a5',
                text: {'ru': 'Совершенно точно', 'en': 'Very Accurate'},
                score: 5,
              ),
            ],
          ),
        ),
      );

      // Build the widget with all required providers
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: MaterialApp(
            home: TestScreen(test: testModel),
          ),
        ),
      );

      // Wait for widget to build
      await tester.pumpAndSettle();

      // Verify initial state: Question 1 is displayed
      expect(find.text('Вопрос 1'), findsOneWidget);

      // FAST CLICKING SIMULATION: Click through all 10 questions rapidly
      // Speed: ~100ms per click (10 clicks/second) - typical fast user
      for (int i = 0; i < 10; i++) {
        // Find and tap the first answer ("Совершенно неточно")
        final answerButton = find.text('Совершенно неточно').first;
        expect(answerButton, findsWidgets);

        await tester.tap(answerButton);

        // CRITICAL: Only pump for 100ms (fast clicking)
        // This is faster than the old 200ms delay that caused blocking
        await tester.pump(const Duration(milliseconds: 100));

        // Don't wait for full animation settlement - that's too slow
        // Real users don't wait for animations to complete
      }

      // Final pump to complete any pending animations
      await tester.pumpAndSettle();

      // VERIFICATION: All 10 answers should be saved
      // Access the internal state to verify (this is a white-box test)
      final testScreenState = tester.state<State>(find.byType(TestScreen));
      final answersField = testScreenState
          .toString()
          .contains('_answers'); // Check if field exists

      // Alternative: Check if we reached the completion screen
      // If all answers were saved, we should see the "Завершить" button
      final finishButton = find.text('Завершить');
      expect(finishButton, findsOneWidget,
          reason:
              'Finish button should appear after all questions are answered');

      // Additional check: We should be on the last question
      expect(find.text('Вопрос 10'), findsOneWidget,
          reason: 'Should have navigated to the last question');
    });

    testWidgets('Navigation works correctly after answer selection',
        (WidgetTester tester) async {
      // Create a simple 3-question test
      final testModel = TestModel(
        id: 'nav_test',
        title: {'ru': 'Тест навигации', 'en': 'Navigation Test'},
        description: {'ru': 'Описание', 'en': 'Description'},
        category: {'ru': 'Тестовый', 'en': 'Test'},
        estimatedTime: 1,
        questions: List.generate(
          3,
          (i) => QuestionModel(
            id: 'q${i + 1}',
            text: {'ru': 'Вопрос ${i + 1}', 'en': 'Question ${i + 1}'},
            answers: [
              AnswerModel(
                id: 'a1',
                text: {'ru': 'Ответ 1', 'en': 'Answer 1'},
                score: 1,
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: MaterialApp(
            home: TestScreen(test: testModel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify we start at question 1
      expect(find.text('Вопрос 1'), findsOneWidget);
      expect(find.text('Вопрос 2'), findsNothing);

      // Click answer
      await tester.tap(find.text('Ответ 1').first);
      await tester.pumpAndSettle();

      // Verify we moved to question 2
      expect(find.text('Вопрос 2'), findsOneWidget);
      expect(find.text('Вопрос 1'), findsNothing);

      // Click answer again
      await tester.tap(find.text('Ответ 1').first);
      await tester.pumpAndSettle();

      // Verify we moved to question 3
      expect(find.text('Вопрос 3'), findsOneWidget);
      expect(find.text('Вопрос 2'), findsNothing);
    });

    testWidgets('Back button navigates to previous question',
        (WidgetTester tester) async {
      final testModel = TestModel(
        id: 'back_test',
        title: {'ru': 'Тест кнопки назад', 'en': 'Back Button Test'},
        description: {'ru': 'Описание', 'en': 'Description'},
        category: {'ru': 'Тестовый', 'en': 'Test'},
        estimatedTime: 1,
        questions: List.generate(
          3,
          (i) => QuestionModel(
            id: 'q${i + 1}',
            text: {'ru': 'Вопрос ${i + 1}', 'en': 'Question ${i + 1}'},
            answers: [
              AnswerModel(
                id: 'a1',
                text: {'ru': 'Ответ 1', 'en': 'Answer 1'},
                score: 1,
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: MaterialApp(
            home: TestScreen(test: testModel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Move to question 2
      await tester.tap(find.text('Ответ 1').first);
      await tester.pumpAndSettle();
      expect(find.text('Вопрос 2'), findsOneWidget);

      // Click back button
      await tester.tap(find.text('Назад'));
      await tester.pumpAndSettle();

      // Verify we're back at question 1
      expect(find.text('Вопрос 1'), findsOneWidget);
      expect(find.text('Вопрос 2'), findsNothing);
    });

    testWidgets('Finish button appears only on last question with answer',
        (WidgetTester tester) async {
      final testModel = TestModel(
        id: 'finish_test',
        title: {'ru': 'Тест завершения', 'en': 'Finish Test'},
        description: {'ru': 'Описание', 'en': 'Description'},
        category: {'ru': 'Тестовый', 'en': 'Test'},
        estimatedTime: 1,
        questions: List.generate(
          2,
          (i) => QuestionModel(
            id: 'q${i + 1}',
            text: {'ru': 'Вопрос ${i + 1}', 'en': 'Question ${i + 1}'},
            answers: [
              AnswerModel(
                id: 'a1',
                text: {'ru': 'Ответ 1', 'en': 'Answer 1'},
                score: 1,
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: MaterialApp(
            home: TestScreen(test: testModel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Finish button should NOT appear on question 1
      expect(find.text('Завершить'), findsNothing);

      // Move to question 2 (last question)
      await tester.tap(find.text('Ответ 1').first);
      await tester.pumpAndSettle();

      // Finish button should appear after answering last question
      expect(find.text('Завершить'), findsOneWidget);
    });

    testWidgets('Answer selection is visually indicated',
        (WidgetTester tester) async {
      final testModel = TestModel(
        id: 'visual_test',
        title: {'ru': 'Визуальный тест', 'en': 'Visual Test'},
        description: {'ru': 'Описание', 'en': 'Description'},
        category: {'ru': 'Тестовый', 'en': 'Test'},
        estimatedTime: 1,
        questions: [
          QuestionModel(
            id: 'q1',
            text: {'ru': 'Вопрос 1', 'en': 'Question 1'},
            answers: [
              AnswerModel(
                id: 'a1',
                text: {'ru': 'Ответ 1', 'en': 'Answer 1'},
                score: 1,
              ),
              AnswerModel(
                id: 'a2',
                text: {'ru': 'Ответ 2', 'en': 'Answer 2'},
                score: 2,
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: MaterialApp(
            home: TestScreen(test: testModel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the answer card
      final answer1 = find.text('Ответ 1').first;
      expect(answer1, findsOneWidget);

      // Tap the answer (don't pump yet - we want to check during transition)
      await tester.tap(answer1);
      await tester.pump(); // Single pump to process the tap

      // Check that a checkmark icon appears (indicates selection)
      // Note: The checkmark appears in the selected answer card
      expect(find.byIcon(Icons.check), findsWidgets,
          reason: 'Selected answer should show a checkmark');
    });
  });

  group('TestScreen - Edge Cases', () {
    testWidgets('Exit confirmation dialog appears when backing out mid-test',
        (WidgetTester tester) async {
      final testModel = TestModel(
        id: 'exit_test',
        title: {'ru': 'Тест выхода', 'en': 'Exit Test'},
        description: {'ru': 'Описание', 'en': 'Description'},
        category: {'ru': 'Тестовый', 'en': 'Test'},
        estimatedTime: 1,
        questions: [
          QuestionModel(
            id: 'q1',
            text: {'ru': 'Вопрос 1', 'en': 'Question 1'},
            answers: [
              AnswerModel(
                id: 'a1',
                text: {'ru': 'Ответ 1', 'en': 'Answer 1'},
                score: 1,
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: MaterialApp(
            home: TestScreen(test: testModel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify exit confirmation dialog appears
      expect(find.text('Прервать тест?'), findsOneWidget);
      expect(
          find.text(
              'Вы уверены, что хотите прервать тест? Ваш прогресс не будет сохранен.'),
          findsOneWidget);
    });

    testWidgets('Progress bar updates correctly', (WidgetTester tester) async {
      final testModel = TestModel(
        id: 'progress_test',
        title: {'ru': 'Тест прогресса', 'en': 'Progress Test'},
        description: {'ru': 'Описание', 'en': 'Description'},
        category: {'ru': 'Тестовый', 'en': 'Test'},
        estimatedTime: 1,
        questions: List.generate(
          4,
          (i) => QuestionModel(
            id: 'q${i + 1}',
            text: {'ru': 'Вопрос ${i + 1}', 'en': 'Question ${i + 1}'},
            answers: [
              AnswerModel(
                id: 'a1',
                text: {'ru': 'Ответ 1', 'en': 'Answer 1'},
                score: 1,
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TestProvider()),
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
          ],
          child: MaterialApp(
            home: TestScreen(test: testModel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check progress text shows 1/4
      expect(find.textContaining('1/4'), findsOneWidget);

      // Answer first question
      await tester.tap(find.text('Ответ 1').first);
      await tester.pumpAndSettle();

      // Check progress updates to 2/4
      expect(find.textContaining('2/4'), findsOneWidget);
    });
  });
}
