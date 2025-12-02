import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_preferences_provider.dart';
import '../providers/locale_provider.dart';
import '../utils/theme_utils.dart';
import '../constants/color_constants.dart';
import 'dart:math';

class MoodCheckScreen extends StatefulWidget {
  const MoodCheckScreen({super.key});

  @override
  State<MoodCheckScreen> createState() => _MoodCheckScreenState();
}

class _MoodCheckScreenState extends State<MoodCheckScreen> with TickerProviderStateMixin {
  int? _selectedMood;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late String _greeting;

  final List<Map<String, dynamic>> moods = [
    {
      'emoji': '😢',
      'text_ru': 'Очень плохо',
      'text_en': 'Very Bad',
      'response_ru': 'Мне жаль это слышать. Помните, что трудные времена временны. Давайте попробуем что-то, что может поднять настроение.',
      'response_en': 'I\'m sorry to hear that. Remember, tough times are temporary. Let\'s try something that might lift your spirits.',
    },
    {
      'emoji': '😕',
      'text_ru': 'Плохо',
      'text_en': 'Bad',
      'response_ru': 'Понимаю, что не всегда всё идёт гладко. Надеюсь, наше приложение поможет вам почувствовать себя лучше.',
      'response_en': 'I understand that things don\'t always go smoothly. I hope our app will help you feel better.',
    },
    {
      'emoji': '😐',
      'text_ru': 'Нормально',
      'text_en': 'Okay',
      'response_ru': 'Обычный день! Давайте сделаем его чуточку лучше.',
      'response_en': 'A regular day! Let\'s make it a little better.',
    },
    {
      'emoji': '😊',
      'text_ru': 'Хорошо',
      'text_en': 'Good',
      'response_ru': 'Замечательно! Хорошее настроение - это отличное начало.',
      'response_en': 'Wonderful! A good mood is a great start.',
    },
    {
      'emoji': '😄',
      'text_ru': 'Великолепно',
      'text_en': 'Excellent',
      'response_ru': 'Потрясающе! Ваша позитивная энергия заражает! Продолжайте в том же духе!',
      'response_en': 'Amazing! Your positive energy is contagious! Keep it up!',
    },
  ];

  final List<String> greetingsRu = [
    'Как ваше настроение сейчас?',
    'Как вы себя чувствуете?',
    'Какое у вас настроение?',
    'Как дела?',
    'Что у вас на душе?',
  ];

  final List<String> greetingsEn = [
    'How are you feeling?',
    'What\'s your mood?',
    'How do you feel?',
    'How are you doing?',
    'What\'s on your mind?',
  ];

  @override
  void initState() {
    super.initState();

    // Выбираем приветствие один раз при загрузке
    final isRussian = context.read<LocaleProvider>().isRussian;
    final greetings = isRussian ? greetingsRu : greetingsEn;
    _greeting = greetings[Random().nextInt(greetings.length)];

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _selectMood(int index) {
    setState(() {
      _selectedMood = index;
    });
    _scaleController.forward(from: 0);
  }

  void _continue() {
    if (_selectedMood == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Provider.of<LocaleProvider>(context, listen: false).isRussian
                ? 'Пожалуйста, выберите ваше настроение'
                : 'Please select your mood',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    _fadeController.reverse().then((_) {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  void _skip() {
    _fadeController.reverse().then((_) {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isRussian = localeProvider.isRussian;
    final userName = prefsProvider.userName ?? (isRussian ? 'Друг' : 'Friend');
    final themeColor = prefsProvider.themeColor;

    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ThemeUtils.getScreenGradient(themeColor, brightness),
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Рассчитываем коэффициент масштабирования на основе высоты экрана
              final availableHeight = constraints.maxHeight;
              final isSmallHeight = availableHeight < 800; // Определяем маленький экран

              // Базовая высота зависит от размера экрана
              final baseHeight = isSmallHeight ? 600.0 : 700.0;
              final scaleFactor = (availableHeight / baseHeight).clamp(0.55, 1.2);

              // Процент для верхней части
              final topSectionPercent = isSmallHeight ? 0.24 : 0.28;

              // Адаптивные размеры (меньше для маленьких экранов)
              final nameFontSize = (isSmallHeight ? 28.0 : 32.0) * scaleFactor;
              final greetingFontSize = (isSmallHeight ? 20.0 : 22.0) * scaleFactor;
              final responseFontSize = (isSmallHeight ? 13.0 : 14.5) * scaleFactor;
              final moodTextFontSize = (isSmallHeight ? 14.0 : 15.0) * scaleFactor;
              final emojiFontSize = (isSmallHeight ? 24.0 : 26.0) * scaleFactor;
              final buttonFontSize = (isSmallHeight ? 16.0 : 17.0) * scaleFactor;
              final skipFontSize = (isSmallHeight ? 14.0 : 15.0) * scaleFactor;

              final topPadding = (isSmallHeight ? 8.0 : 12.0) * scaleFactor;
              final nameBottomPadding = (isSmallHeight ? 6.0 : 8.0) * scaleFactor;
              final greetingBottomPadding = (isSmallHeight ? 8.0 : 12.0) * scaleFactor;
              final moodItemSpacing = (isSmallHeight ? 4.0 : 6.0) * scaleFactor;
              final moodItemPaddingH = (isSmallHeight ? 16.0 : 18.0) * scaleFactor;
              final moodItemPaddingV = (isSmallHeight ? 7.0 : 9.0) * scaleFactor;
              final responsePaddingH = (isSmallHeight ? 12.0 : 14.0) * scaleFactor;
              final responsePaddingV = (isSmallHeight ? 8.0 : 10.0) * scaleFactor;
              final bottomPadding = (isSmallHeight ? 8.0 : 12.0) * scaleFactor;
              final buttonSpacing = (isSmallHeight ? 5.0 : 7.0) * scaleFactor;
              final buttonPaddingV = (isSmallHeight ? 9.0 : 11.0) * scaleFactor;

              // Максимум строк для ответа
              final maxResponseLines = isSmallHeight ? 4 : 5;

              // Множители для промежутков
              final spacingMultiplier = isSmallHeight ? 0.1 : 0.2;

              return FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    // Верхняя часть с именем и приветствием (фиксированная высота)
                    SizedBox(
                      height: availableHeight * topSectionPercent,  // Адаптивная высота
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, topPadding, 30, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Имя пользователя (фиксированная позиция)
                            Text(
                              userName,
                              style: TextStyle(
                                fontSize: nameFontSize,
                                fontWeight: FontWeight.bold,
                                color: themeColor,
                              ),
                            ),
                            SizedBox(height: nameBottomPadding),
                            // Показываем либо приветствие, либо реакцию (расширяется вниз)
                            Expanded(
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: _selectedMood != null
                                      ? Container(
                                          key: ValueKey(_selectedMood),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: responsePaddingH,
                                            vertical: responsePaddingV,
                                          ),
                                          decoration: BoxDecoration(
                                            color: themeColor,
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: themeColor.withOpacity(0.3),
                                                blurRadius: 10,
                                                offset: const Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            isRussian
                                                ? moods[_selectedMood!]['response_ru'] as String
                                                : moods[_selectedMood!]['response_en'] as String,
                                            style: TextStyle(
                                              fontSize: responseFontSize,
                                              color: ThemeUtils.getButtonTextColor(themeColor),
                                              fontWeight: FontWeight.w600,
                                              height: 1.25,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: maxResponseLines,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      : Text(
                                          key: const ValueKey('greeting'),
                                          _greeting,
                                          style: TextStyle(
                                            fontSize: greetingFontSize,
                                            color: ThemeUtils.getBodyTextColor(brightness),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: greetingBottomPadding * spacingMultiplier),
                    // Список вариантов настроения (компактные, фиксированная позиция)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(moods.length, (index) {
                            final mood = moods[index];
                            final isSelected = _selectedMood == index;

                            return Padding(
                              padding: EdgeInsets.only(bottom: moodItemSpacing),
                              child: GestureDetector(
                                onTap: () => _selectMood(index),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: moodItemPaddingH,
                                    vertical: moodItemPaddingV,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected ? themeColor : ThemeUtils.getCardColor(brightness),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: isSelected
                                        ? [BoxShadow(color: themeColor.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 5))]
                                        : ThemeUtils.getCardShadow(brightness),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        mood['emoji'],
                                        style: TextStyle(fontSize: emojiFontSize),
                                      ),
                                      SizedBox(width: 12 * scaleFactor),
                                      Text(
                                        isRussian ? mood['text_ru'] : mood['text_en'],
                                        style: TextStyle(
                                          fontSize: moodTextFontSize,
                                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                          color: isSelected ? ThemeUtils.getButtonTextColor(themeColor) : ThemeUtils.getBodyTextColor(brightness),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: greetingBottomPadding * spacingMultiplier),
                    // Кнопки внизу (фиксированные)
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, isSmallHeight ? 2 : 3, 30, bottomPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            // Кнопка продолжить
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _continue,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: themeColor,
                                  foregroundColor: ThemeUtils.getButtonTextColor(themeColor),
                                  padding: EdgeInsets.symmetric(vertical: buttonPaddingV),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 5,
                                ),
                                child: Text(
                                  isRussian ? 'Продолжить' : 'Continue',
                                  style: TextStyle(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: buttonSpacing),
                            // Кнопка пропустить
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: _skip,
                                style: TextButton.styleFrom(
                                  foregroundColor: themeColor,
                                  padding: EdgeInsets.symmetric(vertical: buttonPaddingV),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  isRussian ? 'Пропустить' : 'Skip',
                                  style: TextStyle(
                                    fontSize: skipFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

