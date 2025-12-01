// Imposter Syndrome Test - Based on Clance & Imes (1978) research
// 42 вопросов, 6 факторов, ~10 минут

import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Основной класс данных для теста синдрома самозванца
class ImposterSyndromeData {
  /// Получить модель теста
  static TestModel getImposterSyndromeTest() {
    return TestModel(
      id: 'imposter_syndrome',
      categoryId: 'emotional',
      title: {
        'ru': 'Синдром самозванца',
        'en': 'Imposter Syndrome',
      },
      category: {
        'ru': 'Эмоциональное благополучие',
        'en': 'Emotional Wellbeing',
      },
      description: {
        'ru': 'Синдром самозванца — это психологический феномен, при котором человек не может приписать свои достижения '
            'собственным усилиям и способностям. Люди с этим синдромом постоянно сомневаются в себе, боятся быть «разоблаченными» '
            'как некомпетентные, несмотря на объективные доказательства их успешности. Это состояние затрагивает до 70% людей '
            'хотя бы раз в жизни, особенно при карьерном росте или освоении новых навыков.\n\n'
            'Этот тест основан на исследованиях Полин Кланс и Сюзанны Аймс (1978), а также современных работах по психологии '
            'самооценки и атрибуции успеха. Тест измеряет шесть ключевых компонентов синдрома самозванца: страх разоблачения, '
            'обесценивание достижений, перфекционизм, избегание вызовов, внешняя атрибуция успеха и компенсаторное поведение.\n\n'
            'Понимание своего уровня синдрома самозванца поможет вам объективнее оценивать свои способности, снизить тревогу '
            'и разработать стратегии для здоровой самооценки.',
        'en': 'Imposter syndrome is a psychological phenomenon where a person cannot attribute their achievements to their own '
            'efforts and abilities. People with this syndrome constantly doubt themselves and fear being "exposed" as incompetent, '
            'despite objective evidence of their success. This condition affects up to 70% of people at least once in their lives, '
            'especially during career advancement or learning new skills.\n\n'
            'This test is based on research by Pauline Clance and Suzanne Imes (1978), as well as modern work in self-esteem '
            'psychology and success attribution. The test measures six key components of imposter syndrome: fear of exposure, '
            'devaluing achievements, perfectionism, avoiding challenges, external attribution of success, and compensatory behavior.\n\n'
            'Understanding your level of imposter syndrome will help you more objectively assess your abilities, reduce anxiety, '
            'and develop strategies for healthy self-esteem.',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'fear_of_exposure',
        'achievement_devaluation',
        'perfectionism',
        'challenge_avoidance',
        'external_attribution',
        'overcompensation',
      ],
      questions: _getQuestions(),
    );
  }

  /// Определить профиль на основе процентов факторов
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_moderate';

    // Общий балл = среднее по всем 6 факторам
    final avgScore = percentages.values.reduce((a, b) => a + b) / percentages.length;

    if (avgScore >= 81) return 'profile_severe';
    if (avgScore >= 61) return 'profile_high';
    if (avgScore >= 41) return 'profile_moderate';
    if (avgScore >= 21) return 'profile_mild';
    return 'profile_minimal';
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  // ============================================================
  // PROFILES
  // ============================================================

  static final Map<String, TestProfile> _profiles = {
    'profile_minimal': TestProfile(
      id: 'profile_minimal',
      name: {
        'ru': 'Минимальный синдром самозванца',
        'en': 'Minimal Imposter Syndrome',
      },
      description: {
        'ru': 'У вас здоровая самооценка и адекватное восприятие собственных достижений. '
            'Вы уверены в своих способностях, признаёте свои заслуги и не испытываете значительного '
            'страха «разоблачения». Вы можете объективно оценивать свои сильные и слабые стороны.',
        'en': 'You have healthy self-esteem and an adequate perception of your achievements. '
            'You are confident in your abilities, acknowledge your merits, and do not experience significant '
            'fear of "exposure". You can objectively assess your strengths and weaknesses.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают здоровое отношение к успеху и самооценке',
        'en': 'Your answers show a healthy attitude towards success and self-esteem',
      },
      strengths: {
        'ru': [
          'Здоровая самооценка и уверенность в своих способностях',
          'Умение признавать собственные заслуги',
          'Адекватное восприятие похвалы и критики',
          'Готовность принимать вызовы и новые возможности',
          'Объективная оценка своих достижений',
        ],
        'en': [
          'Healthy self-esteem and confidence in abilities',
          'Ability to acknowledge own merits',
          'Adequate perception of praise and criticism',
          'Willingness to accept challenges and new opportunities',
          'Objective assessment of achievements',
        ],
      },
      vulnerabilities: {
        'ru': [],
        'en': [],
      },
      recommendations: {
        'ru': [
          'Продолжайте поддерживать здоровую самооценку',
          'Делитесь своим опытом с теми, кто сомневается в себе',
          'Помогайте другим признавать их достижения',
          'Развивайте навыки наставничества',
        ],
        'en': [
          'Continue maintaining healthy self-esteem',
          'Share your experience with those who doubt themselves',
          'Help others acknowledge their achievements',
          'Develop mentorship skills',
        ],
      },
      tryToday: {
        'ru': 'Поддержите кого-то, кто сомневается в своих способностях',
        'en': 'Support someone who doubts their abilities',
      },
      inspiringConclusion: {
        'ru': 'Ваша уверенность в себе — это сила, которая вдохновляет окружающих!',
        'en': 'Your self-confidence is a strength that inspires those around you!',
      },
    ),
    'profile_mild': TestProfile(
      id: 'profile_mild',
      name: {
        'ru': 'Лёгкий синдром самозванца',
        'en': 'Mild Imposter Syndrome',
      },
      description: {
        'ru': 'Вы иногда сомневаетесь в себе и своих достижениях, но эти сомнения не мешают '
            'вашей повседневной жизни и карьере. Периодически вы можете чувствовать себя недостаточно '
            'компетентным, но в целом признаёте свои способности.',
        'en': 'You sometimes doubt yourself and your achievements, but these doubts do not interfere '
            'with your daily life and career. Occasionally you may feel insufficiently competent, '
            'but overall you acknowledge your abilities.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают эпизодические сомнения в себе, которые не критичны',
        'en': 'Your answers show episodic self-doubt that is not critical',
      },
      strengths: {
        'ru': [
          'Способность справляться с сомнениями самостоятельно',
          'В целом здоровое отношение к достижениям',
          'Готовность принимать большинство вызовов',
          'Умение адаптироваться к новым ситуациям',
        ],
        'en': [
          'Ability to cope with doubts independently',
          'Generally healthy attitude towards achievements',
          'Willingness to accept most challenges',
          'Ability to adapt to new situations',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Эпизодические сомнения в собственной компетентности',
          'Иногда недооценка своих достижений',
          'Периодический страх не оправдать ожидания',
        ],
        'en': [
          'Episodic doubts about own competence',
          'Sometimes underestimating achievements',
          'Periodic fear of not meeting expectations',
        ],
      },
      recommendations: {
        'ru': [
          'Ведите дневник достижений — записывайте успехи и позитивную обратную связь',
          'Практикуйте принятие комплиментов без обесценивания',
          'Регулярно напоминайте себе о своих компетенциях',
          'Обсуждайте свои сомнения с доверенными людьми',
        ],
        'en': [
          'Keep an achievement journal—record successes and positive feedback',
          'Practice accepting compliments without devaluation',
          'Regularly remind yourself of your competencies',
          'Discuss your doubts with trusted people',
        ],
      },
      tryToday: {
        'ru': 'Запишите 3 своих достижения за последний месяц и почему вы ими гордитесь',
        'en': 'Write down 3 of your achievements from the past month and why you are proud of them',
      },
      inspiringConclusion: {
        'ru': 'Ваши сомнения нормальны, но помните — вы уже доказали свою компетентность!',
        'en': 'Your doubts are normal, but remember—you have already proven your competence!',
      },
    ),
    'profile_moderate': TestProfile(
      id: 'profile_moderate',
      name: {
        'ru': 'Умеренный синдром самозванца',
        'en': 'Moderate Imposter Syndrome',
      },
      description: {
        'ru': 'Синдром самозванца заметно влияет на вашу жизнь и самооценку. Вы часто сомневаетесь '
            'в своих способностях, обесцениваете достижения и боитесь быть «разоблачённым». '
            'Эти переживания могут сдерживать ваш карьерный рост и снижать удовлетворённость жизнью.',
        'en': 'Imposter syndrome noticeably affects your life and self-esteem. You often doubt '
            'your abilities, devalue achievements, and fear being "exposed". '
            'These experiences may hinder your career growth and reduce life satisfaction.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают систематические сомнения в себе, требующие внимания',
        'en': 'Your answers show systematic self-doubt requiring attention',
      },
      strengths: {
        'ru': [
          'Осознание проблемы — первый шаг к изменениям',
          'Готовность к работе над собой',
          'Способность к самоанализу',
          'Потенциал для развития здоровой самооценки',
        ],
        'en': [
          'Problem awareness is the first step to change',
          'Readiness to work on yourself',
          'Capacity for self-analysis',
          'Potential for developing healthy self-esteem',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Частые сомнения в собственной компетентности',
          'Систематическое обесценивание достижений',
          'Страх не оправдать ожидания других',
          'Перфекционизм и высокие стандарты',
          'Избегание некоторых вызовов из-за страха неудачи',
        ],
        'en': [
          'Frequent doubts about own competence',
          'Systematic devaluation of achievements',
          'Fear of not meeting others\' expectations',
          'Perfectionism and high standards',
          'Avoiding some challenges due to fear of failure',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите работу с психологом, специализирующимся на самооценке',
          'Изучите литературу о синдроме самозванца (книги Валери Янг, Полин Кланс)',
          'Практикуйте когнитивно-поведенческие техники для работы с негативными мыслями',
          'Создайте «папку доказательств» с отзывами, благодарностями, результатами работы',
          'Найдите наставника или группу поддержки',
          'Ставьте реалистичные цели и отмечайте промежуточные успехи',
        ],
        'en': [
          'Consider working with a psychologist specializing in self-esteem',
          'Study literature on imposter syndrome (books by Valerie Young, Pauline Clance)',
          'Practice cognitive-behavioral techniques for working with negative thoughts',
          'Create an "evidence folder" with reviews, thanks, work results',
          'Find a mentor or support group',
          'Set realistic goals and celebrate intermediate successes',
        ],
      },
      tryToday: {
        'ru': 'Создайте список своих навыков и квалификаций — объективных доказательств компетентности',
        'en': 'Create a list of your skills and qualifications—objective evidence of competence',
      },
      inspiringConclusion: {
        'ru': 'Работа над синдромом самозванца возможна — многие успешные люди прошли этот путь!',
        'en': 'Working on imposter syndrome is possible—many successful people have taken this path!',
      },
    ),
    'profile_high': TestProfile(
      id: 'profile_high',
      name: {
        'ru': 'Высокий синдром самозванца',
        'en': 'High Imposter Syndrome',
      },
      description: {
        'ru': 'Синдром самозванца существенно ограничивает вашу жизнь. Вы постоянно испытываете '
            'сильный страх «разоблачения», обесцениваете свои достижения и избегаете новых возможностей. '
            'Это может привести к хроническому стрессу, выгоранию и упущенным карьерным возможностям.',
        'en': 'Imposter syndrome significantly limits your life. You constantly experience '
            'strong fear of "exposure", devalue your achievements, and avoid new opportunities. '
            'This can lead to chronic stress, burnout, and missed career opportunities.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают выраженный синдром, требующий профессиональной помощи',
        'en': 'Your answers show pronounced syndrome requiring professional help',
      },
      strengths: {
        'ru': [
          'Прохождение теста показывает готовность к изменениям',
          'Способность к честной самооценке',
          'Потенциал для значительного улучшения качества жизни при работе с синдромом',
        ],
        'en': [
          'Taking the test shows readiness for change',
          'Ability for honest self-assessment',
          'Potential for significant improvement in quality of life when working on the syndrome',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Постоянный сильный страх быть «разоблачённым»',
          'Систематическое отрицание собственных заслуг',
          'Выраженный перфекционизм и нереалистичные стандарты',
          'Избегание карьерных возможностей из-за страха',
          'Приписывание успеха только внешним факторам',
          'Компенсаторная переработка и риск выгорания',
        ],
        'en': [
          'Constant strong fear of being "exposed"',
          'Systematic denial of own merits',
          'Pronounced perfectionism and unrealistic standards',
          'Avoiding career opportunities due to fear',
          'Attributing success only to external factors',
          'Compensatory overwork and burnout risk',
        ],
      },
      recommendations: {
        'ru': [
          '⚠️ Настоятельно рекомендуется работа с психологом или психотерапевтом',
          'Рассмотрите когнитивно-поведенческую терапию (КПТ) — эффективна при синдроме самозванца',
          'Найдите группу поддержки или сообщество людей с похожим опытом',
          'Изучите техники майндфулнесс для работы с тревогой',
          'Установите границы на работе — избегайте перегрузки',
          'Работайте с перфекционизмом: практикуйте «достаточно хорошо» вместо «идеально»',
          'Ведите дневник благодарности и достижений',
        ],
        'en': [
          '⚠️ Working with a psychologist or psychotherapist is strongly recommended',
          'Consider cognitive-behavioral therapy (CBT)—effective for imposter syndrome',
          'Find a support group or community of people with similar experience',
          'Study mindfulness techniques for working with anxiety',
          'Set boundaries at work—avoid overload',
          'Work on perfectionism: practice "good enough" instead of "perfect"',
          'Keep a gratitude and achievement journal',
        ],
      },
      tryToday: {
        'ru': 'Запишитесь на консультацию к психологу или найдите онлайн-ресурсы по работе с синдромом',
        'en': 'Schedule a consultation with a psychologist or find online resources for working with the syndrome',
      },
      inspiringConclusion: {
        'ru': 'Профессиональная помощь может значительно улучшить ваше самоощущение и качество жизни!',
        'en': 'Professional help can significantly improve your self-perception and quality of life!',
      },
    ),
    'profile_severe': TestProfile(
      id: 'profile_severe',
      name: {
        'ru': 'Интенсивный синдром самозванца',
        'en': 'Severe Imposter Syndrome',
      },
      description: {
        'ru': 'У вас очень выраженный синдром самозванца, который серьёзно влияет на все аспекты жизни. '
            'Вы испытываете постоянный сильный страх, глубоко обесцениваете себя и свои достижения, '
            'избегаете практически любых вызовов. Это состояние может привести к депрессии, тревожному расстройству и изоляции.',
        'en': 'You have a very pronounced imposter syndrome that seriously affects all aspects of life. '
            'You experience constant strong fear, deeply devalue yourself and your achievements, '
            'avoid practically any challenges. This condition can lead to depression, anxiety disorder, and isolation.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают критический уровень синдрома, требующий срочной помощи',
        'en': 'Your answers show a critical level of syndrome requiring urgent help',
      },
      strengths: {
        'ru': [
          'Осознание серьёзности проблемы — важнейший первый шаг',
          'Потенциал для значительных позитивных изменений с профессиональной поддержкой',
        ],
        'en': [
          'Awareness of problem severity is the most important first step',
          'Potential for significant positive changes with professional support',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Тяжёлый постоянный страх «разоблачения»',
          'Полное отрицание собственных достижений и способностей',
          'Крайний перфекционизм, парализующий действия',
          'Систематическое избегание любых вызовов и возможностей',
          'Полная атрибуция успеха внешним факторам',
          'Компенсаторное поведение, ведущее к выгоранию',
          'Риск развития депрессии и тревожных расстройств',
        ],
        'en': [
          'Severe constant fear of "exposure"',
          'Complete denial of own achievements and abilities',
          'Extreme perfectionism paralyzing actions',
          'Systematic avoidance of any challenges and opportunities',
          'Complete attribution of success to external factors',
          'Compensatory behavior leading to burnout',
          'Risk of developing depression and anxiety disorders',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 НЕОБХОДИМА профессиональная психологическая помощь',
          'Запишитесь к психотерапевту как можно скорее',
          'Рассмотрите когнитивно-поведенческую терапию или схема-терапию',
          'При сопутствующей тревоге/депрессии может быть показана консультация психиатра',
          'Не пытайтесь справиться самостоятельно — это требует профессиональной поддержки',
          'Расскажите близким о своём состоянии, попросите поддержки',
          'Рассмотрите временное снижение рабочей нагрузки',
          'Используйте техники срочной помощи при тревоге (дыхательные упражнения, заземление)',
        ],
        'en': [
          '🚨 Professional psychological help is NECESSARY',
          'Schedule a psychotherapist as soon as possible',
          'Consider cognitive-behavioral therapy or schema therapy',
          'With concomitant anxiety/depression, psychiatric consultation may be indicated',
          'Do not try to cope alone—this requires professional support',
          'Tell loved ones about your condition, ask for support',
          'Consider temporary reduction of workload',
          'Use emergency anxiety techniques (breathing exercises, grounding)',
        ],
      },
      tryToday: {
        'ru': 'Срочно запишитесь на консультацию к психологу/психотерапевту — это первоочередной приоритет',
        'en': 'Urgently schedule a consultation with a psychologist/psychotherapist—this is the top priority',
      },
      inspiringConclusion: {
        'ru': 'Помните: это излечимое состояние. С профессиональной помощью вы можете вернуть контроль над своей жизнью!',
        'en': 'Remember: this is a treatable condition. With professional help, you can regain control of your life!',
      },
    ),
  };

  // ============================================================
  // FACTOR NAMES
  // ============================================================

  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'fear_of_exposure': {
        'ru': 'Страх разоблачения',
        'en': 'Fear of Exposure',
      },
      'achievement_devaluation': {
        'ru': 'Обесценивание достижений',
        'en': 'Achievement Devaluation',
      },
      'perfectionism': {
        'ru': 'Перфекционизм',
        'en': 'Perfectionism',
      },
      'challenge_avoidance': {
        'ru': 'Избегание вызовов',
        'en': 'Challenge Avoidance',
      },
      'external_attribution': {
        'ru': 'Внешняя атрибуция успеха',
        'en': 'External Success Attribution',
      },
      'overcompensation': {
        'ru': 'Гиперкомпенсация',
        'en': 'Overcompensation',
      },
    };
  }

  // ============================================================
  // FACTOR INTERPRETATIONS
  // ============================================================

  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    if (percentage < 20) {
      return _interpretations[factorId]!['minimal']!;
    } else if (percentage < 40) {
      return _interpretations[factorId]!['mild']!;
    } else if (percentage < 60) {
      return _interpretations[factorId]!['moderate']!;
    } else if (percentage < 80) {
      return _interpretations[factorId]!['high']!;
    } else {
      return _interpretations[factorId]!['severe']!;
    }
  }

  static final Map<String, Map<String, Map<String, String>>> _interpretations = {
    'fear_of_exposure': {
      'minimal': {
        'ru': 'Вы не боитесь, что другие усомнятся в вашей компетентности',
        'en': 'You are not afraid that others will doubt your competence',
      },
      'mild': {
        'ru': 'Иногда тревожитесь о мнении других, но это не критично',
        'en': 'Sometimes worry about others\' opinions, but it\'s not critical',
      },
      'moderate': {
        'ru': 'Часто боитесь быть «раскрытым» как некомпетентный',
        'en': 'Often fear being "exposed" as incompetent',
      },
      'high': {
        'ru': 'Постоянный сильный страх разоблачения мешает работе',
        'en': 'Constant strong fear of exposure interferes with work',
      },
      'severe': {
        'ru': 'Парализующий страх быть «разоблачённым» как обманщик',
        'en': 'Paralyzing fear of being "exposed" as a fraud',
      },
    },
    'achievement_devaluation': {
      'minimal': {
        'ru': 'Вы признаёте и цените свои достижения',
        'en': 'You acknowledge and value your achievements',
      },
      'mild': {
        'ru': 'Иногда недооцениваете свои успехи',
        'en': 'Sometimes underestimate your successes',
      },
      'moderate': {
        'ru': 'Часто обесцениваете достижения, думая «это не считается»',
        'en': 'Often devalue achievements, thinking "this doesn\'t count"',
      },
      'high': {
        'ru': 'Систематически отрицаете свои заслуги и вклад',
        'en': 'Systematically deny your merits and contributions',
      },
      'severe': {
        'ru': 'Полностью не признаёте собственных достижений и способностей',
        'en': 'Completely do not acknowledge own achievements and abilities',
      },
    },
    'perfectionism': {
      'minimal': {
        'ru': 'Вы ставите реалистичные цели и принимаете ошибки',
        'en': 'You set realistic goals and accept mistakes',
      },
      'mild': {
        'ru': 'Иногда слишком требовательны к себе',
        'en': 'Sometimes too demanding of yourself',
      },
      'moderate': {
        'ru': 'Нереалистично высокие стандарты создают давление',
        'en': 'Unrealistically high standards create pressure',
      },
      'high': {
        'ru': 'Перфекционизм мешает начинать и завершать проекты',
        'en': 'Perfectionism prevents starting and completing projects',
      },
      'severe': {
        'ru': 'Крайний перфекционизм парализует действия и вызывает страдание',
        'en': 'Extreme perfectionism paralyzes actions and causes suffering',
      },
    },
    'challenge_avoidance': {
      'minimal': {
        'ru': 'Вы с энтузиазмом принимаете новые вызовы',
        'en': 'You enthusiastically embrace new challenges',
      },
      'mild': {
        'ru': 'Иногда сомневаетесь, но в целом не избегаете возможностей',
        'en': 'Sometimes hesitate, but generally don\'t avoid opportunities',
      },
      'moderate': {
        'ru': 'Часто отказываетесь от возможностей из-за страха неудачи',
        'en': 'Often decline opportunities due to fear of failure',
      },
      'high': {
        'ru': 'Систематически избегаете вызовов, упуская важные шансы',
        'en': 'Systematically avoid challenges, missing important chances',
      },
      'severe': {
        'ru': 'Полностью избегаете любых вызовов, ограничивая свою жизнь',
        'en': 'Completely avoid any challenges, limiting your life',
      },
    },
    'external_attribution': {
      'minimal': {
        'ru': 'Вы признаёте свою роль в достижениях',
        'en': 'You acknowledge your role in achievements',
      },
      'mild': {
        'ru': 'Иногда приписываете успех везению, но не всегда',
        'en': 'Sometimes attribute success to luck, but not always',
      },
      'moderate': {
        'ru': 'Часто думаете, что успех — это случайность, а не ваша заслуга',
        'en': 'Often think success is coincidence, not your merit',
      },
      'high': {
        'ru': 'Систематически приписываете успехи внешним факторам',
        'en': 'Systematically attribute successes to external factors',
      },
      'severe': {
        'ru': 'Полностью отрицаете свой вклад в любые достижения',
        'en': 'Completely deny your contribution to any achievements',
      },
    },
    'overcompensation': {
      'minimal': {
        'ru': 'Вы работаете эффективно без чрезмерной нагрузки',
        'en': 'You work efficiently without excessive load',
      },
      'mild': {
        'ru': 'Иногда перерабатываете, но умеете отдыхать',
        'en': 'Sometimes overwork, but can rest',
      },
      'moderate': {
        'ru': 'Часто перегружаете себя, чтобы доказать свою ценность',
        'en': 'Often overload yourself to prove your worth',
      },
      'high': {
        'ru': 'Постоянная переработка и жертвование личным временем',
        'en': 'Constant overwork and sacrificing personal time',
      },
      'severe': {
        'ru': 'Компенсаторная переработка на грани выгорания и вреда здоровью',
        'en': 'Compensatory overwork on the verge of burnout and health damage',
      },
    },
  };

  // ============================================================
  // QUESTIONS
  // ============================================================

  static List<QuestionModel> _getQuestions() {
    return [
      // FEAR OF EXPOSURE (7 questions)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я боюсь, что люди узнают, насколько я на самом деле некомпетентен',
          'en': 'I fear that people will find out how incompetent I really am',
        },
        answers: _getLikertAnswers(),
        factorId: 'fear_of_exposure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я часто думаю, что меня вот-вот «раскусят» и поймут, что я обманщик',
          'en': 'I often think I\'m about to be "found out" as a fraud',
        },
        answers: _getLikertAnswers(),
        factorId: 'fear_of_exposure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Когда меня хвалят, я тревожусь, что не смогу оправдать ожидания в будущем',
          'en': 'When praised, I worry I won\'t meet future expectations',
        },
        answers: _getLikertAnswers(),
        factorId: 'fear_of_exposure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я уверен(а) в своих способностях и не боюсь, что другие усомнятся в моей компетентности',
          'en': 'I am confident and not afraid others will doubt my competence',
        },
        answers: _getLikertAnswers(),
        factorId: 'fear_of_exposure',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Мне кажется, что я постоянно притворяюсь более способным, чем есть на самом деле',
          'en': 'I feel I\'m constantly pretending to be more capable than I am',
        },
        answers: _getLikertAnswers(),
        factorId: 'fear_of_exposure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я боюсь задавать вопросы, чтобы не показаться глупым',
          'en': 'I\'m afraid to ask questions so I won\'t appear stupid',
        },
        answers: _getLikertAnswers(),
        factorId: 'fear_of_exposure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я избегаю ситуаций, где мои знания могут быть проверены',
          'en': 'I avoid situations where my knowledge might be tested',
        },
        answers: _getLikertAnswers(),
        factorId: 'fear_of_exposure',
        isReversed: false,
      ),

      // ACHIEVEMENT DEVALUATION (7 questions)
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я редко чувствую удовлетворение от своих достижений',
          'en': 'I rarely feel satisfaction from my achievements',
        },
        answers: _getLikertAnswers(),
        factorId: 'achievement_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Когда я добиваюсь успеха, я думаю: «Это не считается» или «Это было слишком просто»',
          'en': 'When I succeed, I think: "This doesn\'t count" or "It was too easy"',
        },
        answers: _getLikertAnswers(),
        factorId: 'achievement_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я горжусь своими достижениями и признаю свою роль в них',
          'en': 'I am proud of my achievements and acknowledge my role',
        },
        answers: _getLikertAnswers(),
        factorId: 'achievement_devaluation',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я думаю, что мои успехи не отражают мои истинные способности',
          'en': 'I think my successes don\'t reflect my true abilities',
        },
        answers: _getLikertAnswers(),
        factorId: 'achievement_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Когда меня хвалят за работу, я чувствую себя неловко и незаслуженно',
          'en': 'When praised for work, I feel awkward and undeserving',
        },
        answers: _getLikertAnswers(),
        factorId: 'achievement_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я минимизирую значимость своих достижений в разговорах с другими',
          'en': 'I minimize the significance of my achievements with others',
        },
        answers: _getLikertAnswers(),
        factorId: 'achievement_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Мне трудно принимать комплименты — я сразу начинаю их обесценивать',
          'en': 'I find it hard to accept compliments—I immediately devalue them',
        },
        answers: _getLikertAnswers(),
        factorId: 'achievement_devaluation',
        isReversed: false,
      ),

      // PERFECTIONISM (7 questions)
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я устанавливаю для себя нереалистично высокие стандарты',
          'en': 'I set unrealistically high standards for myself',
        },
        answers: _getLikertAnswers(),
        factorId: 'perfectionism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Если я не могу сделать что-то идеально, я чувствую себя полным неудачником',
          'en': 'If I can\'t do something perfectly, I feel like a complete failure',
        },
        answers: _getLikertAnswers(),
        factorId: 'perfectionism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я могу признать свои ошибки и рассматриваю их как часть обучения',
          'en': 'I can acknowledge mistakes and view them as part of learning',
        },
        answers: _getLikertAnswers(),
        factorId: 'perfectionism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Даже небольшая ошибка заставляет меня сомневаться во всех своих способностях',
          'en': 'Even a small mistake makes me doubt all my abilities',
        },
        answers: _getLikertAnswers(),
        factorId: 'perfectionism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я трачу непропорционально много времени на мелкие детали, чтобы всё было безупречно',
          'en': 'I spend disproportionate time on small details for perfection',
        },
        answers: _getLikertAnswers(),
        factorId: 'perfectionism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Мне трудно начать проект, если я не уверен, что смогу выполнить его идеально',
          'en': 'I find it hard to start a project if unsure I can do it perfectly',
        },
        answers: _getLikertAnswers(),
        factorId: 'perfectionism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я постоянно сравниваю себя с другими и чувствую, что недотягиваю',
          'en': 'I constantly compare myself to others and feel I fall short',
        },
        answers: _getLikertAnswers(),
        factorId: 'perfectionism',
        isReversed: false,
      ),

      // CHALLENGE AVOIDANCE (7 questions)
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я избегаю новых возможностей из-за страха неудачи',
          'en': 'I avoid new opportunities due to fear of failure',
        },
        answers: _getLikertAnswers(),
        factorId: 'challenge_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я отказываюсь от повышений или новых проектов, думая, что не справлюсь',
          'en': 'I turn down promotions or new projects, thinking I can\'t handle them',
        },
        answers: _getLikertAnswers(),
        factorId: 'challenge_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я с энтузиазмом принимаю новые вызовы и возможности для роста',
          'en': 'I enthusiastically embrace new challenges and growth opportunities',
        },
        answers: _getLikertAnswers(),
        factorId: 'challenge_avoidance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я предпочитаю оставаться в зоне комфорта, чтобы не рисковать провалом',
          'en': 'I prefer staying in my comfort zone to avoid risking failure',
        },
        answers: _getLikertAnswers(),
        factorId: 'challenge_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Мысль о новых обязанностях вызывает у меня панику',
          'en': 'The thought of new responsibilities makes me panic',
        },
        answers: _getLikertAnswers(),
        factorId: 'challenge_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я откладываю важные задачи из-за страха не справиться с ними',
          'en': 'I procrastinate on important tasks due to fear of not handling them',
        },
        answers: _getLikertAnswers(),
        factorId: 'challenge_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я саботирую собственные возможности, потому что боюсь ожиданий',
          'en': 'I sabotage my own opportunities because I fear expectations',
        },
        answers: _getLikertAnswers(),
        factorId: 'challenge_avoidance',
        isReversed: false,
      ),

      // EXTERNAL ATTRIBUTION (7 questions)
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Когда я добиваюсь успеха, я думаю, что мне просто повезло',
          'en': 'When I succeed, I think I was just lucky',
        },
        answers: _getLikertAnswers(),
        factorId: 'external_attribution',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я считаю, что мои достижения — результат моих усилий и способностей',
          'en': 'I believe my achievements are the result of my efforts and abilities',
        },
        answers: _getLikertAnswers(),
        factorId: 'external_attribution',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я думаю, что успех случился благодаря помощи других, а не мне',
          'en': 'I think success happened thanks to others\' help, not me',
        },
        answers: _getLikertAnswers(),
        factorId: 'external_attribution',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Мне кажется, что я оказался на своей позиции случайно',
          'en': 'I feel I ended up in my position by accident',
        },
        answers: _getLikertAnswers(),
        factorId: 'external_attribution',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Когда задача оказывается легче ожидаемого, я чувствую, что не заслужил успеха',
          'en': 'When a task is easier than expected, I feel I didn\'t deserve success',
        },
        answers: _getLikertAnswers(),
        factorId: 'external_attribution',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я приписываю свои неудачи недостатку способностей, а успехи — внешним обстоятельствам',
          'en': 'I attribute failures to lack of ability, successes to external factors',
        },
        answers: _getLikertAnswers(),
        factorId: 'external_attribution',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Мне трудно признать, что я действительно заслужил свои достижения',
          'en': 'I find it hard to admit I truly earned my achievements',
        },
        answers: _getLikertAnswers(),
        factorId: 'external_attribution',
        isReversed: false,
      ),

      // OVERCOMPENSATION (7 questions)
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я работаю намного больше других, чтобы «компенсировать» свою недостаточность',
          'en': 'I work much harder than others to "compensate" for my inadequacy',
        },
        answers: _getLikertAnswers(),
        factorId: 'overcompensation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я чувствую постоянное давление доказывать свою ценность через работу',
          'en': 'I feel constant pressure to prove my worth through work',
        },
        answers: _getLikertAnswers(),
        factorId: 'overcompensation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я могу расслабиться и не чувствую необходимости постоянно что-то доказывать',
          'en': 'I can relax and don\'t feel the need to constantly prove something',
        },
        answers: _getLikertAnswers(),
        factorId: 'overcompensation',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я перегружаю себя работой, потому что боюсь выглядеть ленивым',
          'en': 'I overload myself with work because I fear appearing lazy',
        },
        answers: _getLikertAnswers(),
        factorId: 'overcompensation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Даже после успешного проекта я сразу берусь за новый, не давая себе отдохнуть',
          'en': 'Even after a successful project, I immediately take on a new one without rest',
        },
        answers: _getLikertAnswers(),
        factorId: 'overcompensation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Мне трудно делегировать задачи — я думаю, что должен делать всё сам',
          'en': 'I find it hard to delegate tasks—I think I should do everything myself',
        },
        answers: _getLikertAnswers(),
        factorId: 'overcompensation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Я жертвую личным временем и здоровьем ради работы',
          'en': 'I sacrifice personal time and health for work',
        },
        answers: _getLikertAnswers(),
        factorId: 'overcompensation',
        isReversed: false,
      ),
    ];
  }

  /// Helper method to get 5-point Likert scale answers
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: '0',
        text: {'ru': 'Совершенно не согласен', 'en': 'Strongly Disagree'},
        score: 0,
      ),
      AnswerModel(
        id: '1',
        text: {'ru': 'Скорее не согласен', 'en': 'Disagree'},
        score: 1,
      ),
      AnswerModel(
        id: '2',
        text: {'ru': 'Нейтрально', 'en': 'Neutral'},
        score: 2,
      ),
      AnswerModel(
        id: '3',
        text: {'ru': 'Скорее согласен', 'en': 'Agree'},
        score: 3,
      ),
      AnswerModel(
        id: '4',
        text: {'ru': 'Полностью согласен', 'en': 'Strongly Agree'},
        score: 4,
      ),
    ];
  }
}
