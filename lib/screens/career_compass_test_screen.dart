import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/career_compass_model.dart';
import '../data/career_compass_data.dart';
import '../providers/locale_provider.dart';
import '../widgets/career_compass_question_widget.dart';
import '../services/career_compass_service.dart';
import 'career_compass_result_screen.dart';

/// Экран теста "Карьерный компас" (специальная версия)
///
/// Реализует тест с forced_choice вопросами:
/// - 56 вопросов парного выбора
/// - 8 шкал карьерных интересов
/// - Определение карьерного профиля
///
/// @version: 1.0.0

class CareerCompassTestScreen extends StatefulWidget {
  const CareerCompassTestScreen({super.key});

  @override
  State<CareerCompassTestScreen> createState() => _CareerCompassTestScreenState();
}

class _CareerCompassTestScreenState extends State<CareerCompassTestScreen> {
  // Текущее состояние
  int _currentStage = 0; // 0 - введение, 1 - тест
  int _currentQuestionIndex = 0;

  // Результаты
  final List<ForcedChoiceAnswer> _answers = [];

  // Сервис для обработки результатов
  late final CareerCompassService _service;

  @override
  void initState() {
    super.initState();
    _service = CareerCompassService();
  }

  /// Обработка ответа на вопрос
  void _onAnswer(String scaleId, int responseTimeMs) {
    final question = CareerCompassData.questions[_currentQuestionIndex];

    setState(() {
      _answers.add(ForcedChoiceAnswer(
        questionId: question.id,
        chosenScaleId: scaleId,
        responseTimeMs: responseTimeMs,
      ));

      if (_currentQuestionIndex < CareerCompassData.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Тест завершён
        _processResults();
      }
    });
  }

  /// Обработка результатов
  void _processResults() {
    final result = _service.calculateResult(answers: _answers);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => CareerCompassResultScreen(result: result),
      ),
    );
  }

  /// Начать тест
  void _startTest() {
    setState(() {
      _currentStage = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isRussian = context.watch<LocaleProvider>().isRussian;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isRussian ? 'Карьерный компас' : 'Career Compass',
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _showExitDialog(context, isRussian),
        ),
      ),
      body: _currentStage == 0
          ? _buildIntroduction(context, isRussian)
          : _buildTest(context, isRussian),
    );
  }

  Widget _buildIntroduction(BuildContext context, bool isRussian) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // О тесте
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.explore, size: 32, color: Colors.blue),
                      const SizedBox(width: 12),
                      Text(
                        isRussian ? 'О тесте' : 'About the Test',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isRussian
                        ? '''Выбор профессии — одно из важнейших решений в жизни. Удовлетворённость работой во многом зависит от того, насколько профессия соответствует вашим природным склонностям.

Этот тест поможет вам определить ваши профессиональные склонности по 8 ключевым направлениям:

• 👥 Работа с людьми
• 🔬 Анализ и исследование
• 🎨 Творчество и дизайн
• ⚙️ Техника и технологии
• 📊 Бизнес и управление
• 🌿 Природа и практика
• 📋 Порядок и структура
• 💚 Забота и защита'''
                        : '''Choosing a career is one of the most important decisions in life. Job satisfaction largely depends on how well the profession matches your natural inclinations.

This test will help you determine your professional inclinations in 8 key areas:

• 👥 Working with People
• 🔬 Analysis and Research
• 🎨 Creativity and Design
• ⚙️ Technology and Engineering
• 📊 Business and Management
• 🌿 Nature and Practice
• 📋 Order and Structure
• 💚 Care and Protection''',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Как проходит тест
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.help_outline, size: 28, color: Colors.green),
                      const SizedBox(width: 12),
                      Text(
                        isRussian ? 'Как проходить тест' : 'How to Take the Test',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInstructionItem(
                    context,
                    '1',
                    isRussian
                        ? 'Вам будут предложены 56 пар утверждений'
                        : 'You will be presented with 56 pairs of statements',
                    Icons.format_list_numbered,
                  ),
                  const SizedBox(height: 12),
                  _buildInstructionItem(
                    context,
                    '2',
                    isRussian
                        ? 'В каждой паре выберите то, которое вам БЛИЖЕ'
                        : 'In each pair, choose the one that is CLOSER to you',
                    Icons.touch_app,
                  ),
                  const SizedBox(height: 12),
                  _buildInstructionItem(
                    context,
                    '3',
                    isRussian
                        ? 'Если оба нравятся — выберите тот, который нравится БОЛЬШЕ'
                        : 'If you like both — choose the one you like MORE',
                    Icons.favorite,
                  ),
                  const SizedBox(height: 12),
                  _buildInstructionItem(
                    context,
                    '4',
                    isRussian
                        ? 'Если оба не нравятся — выберите тот, который не нравится МЕНЬШЕ'
                        : 'If you dislike both — choose the one you dislike LESS',
                    Icons.thumb_down_off_alt,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Важное замечание
          Card(
            color: Colors.amber.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: Colors.amber, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isRussian ? 'Важно' : 'Important',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          isRussian
                              ? 'Тест оценивает ваши ИНТЕРЕСЫ и СКЛОННОСТИ, а не способности. '
                                'Высокий балл означает, что эта деятельность вас привлекает — '
                                'но успех в ней также зависит от навыков и практики.'
                              : 'The test evaluates your INTERESTS and INCLINATIONS, not abilities. '
                                'A high score means that this activity attracts you — '
                                'but success also depends on skills and practice.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Время и количество
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    context,
                    Icons.timer,
                    isRussian ? '~15 мин' : '~15 min',
                    isRussian ? 'Время' : 'Time',
                  ),
                  _buildStatItem(
                    context,
                    Icons.quiz,
                    '56',
                    isRussian ? 'Вопросов' : 'Questions',
                  ),
                  _buildStatItem(
                    context,
                    Icons.assessment,
                    '8',
                    isRussian ? 'Шкал' : 'Scales',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Кнопка начать
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _startTest,
              icon: const Icon(Icons.play_arrow),
              label: Text(
                isRussian ? 'Начать тест' : 'Start Test',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionItem(
    BuildContext context,
    String number,
    String text,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Theme.of(context).primaryColor),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildTest(BuildContext context, bool isRussian) {
    final question = CareerCompassData.questions[_currentQuestionIndex];

    return CareerCompassQuestionWidget(
      question: question,
      questionNumber: _currentQuestionIndex + 1,
      totalQuestions: CareerCompassData.questions.length,
      onAnswer: _onAnswer,
      isRussian: isRussian,
    );
  }

  void _showExitDialog(BuildContext context, bool isRussian) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isRussian ? 'Выйти из теста?' : 'Exit test?'),
        content: Text(
          isRussian
              ? 'Прогресс не будет сохранён. Вы уверены, что хотите выйти?'
              : 'Progress will not be saved. Are you sure you want to exit?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(isRussian ? 'Отмена' : 'Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text(
              isRussian ? 'Выйти' : 'Exit',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
