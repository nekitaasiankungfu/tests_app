import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/test_model.dart';
import '../providers/test_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../services/test_service.dart';
import '../utils/theme_utils.dart';
import '../utils/app_logger.dart';
import '../constants/color_constants.dart';
import 'test_result_screen.dart';
import 'love_profile_result_screen.dart';
import 'sixteen_types_result_screen.dart';

class TestScreen extends StatefulWidget {
  final TestModel test;

  const TestScreen({super.key, required this.test});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _currentQuestionIndex = 0;
  Map<String, String> _answers = {};
  bool _isTestCompleted = false;
  TestResult? _completedTestResult;
  final TestService _testService = TestService(); // Business logic service

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final languageCode = localeProvider.locale.languageCode;
    final themeColor = prefsProvider.themeColor;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return PopScope(
      canPop: _isTestCompleted,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && !_isTestCompleted) {
          _onBackPressed(context, languageCode);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.test.getTitle(languageCode)),
          backgroundColor: themeColor,
          foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _onBackPressed(context, languageCode),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ThemeUtils.getScreenGradient(themeColor, brightness),
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: Column(
            children: [
              _buildProgressBar(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: _isTestCompleted
                      ? _buildCompletionScreen(languageCode, isDark)
                      : _buildQuestionScreen(languageCode, isDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final languageCode = localeProvider.locale.languageCode;
    final themeColor = prefsProvider.themeColor;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final progress = (_currentQuestionIndex + 1) / widget.test.questions.length;

    // Progress bar text should be readable on gradient background
    final progressTextColor = isDark ? Colors.white : AppColors.getDarkerShade(themeColor, 0.3);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                languageCode == 'ru'
                    ? 'Вопрос ${_currentQuestionIndex + 1} из ${widget.test.questions.length}'
                    : 'Question ${_currentQuestionIndex + 1} of ${widget.test.questions.length}',
                style: TextStyle(
                  color: progressTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  color: progressTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: isDark ? Colors.white.withOpacity(0.2) : themeColor.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              isDark ? Colors.white : themeColor
            ),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionScreen(String languageCode, bool isDark) {
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final themeColor = prefsProvider.themeColor;
    final brightness = Theme.of(context).brightness;

    // Защита от выхода за пределы массива
    if (_currentQuestionIndex >= widget.test.questions.length) {
      appLogger.w('ВНИМАНИЕ: _currentQuestionIndex=$_currentQuestionIndex >= ${widget.test.questions.length}');
      // Если индекс вышел за пределы, сразу завершаем тест
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_isTestCompleted) {
          _completeTest();
        }
      });
      return const Center(child: CircularProgressIndicator());
    }

    final question = widget.test.questions[_currentQuestionIndex];
    final isLastQuestion = _currentQuestionIndex == widget.test.questions.length - 1;

    // DEBUG: Логируем только каждый 10-й вопрос, чтобы не захламлять логи
    if (_currentQuestionIndex % 10 == 0 || _currentQuestionIndex == 0) {
      appLogger.d('Отображается вопрос ${_currentQuestionIndex + 1}/${widget.test.questions.length}, id=${question.id}');
      appLogger.d('Уже ответили на ${_answers.length} вопросов');
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: themeColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              question.getText(languageCode),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: question.answers.length,
              itemBuilder: (context, index) {
                final answer = question.answers[index];
                final isSelected = _answers[question.id] == answer.id;

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Card(
                    elevation: isSelected ? 5 : 2,
                    color: isSelected
                        ? (isDark ? themeColor.withOpacity(0.2) : themeColor)
                        : ThemeUtils.getCardColor(brightness),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: isSelected ? themeColor : (isDark ? Colors.grey[600]! : Colors.grey.withOpacity(0.3)),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        final previousAnswer = _answers[question.id];

                        // ВАЖНО: Сохраняем ответ СРАЗУ (синхронно)
                        _answers[question.id] = answer.id;

                        // DEBUG: Логируем сохранение ответа
                        if (previousAnswer == null) {
                          appLogger.d('✅ Новый ответ: вопрос=${question.id}, ответ=${answer.id}, всего=${_answers.length}/${widget.test.questions.length}');
                        } else {
                          appLogger.d('🔄 Изменен: вопрос=${question.id}, ${previousAnswer}→${answer.id}');
                        }

                        // Обновляем UI и переходим к следующему вопросу
                        setState(() {
                          // Помечаем что ответ выбран
                          if (!isLastQuestion) {
                            _currentQuestionIndex++;
                          }
                        });
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? (isDark ? themeColor : Colors.white)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: isSelected
                                      ? (isDark ? themeColor : ThemeUtils.getButtonTextColor(themeColor))
                                      : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: isSelected
                                  ? Icon(
                                      Icons.check,
                                      color: isDark ? Colors.white : themeColor,
                                      size: 16,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                answer.getText(languageCode),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? (isDark ? themeColor : ThemeUtils.getButtonTextColor(themeColor))
                                      : (isDark ? Colors.white : Colors.black87),
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              if (_currentQuestionIndex > 0)
                Expanded(
                  child: ElevatedButton(
                    onPressed: _previousQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? Colors.grey[700] : Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(languageCode == 'ru' ? 'Назад' : 'Back'),
                  ),
                ),
              if (isLastQuestion && _answers[question.id] != null) ...[
                if (_currentQuestionIndex > 0) const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _completeTest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      foregroundColor: ThemeUtils.getButtonTextColor(themeColor),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(languageCode == 'ru' ? 'Завершить' : 'Finish'),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCompletionScreen(String languageCode, bool isDark) {
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final themeColor = prefsProvider.themeColor;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              languageCode == 'ru' ? 'Тест завершен!' : 'Test completed!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.green[300] : Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              languageCode == 'ru'
                  ? 'Спасибо за прохождение теста. Результаты готовы.'
                  : 'Thank you for taking the test. Results are ready.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey[400] : Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _showResults,
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                foregroundColor: ThemeUtils.getButtonTextColor(themeColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                languageCode == 'ru' ? 'Посмотреть результаты' : 'View Results',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                languageCode == 'ru' ? 'Вернуться к списку тестов' : 'Back to test list',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _nextQuestion() {
    // Проверяем, что не вышли за пределы массива вопросов
    if (_currentQuestionIndex < widget.test.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    // Проверяем, что не вышли за пределы массива (не ушли в отрицательные индексы)
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _completeTest() async {
    appLogger.d('===== _completeTest() ВЫЗВАН =====');
    appLogger.d('testId: ${widget.test.id}');
    appLogger.d('type: ${widget.test.type}');
    appLogger.d('isBipolar: ${widget.test.isBipolar}');

    // ВАЖНО: Проверяем, что ответили на ВСЕ вопросы
    final totalQuestions = widget.test.questions.length;
    final answeredQuestions = _answers.length;

    if (answeredQuestions < totalQuestions) {
      appLogger.w('ВНИМАНИЕ! Не все вопросы отвечены: $answeredQuestions/$totalQuestions');

      // Находим неотвеченные вопросы используя сервис
      final unansweredQuestions = _testService.validateAllQuestionsAnswered(widget.test, _answers);
      appLogger.d('Неотвеченные вопросы: ${unansweredQuestions.join(", ")}');

      // Показываем предупреждение пользователю
      final languageCode = Localizations.localeOf(context).languageCode;
      final shouldContinue = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(languageCode == 'ru' ? 'Не все вопросы отвечены' : 'Not all questions answered'),
            content: Text(
              languageCode == 'ru'
                  ? 'Вы ответили только на $answeredQuestions из $totalQuestions вопросов.\n\nРезультаты могут быть неточными. Хотите завершить тест?'
                  : 'You answered only $answeredQuestions out of $totalQuestions questions.\n\nResults may be inaccurate. Do you want to complete the test?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(languageCode == 'ru' ? 'Продолжить тест' : 'Continue test'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(languageCode == 'ru' ? 'Завершить' : 'Finish'),
              ),
            ],
          );
        },
      );

      if (shouldContinue != true) {
        appLogger.d('Пользователь отменил завершение теста');
        // Находим первый неотвеченный вопрос и возвращаемся к нему
        final unansweredQuestions = _testService.validateAllQuestionsAnswered(widget.test, _answers);
        if (unansweredQuestions.isNotEmpty) {
          final firstUnansweredIndex = widget.test.questions.indexWhere(
            (q) => unansweredQuestions.contains(q.id)
          );
          if (firstUnansweredIndex >= 0) {
            setState(() {
              _currentQuestionIndex = firstUnansweredIndex;
            });
            appLogger.d('Переход к первому неотвеченному вопросу: индекс=$firstUnansweredIndex');
          }
        }
        return; // Возвращаемся к тесту
      }
      appLogger.d('Пользователь подтвердил завершение с неполными ответами');
    }
    appLogger.d('bipolarDimensions: ${widget.test.bipolarDimensions}');

    setState(() {
      _isTestCompleted = true;
    });

    // Используем TestService для расчета результатов
    final languageCode = Localizations.localeOf(context).languageCode;
    final result = await _testService.completeTest(widget.test, _answers, languageCode);

    // Сохраняем результат
    final testProvider = Provider.of<TestProvider>(context, listen: false);
    await testProvider.saveTestResult(result);

    setState(() {
      _completedTestResult = result;
    });
  }


  void _showResults() {
    if (_completedTestResult != null) {
      // Специальный экран результатов для теста "16 типов личности"
      if (widget.test.id == 'sixteen_types') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SixteenTypesResultScreen(
              result: _completedTestResult!,
            ),
          ),
        );
      }
      // Специальный экран результатов для теста "Профиль любви"
      else if (widget.test.id == 'love_profile') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoveProfileResultScreen(
              result: _completedTestResult!,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TestResultScreen(
              result: _completedTestResult!,
            ),
          ),
        );
      }
    }
  }

  Future<void> _onBackPressed(BuildContext context, String languageCode) async {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    // Если тест не завершен, показываем диалог подтверждения
    if (!_isTestCompleted) {
      final shouldExit = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: ThemeUtils.getCardColor(brightness),
          title: Text(
            languageCode == 'ru' ? 'Прервать тест?' : 'Exit Test?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ThemeUtils.getBodyTextColor(brightness),
            ),
          ),
          content: Text(
            languageCode == 'ru'
                ? 'Вы уверены, что хотите прервать тест? Ваш прогресс не будет сохранен.'
                : 'Are you sure you want to exit the test? Your progress will not be saved.',
            style: TextStyle(
              color: ThemeUtils.getBodyTextColor(brightness),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                languageCode == 'ru' ? 'Продолжить тест' : 'Continue Test',
                style: TextStyle(color: ThemeUtils.getSecondaryTextColor(brightness)),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                languageCode == 'ru' ? 'Выйти' : 'Exit',
              ),
            ),
          ],
        ),
      );

      if (shouldExit == true) {
        Navigator.pop(context);
      }
    } else {
      // Если тест завершен, просто выходим
      Navigator.pop(context);
    }
  }

}
