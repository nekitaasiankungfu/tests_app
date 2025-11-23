import '../../models/test_model.dart';
import 'test_stub.dart';

/// Test stub для теста "Карьерный компас"
///
/// Специальный тест с нестандартным интерфейсом (forced_choice)
/// Использует отдельный экран CareerCompassTestScreen
/// вместо стандартного TestScreen
///
/// Особенности:
/// - 56 вопросов парного выбора (не Likert)
/// - 8 шкал карьерных интересов
/// - Ипсативный (не нормативный) scoring
/// - Определение карьерного профиля
///
/// @version: 1.0.0

class CareerCompassTest extends TestStub {
  @override
  String get id => 'career_compass_v1';

  @override
  String get category => 'career';

  @override
  Map<String, String> get name => {
    'ru': 'Карьерный компас',
    'en': 'Career Compass',
  };

  @override
  Map<String, String> get description => {
    'ru': 'Определите свои профессиональные склонности по 8 ключевым направлениям. '
        'Тест поможет выбрать подходящую карьеру и понять, какие виды деятельности вам ближе.',
    'en': 'Determine your professional inclinations in 8 key areas. '
        'The test will help you choose a suitable career and understand which activities are closer to you.',
  };

  @override
  int get questionCount => 56; // Количество вопросов forced_choice

  @override
  int get estimatedMinutes => 15;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
    'career',
    'vocational',
    'professional',
    'interests',
    'compass',
    'forced_choice',
  ];

  @override
  String get assetPath => ''; // Использует специальную архитектуру

  @override
  Map<String, dynamic> get metadata => {
    'version': '1.0',
    'author': 'Career Psychology Research Lab',
    'year': 2025,
    'category_display': 'Карьера и профориентация',
    'factors': [
      'people',
      'analysis',
      'creation',
      'technology',
      'business',
      'nature',
      'order',
      'care',
    ],
    'response_type': 'forced_choice',
    'scoring_method': 'ipsative',
    'disclaimer': {
      'ru': 'Этот тест предназначен для профессиональной ориентации и самопознания. '
          'Результаты носят рекомендательный характер. Тест оценивает ИНТЕРЕСЫ и СКЛОННОСТИ, '
          'а не способности. Успех в профессии также зависит от навыков и практики.',
      'en': 'This test is designed for career guidance and self-discovery. '
          'The results are for guidance only. The test evaluates INTERESTS and INCLINATIONS, '
          'not abilities. Career success also depends on skills and practice.',
    },
    'interpretation_ranges': {
      'low': '0-28% (0-2 points)',
      'medium': '29-57% (3-4 points)',
      'high': '58-100% (5-7 points)',
    },
    'tags': ['career', 'vocational', 'professional', 'compass', 'forced_choice'],
    'special_test': true, // Флаг для специального теста
  };

  /// Получить тестовую модель для регистрации
  /// ВАЖНО: questions пустой для специальных тестов!
  static TestModel getCareerCompassTest() {
    return TestModel(
      id: 'career_compass_v1',
      title: {
        'ru': 'Карьерный компас',
        'en': 'Career Compass',
      },
      description: {
        'ru': 'Определите свои профессиональные склонности по 8 ключевым направлениям: '
            'от работы с людьми до технического творчества, от анализа данных до '
            'художественного самовыражения.\n\n'
            'Тест использует метод принудительного выбора: вам будут предложены пары '
            'утверждений, из которых нужно выбрать то, которое вам ближе.',
        'en': 'Determine your professional inclinations in 8 key areas: '
            'from working with people to technical creativity, from data analysis to '
            'artistic self-expression.\n\n'
            'The test uses the forced choice method: you will be presented with pairs '
            'of statements, from which you need to choose the one that is closer to you.',
      },
      category: {
        'ru': 'Карьера и профориентация',
        'en': 'Career and Guidance',
      },
      categoryId: 'career',
      factorIds: [
        'people',
        'analysis',
        'creation',
        'technology',
        'business',
        'nature',
        'order',
        'care',
      ],
      questions: [], // ⚠️ ВАЖНО: Пустой список для специальных тестов!
      estimatedTime: 15,
      type: TestType.multiFactor,
      disclaimer: {
        'ru': 'Этот тест предназначен для профессиональной ориентации и самопознания. '
            'Результаты носят рекомендательный характер. Тест оценивает ИНТЕРЕСЫ и СКЛОННОСТИ, '
            'а не способности. Успех в профессии также зависит от навыков и практики.',
        'en': 'This test is designed for career guidance and self-discovery. '
            'The results are for guidance only. The test evaluates INTERESTS and INCLINATIONS, '
            'not abilities. Career success also depends on skills and practice.',
      },
    );
  }
}
