import 'test_stub.dart';

/// Conflict Communication Style Test (Thomas-Kilmann Model)
///
/// Comprehensive assessment of conflict resolution strategies across 5 styles:
/// avoiding, accommodating, competing, compromising, and collaborating.
///
/// Based on the Thomas-Kilmann Conflict Mode Instrument (TKI),
/// which measures conflict-handling styles across two dimensions:
/// - Assertiveness (the extent to which one tries to satisfy own concerns)
/// - Cooperativeness (the extent to which one tries to satisfy others' concerns)
///
/// Not a clinical diagnosis. For self-awareness and communication skill development.
class ConflictCommunicationStyleTest extends TestStub {
  @override
  String get id => 'conflict_communication_style_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Тест стилей поведения в конфликте',
        'en': 'Conflict Communication Style Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест поможет вам понять, какие стратегии вы используете при разрешении конфликтов и разногласий. Основан на модели Томаса-Килманна (Thomas-Kilmann Conflict Mode Instrument), которая выделяет пять основных стилей поведения в конфликте.\n\nКаждый стиль представляет собой сочетание двух измерений: напористости (насколько активно вы отстаиваете свои интересы) и кооперативности (насколько вы учитываете интересы других). Тест состоит из 45 ситуационных вопросов из разных сфер жизни: работа, семья, друзья, незнакомцы.\n\nПонимание своего доминирующего стиля поведения в конфликте — ключ к более эффективной коммуникации. Результаты теста помогут вам осознать свои паттерны реагирования и развить гибкость в выборе стратегий в зависимости от ситуации.',
        'en':
            'This test will help you understand which strategies you use when resolving conflicts and disagreements. Based on the Thomas-Kilmann Conflict Mode Instrument, which identifies five main conflict-handling styles.\n\nEach style represents a combination of two dimensions: assertiveness (how actively you pursue your own concerns) and cooperativeness (how much you consider others\' concerns). The test consists of 45 situational questions from different life areas: work, family, friends, strangers.\n\nUnderstanding your dominant conflict style is key to more effective communication. The test results will help you recognize your response patterns and develop flexibility in choosing strategies depending on the situation.',
      };

  @override
  int get questionCount => 45;

  @override
  int get estimatedMinutes => 12;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'relationships',
        'communication',
        'conflict_resolution',
        'interpersonal_skills',
        'behavioral_patterns',
      ];

  @override
  String get assetPath => ''; // Legacy Dart architecture

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Original Development',
        'year': '2025',
        'category_display': {
          'ru': 'Отношения',
          'en': 'Relationships',
        },
        'subcategory_display': {
          'ru': 'Коммуникация',
          'en': 'Communication',
        },
        'factors': [
          'avoiding',
          'accommodating',
          'competing',
          'compromising',
          'collaborating',
        ],
        'factor_names': {
          'ru': {
            'avoiding': 'Избегание',
            'accommodating': 'Приспособление',
            'competing': 'Соперничество',
            'compromising': 'Компромисс',
            'collaborating': 'Сотрудничество',
          },
          'en': {
            'avoiding': 'Avoiding',
            'accommodating': 'Accommodating',
            'competing': 'Competing',
            'compromising': 'Compromising',
            'collaborating': 'Collaborating',
          },
        },
        'dimensions': {
          'avoiding': {
            'assertiveness': 'low',
            'cooperativeness': 'low',
          },
          'accommodating': {
            'assertiveness': 'low',
            'cooperativeness': 'high',
          },
          'competing': {
            'assertiveness': 'high',
            'cooperativeness': 'low',
          },
          'compromising': {
            'assertiveness': 'medium',
            'cooperativeness': 'medium',
          },
          'collaborating': {
            'assertiveness': 'high',
            'cooperativeness': 'high',
          },
        },
        'response_type': 'multiple_choice',
        'scoring_method': 'situational',
        'question_format': '5_option_situational',
        'scientific_basis': [
          'Thomas-Kilmann Conflict Mode Instrument (TKI)',
          'Two-dimensional model: Assertiveness × Cooperativeness',
          'Situational conflict resolution theory',
          'Blake and Mouton Managerial Grid adapted for conflicts',
        ],
      };
}
