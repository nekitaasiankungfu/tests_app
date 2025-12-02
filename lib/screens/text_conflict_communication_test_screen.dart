import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/text_conflict_communication_model.dart';
import '../data/text_conflict_communication_data.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../services/text_conflict_communication_service.dart';
import 'text_conflict_communication_result_screen.dart';

/// Экран теста коммуникации в текстовых конфликтах
///
/// Отображает 20 сценариев с ситуацией, контекстом и вопросом
/// Пользователь выбирает один из 4 вариантов ответа
///
/// @version: 1.0.0

class TextConflictCommunicationTestScreen extends StatefulWidget {
  const TextConflictCommunicationTestScreen({super.key});

  @override
  State<TextConflictCommunicationTestScreen> createState() =>
      _TextConflictCommunicationTestScreenState();
}

class _TextConflictCommunicationTestScreenState
    extends State<TextConflictCommunicationTestScreen> {
  // Текущий вопрос (0 - введение, 1-20 - вопросы)
  int _currentQuestionIndex = 0;

  // Список ответов пользователя
  final List<ScenarioAnswer> _answers = [];

  // Сервис для обработки результатов
  late final TextConflictCommunicationService _service;

  // Список вопросов
  final List<ScenarioQuestion> _questions =
      TextConflictCommunicationData.questions;

  @override
  void initState() {
    super.initState();
    _service = TextConflictCommunicationService();
  }

  /// Выбор варианта ответа
  void _selectOption(ScenarioOption option) {
    final question = _questions[_currentQuestionIndex];

    // Сохранить ответ
    final answer = ScenarioAnswer(
      questionId: question.scenario.id,
      optionId: option.id,
      scaleContributions: option.scales,
    );

    setState(() {
      _answers.add(answer);
      _currentQuestionIndex++;
    });

    // Если все вопросы пройдены - обработать результаты
    if (_currentQuestionIndex >= _questions.length) {
      _processResults();
    }
  }

  /// Вернуться к предыдущему вопросу
  void _goBack() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        if (_answers.isNotEmpty) {
          _answers.removeLast();
        }
      });
    } else {
      Navigator.pop(context);
    }
  }

  /// Обработка результатов теста
  void _processResults() {
    final result = _service.calculateResults(_answers);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TextConflictCommunicationResultScreen(
          result: result,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final isRussian = localeProvider.isRussian;
    final theme = Theme.of(context);
    final userPrefs = context.watch<UserPreferencesProvider>();

    return Scaffold(
      backgroundColor: userPrefs.isDarkMode
          ? const Color(0xFF1A1A2E)
          : const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: userPrefs.isDarkMode
            ? const Color(0xFF16213E)
            : userPrefs.themeColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _goBack,
        ),
        title: Text(
          isRussian ? 'Конфликт в переписке' : 'Text Conflict',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${_currentQuestionIndex + 1}/${_questions.length}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Прогресс-бар
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                userPrefs.themeColor,
              ),
            ),

            // Основное содержимое
            Expanded(
              child: _buildQuestionContent(isRussian, theme, userPrefs),
            ),
          ],
        ),
      ),
    );
  }

  /// Построить содержимое вопроса
  Widget _buildQuestionContent(
    bool isRussian,
    ThemeData theme,
    UserPreferencesProvider userPrefs,
  ) {
    if (_currentQuestionIndex >= _questions.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final question = _questions[_currentQuestionIndex];
    final scenario = question.scenario;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Ситуация
          _buildScenarioCard(
            title: isRussian ? 'Ситуация' : 'Situation',
            content: isRussian ? scenario.situation['ru']! : scenario.situation['en']!,
            icon: Icons.chat_bubble_outline,
            color: userPrefs.isDarkMode
                ? const Color(0xFF2E3A59)
                : Colors.blue[50]!,
            textColor: userPrefs.isDarkMode ? Colors.white : Colors.black87,
            userPrefs: userPrefs,
          ),

          const SizedBox(height: 16),

          // Контекст
          _buildScenarioCard(
            title: isRussian ? 'Контекст' : 'Context',
            content: isRussian ? scenario.context['ru']! : scenario.context['en']!,
            icon: Icons.info_outline,
            color: userPrefs.isDarkMode
                ? const Color(0xFF2E3A59)
                : Colors.orange[50]!,
            textColor: userPrefs.isDarkMode ? Colors.white70 : Colors.black54,
            userPrefs: userPrefs,
          ),

          const SizedBox(height: 20),

          // Вопрос
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: userPrefs.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: userPrefs.themeColor.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.help_outline,
                  color: userPrefs.themeColor,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isRussian ? scenario.question['ru']! : scenario.question['en']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Варианты ответов
          ...question.options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildOptionButton(
                option: option,
                index: index,
                isRussian: isRussian,
                userPrefs: userPrefs,
              ),
            );
          }),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Построить карточку сценария (ситуация/контекст)
  Widget _buildScenarioCard({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
    required Color textColor,
    required UserPreferencesProvider userPrefs,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: userPrefs.isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: textColor.withOpacity(0.7)),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: textColor.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Построить кнопку варианта ответа
  Widget _buildOptionButton({
    required ScenarioOption option,
    required int index,
    required bool isRussian,
    required UserPreferencesProvider userPrefs,
  }) {
    final optionLabels = ['A', 'B', 'C', 'D'];
    final label = optionLabels[index];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _selectOption(option),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: userPrefs.isDarkMode
                ? const Color(0xFF2E3A59)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: userPrefs.isDarkMode
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Буква варианта
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: userPrefs.themeColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: userPrefs.themeColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Текст варианта
              Expanded(
                child: Text(
                  isRussian ? option.text['ru']! : option.text['en']!,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.4,
                    color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
