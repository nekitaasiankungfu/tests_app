// emotional_intelligence_data.dart
// Emotional Intelligence Test - смешанная модель Salovey-Mayer + Goleman
// 70 вопросов, 7 шкал, ~15 минут

import '../models/question_model.dart';

/// Метаданные теста
class EmotionalIntelligenceTestMetadata {
  static const String testId = 'emotional_intelligence';
  static const String version = '1.0.0';
  static const int questionCount = 70;
  static const int estimatedMinutes = 15;
  
  static const Map<String, String> title = {
    'ru': 'Эмоциональный интеллект (EQ)',
    'en': 'Emotional Intelligence (EQ)',
  };
  
  static const Map<String, String> description = {
    'ru': 'Эмоциональный интеллект — это способность понимать, использовать и управлять своими эмоциями, а также распознавать и влиять на эмоции других людей. Высокий EQ помогает строить крепкие отношения, эффективно справляться со стрессом и принимать взвешенные решения.\n\nЭтот тест основан на смешанной модели Саловей-Майер и Гоулмана, оценивая семь ключевых компонентов эмоционального интеллекта: восприятие эмоций, их понимание, управление собой, использование эмоций для решения задач, эмпатию, социальные навыки и мотивацию.',
    'en': 'Emotional Intelligence is the ability to understand, use, and manage your own emotions, as well as recognize and influence the emotions of others. High EQ helps build strong relationships, effectively cope with stress, and make informed decisions.\n\nThis test is based on the mixed Salovey-Mayer and Goleman model, assessing seven key components of emotional intelligence: emotional perception, understanding, self-management, emotional facilitation, empathy, social skills, and motivation.',
  };
  
  static const Map<String, String> targetAudience = {
    'ru': 'Взрослые от 18 лет, интересующиеся личностным развитием',
    'en': 'Adults 18+, interested in personal development',
  };
  
  static const List<String> theoreticalBasis = [
    'Salovey & Mayer (1990) - Four-Branch Model',
    'Goleman (1995) - Mixed Model of EI',
    'Bar-On (1997) - Emotional Quotient',
    'Petrides & Furnham (2001) - Trait EI',
  ];
}

/// Шкалы теста
class EmotionalIntelligenceScales {
  // 7 шкал эмоционального интеллекта
  static const String emotionalPerception = 'emotional_perception';
  static const String emotionalUnderstanding = 'emotional_understanding';
  static const String selfManagement = 'self_management';
  static const String emotionalFacilitation = 'emotional_facilitation';
  static const String empathy = 'empathy';
  static const String socialSkills = 'social_skills';
  static const String motivation = 'motivation';
  
  static const Map<String, Map<String, String>> scaleNames = {
    emotionalPerception: {
      'ru': 'Восприятие эмоций',
      'en': 'Emotional Perception',
    },
    emotionalUnderstanding: {
      'ru': 'Понимание эмоций',
      'en': 'Emotional Understanding',
    },
    selfManagement: {
      'ru': 'Управление собой',
      'en': 'Self-Management',
    },
    emotionalFacilitation: {
      'ru': 'Использование эмоций',
      'en': 'Emotional Facilitation',
    },
    empathy: {
      'ru': 'Эмпатия',
      'en': 'Empathy',
    },
    socialSkills: {
      'ru': 'Социальные навыки',
      'en': 'Social Skills',
    },
    motivation: {
      'ru': 'Мотивация',
      'en': 'Motivation',
    },
  };
  
  static const Map<String, Map<String, String>> scaleDescriptions = {
    emotionalPerception: {
      'ru': 'Способность точно распознавать эмоции у себя и других людей по мимике, голосу, жестам и поведению',
      'en': 'Ability to accurately recognize emotions in yourself and others through facial expressions, voice, gestures, and behavior',
    },
    emotionalUnderstanding: {
      'ru': 'Понимание причин возникновения эмоций, их развития и взаимосвязей между различными чувствами',
      'en': 'Understanding the causes of emotions, their development, and the relationships between different feelings',
    },
    selfManagement: {
      'ru': 'Способность контролировать и регулировать собственные эмоциональные реакции в различных ситуациях',
      'en': 'Ability to control and regulate your own emotional reactions in various situations',
    },
    emotionalFacilitation: {
      'ru': 'Использование эмоций для повышения качества мышления, принятия решений и творческой деятельности',
      'en': 'Using emotions to enhance thinking quality, decision-making, and creative activities',
    },
    empathy: {
      'ru': 'Способность чувствовать и понимать эмоциональное состояние других людей, сопереживать им',
      'en': 'Ability to feel and understand the emotional state of others and empathize with them',
    },
    socialSkills: {
      'ru': 'Умение эффективно взаимодействовать с людьми, управлять конфликтами и строить здоровые отношения',
      'en': 'Ability to effectively interact with people, manage conflicts, and build healthy relationships',
    },
    motivation: {
      'ru': 'Способность использовать эмоциональную энергию для достижения целей и преодоления препятствий',
      'en': 'Ability to use emotional energy to achieve goals and overcome obstacles',
    },
  };
}

/// Класс вопроса с поддержкой двух языков
class EQQuestion {
  final int id;
  final Map<String, String> text;
  final String scale;
  final bool isReversed;
  
  const EQQuestion({
    required this.id,
    required this.text,
    required this.scale,
    this.isReversed = false,
  });
}

/// Вопросы теста (70 вопросов, по 10 на каждую шкалу)
class EmotionalIntelligenceQuestions {
  static const List<EQQuestion> questions = [
    // ============================================================
    // ВОСПРИЯТИЕ ЭМОЦИЙ (Emotional Perception) - 10 вопросов
    // ============================================================
    EQQuestion(
      id: 1,
      text: {
        'ru': 'Я легко определяю, в каком настроении находятся окружающие',
        'en': 'I easily identify what mood people around me are in',
      },
      scale: 'emotional_perception',
    ),
    EQQuestion(
      id: 2,
      text: {
        'ru': 'Мне сложно понять, что я чувствую в данный момент',
        'en': 'I find it difficult to understand what I am feeling at the moment',
      },
      scale: 'emotional_perception',
      isReversed: true,
    ),
    EQQuestion(
      id: 3,
      text: {
        'ru': 'Я замечаю тонкие изменения в выражении лица собеседника',
        'en': 'I notice subtle changes in my conversation partner\'s facial expressions',
      },
      scale: 'emotional_perception',
    ),
    EQQuestion(
      id: 4,
      text: {
        'ru': 'По интонации голоса я могу определить истинные чувства человека',
        'en': 'I can identify a person\'s true feelings by the tone of their voice',
      },
      scale: 'emotional_perception',
    ),
    EQQuestion(
      id: 5,
      text: {
        'ru': 'Мне трудно распознать, когда кто-то расстроен или обижен',
        'en': 'I find it hard to recognize when someone is upset or offended',
      },
      scale: 'emotional_perception',
      isReversed: true,
    ),
    EQQuestion(
      id: 6,
      text: {
        'ru': 'Я быстро осознаю изменения в своём эмоциональном состоянии',
        'en': 'I quickly become aware of changes in my emotional state',
      },
      scale: 'emotional_perception',
    ),
    EQQuestion(
      id: 7,
      text: {
        'ru': 'Язык тела людей говорит мне больше, чем их слова',
        'en': 'People\'s body language tells me more than their words',
      },
      scale: 'emotional_perception',
    ),
    EQQuestion(
      id: 8,
      text: {
        'ru': 'Я с трудом могу назвать эмоцию, которую испытываю',
        'en': 'I struggle to name the emotion I am experiencing',
      },
      scale: 'emotional_perception',
      isReversed: true,
    ),
    EQQuestion(
      id: 9,
      text: {
        'ru': 'Я замечаю эмоциональную атмосферу в группе людей',
        'en': 'I notice the emotional atmosphere in a group of people',
      },
      scale: 'emotional_perception',
    ),
    EQQuestion(
      id: 10,
      text: {
        'ru': 'Мне легко определить, когда человек неискренен в своих эмоциях',
        'en': 'I easily identify when someone is insincere with their emotions',
      },
      scale: 'emotional_perception',
    ),
    
    // ============================================================
    // ПОНИМАНИЕ ЭМОЦИЙ (Emotional Understanding) - 10 вопросов
    // ============================================================
    EQQuestion(
      id: 11,
      text: {
        'ru': 'Я понимаю, почему у меня возникают определённые эмоции',
        'en': 'I understand why I experience certain emotions',
      },
      scale: 'emotional_understanding',
    ),
    EQQuestion(
      id: 12,
      text: {
        'ru': 'Мне трудно объяснить причины моих чувств',
        'en': 'I find it difficult to explain the reasons for my feelings',
      },
      scale: 'emotional_understanding',
      isReversed: true,
    ),
    EQQuestion(
      id: 13,
      text: {
        'ru': 'Я знаю, как одна эмоция может перерасти в другую',
        'en': 'I know how one emotion can evolve into another',
      },
      scale: 'emotional_understanding',
    ),
    EQQuestion(
      id: 14,
      text: {
        'ru': 'Я понимаю взаимосвязь между моими мыслями и эмоциями',
        'en': 'I understand the connection between my thoughts and emotions',
      },
      scale: 'emotional_understanding',
    ),
    EQQuestion(
      id: 15,
      text: {
        'ru': 'Сложные эмоции других людей остаются для меня загадкой',
        'en': 'Complex emotions of other people remain a mystery to me',
      },
      scale: 'emotional_understanding',
      isReversed: true,
    ),
    EQQuestion(
      id: 16,
      text: {
        'ru': 'Я могу предсказать, как изменятся мои чувства в ближайшем будущем',
        'en': 'I can predict how my feelings will change in the near future',
      },
      scale: 'emotional_understanding',
    ),
    EQQuestion(
      id: 17,
      text: {
        'ru': 'Я понимаю, какие события вызывают у меня стресс',
        'en': 'I understand which events cause me stress',
      },
      scale: 'emotional_understanding',
    ),
    EQQuestion(
      id: 18,
      text: {
        'ru': 'Мне сложно разобраться в смешанных эмоциях',
        'en': 'I find it hard to make sense of mixed emotions',
      },
      scale: 'emotional_understanding',
      isReversed: true,
    ),
    EQQuestion(
      id: 19,
      text: {
        'ru': 'Я осознаю, как моё поведение влияет на эмоции окружающих',
        'en': 'I realize how my behavior affects the emotions of those around me',
      },
      scale: 'emotional_understanding',
    ),
    EQQuestion(
      id: 20,
      text: {
        'ru': 'Я понимаю культурные различия в выражении эмоций',
        'en': 'I understand cultural differences in expressing emotions',
      },
      scale: 'emotional_understanding',
    ),
    
    // ============================================================
    // УПРАВЛЕНИЕ СОБОЙ (Self-Management) - 10 вопросов
    // ============================================================
    EQQuestion(
      id: 21,
      text: {
        'ru': 'Я могу сохранять спокойствие в стрессовых ситуациях',
        'en': 'I can remain calm in stressful situations',
      },
      scale: 'self_management',
    ),
    EQQuestion(
      id: 22,
      text: {
        'ru': 'Когда я злюсь, мне трудно контролировать свои реакции',
        'en': 'When I am angry, I find it hard to control my reactions',
      },
      scale: 'self_management',
      isReversed: true,
    ),
    EQQuestion(
      id: 23,
      text: {
        'ru': 'Я умею быстро восстанавливаться после разочарований',
        'en': 'I know how to recover quickly from disappointments',
      },
      scale: 'self_management',
    ),
    EQQuestion(
      id: 24,
      text: {
        'ru': 'Я могу отложить удовольствие ради достижения важной цели',
        'en': 'I can delay gratification to achieve an important goal',
      },
      scale: 'self_management',
    ),
    EQQuestion(
      id: 25,
      text: {
        'ru': 'Мои эмоции часто выходят из-под контроля',
        'en': 'My emotions often get out of control',
      },
      scale: 'self_management',
      isReversed: true,
    ),
    EQQuestion(
      id: 26,
      text: {
        'ru': 'Я использую техники для управления своим стрессом',
        'en': 'I use techniques to manage my stress',
      },
      scale: 'self_management',
    ),
    EQQuestion(
      id: 27,
      text: {
        'ru': 'Я могу сохранить позитивный настрой даже в трудные времена',
        'en': 'I can maintain a positive attitude even in difficult times',
      },
      scale: 'self_management',
    ),
    EQQuestion(
      id: 28,
      text: {
        'ru': 'Я часто действую импульсивно под влиянием эмоций',
        'en': 'I often act impulsively under the influence of emotions',
      },
      scale: 'self_management',
      isReversed: true,
    ),
    EQQuestion(
      id: 29,
      text: {
        'ru': 'Я умею переключаться с негативных мыслей на позитивные',
        'en': 'I know how to switch from negative thoughts to positive ones',
      },
      scale: 'self_management',
    ),
    EQQuestion(
      id: 30,
      text: {
        'ru': 'Я контролирую свои эмоциональные реакции в конфликтах',
        'en': 'I control my emotional reactions in conflicts',
      },
      scale: 'self_management',
    ),
    
    // ============================================================
    // ИСПОЛЬЗОВАНИЕ ЭМОЦИЙ (Emotional Facilitation) - 10 вопросов
    // ============================================================
    EQQuestion(
      id: 31,
      text: {
        'ru': 'Я использую свои эмоции для повышения креативности',
        'en': 'I use my emotions to enhance creativity',
      },
      scale: 'emotional_facilitation',
    ),
    EQQuestion(
      id: 32,
      text: {
        'ru': 'Эмоции мешают мне принимать правильные решения',
        'en': 'Emotions prevent me from making the right decisions',
      },
      scale: 'emotional_facilitation',
      isReversed: true,
    ),
    EQQuestion(
      id: 33,
      text: {
        'ru': 'Позитивное настроение помогает мне решать проблемы',
        'en': 'A positive mood helps me solve problems',
      },
      scale: 'emotional_facilitation',
    ),
    EQQuestion(
      id: 34,
      text: {
        'ru': 'Я знаю, какие эмоции полезны для разных видов задач',
        'en': 'I know which emotions are useful for different types of tasks',
      },
      scale: 'emotional_facilitation',
    ),
    EQQuestion(
      id: 35,
      text: {
        'ru': 'Мне трудно использовать эмоции в конструктивных целях',
        'en': 'I find it difficult to use emotions for constructive purposes',
      },
      scale: 'emotional_facilitation',
      isReversed: true,
    ),
    EQQuestion(
      id: 36,
      text: {
        'ru': 'Я могу создать нужное настроение для выполнения задачи',
        'en': 'I can create the right mood to complete a task',
      },
      scale: 'emotional_facilitation',
    ),
    EQQuestion(
      id: 37,
      text: {
        'ru': 'Эмоции помогают мне расставлять приоритеты в делах',
        'en': 'Emotions help me prioritize tasks',
      },
      scale: 'emotional_facilitation',
    ),
    EQQuestion(
      id: 38,
      text: {
        'ru': 'Я не понимаю, как можно использовать эмоции для работы',
        'en': 'I don\'t understand how emotions can be used for work',
      },
      scale: 'emotional_facilitation',
      isReversed: true,
    ),
    EQQuestion(
      id: 39,
      text: {
        'ru': 'Я учитываю своё эмоциональное состояние при планировании дел',
        'en': 'I consider my emotional state when planning tasks',
      },
      scale: 'emotional_facilitation',
    ),
    EQQuestion(
      id: 40,
      text: {
        'ru': 'Разные эмоции дают мне разные взгляды на проблему',
        'en': 'Different emotions give me different perspectives on a problem',
      },
      scale: 'emotional_facilitation',
    ),
    
    // ============================================================
    // ЭМПАТИЯ (Empathy) - 10 вопросов
    // ============================================================
    EQQuestion(
      id: 41,
      text: {
        'ru': 'Я глубоко сопереживаю чувствам других людей',
        'en': 'I deeply empathize with other people\'s feelings',
      },
      scale: 'empathy',
    ),
    EQQuestion(
      id: 42,
      text: {
        'ru': 'Мне сложно понять, почему люди реагируют так, а не иначе',
        'en': 'I find it hard to understand why people react the way they do',
      },
      scale: 'empathy',
      isReversed: true,
    ),
    EQQuestion(
      id: 43,
      text: {
        'ru': 'Я чувствую боль других людей, как свою собственную',
        'en': 'I feel other people\'s pain as if it were my own',
      },
      scale: 'empathy',
    ),
    EQQuestion(
      id: 44,
      text: {
        'ru': 'Я умею поставить себя на место другого человека',
        'en': 'I know how to put myself in another person\'s shoes',
      },
      scale: 'empathy',
    ),
    EQQuestion(
      id: 45,
      text: {
        'ru': 'Эмоциональные проблемы других меня не очень волнуют',
        'en': 'Other people\'s emotional problems don\'t concern me much',
      },
      scale: 'empathy',
      isReversed: true,
    ),
    EQQuestion(
      id: 46,
      text: {
        'ru': 'Я внимательно выслушиваю людей, когда им плохо',
        'en': 'I listen carefully to people when they are feeling bad',
      },
      scale: 'empathy',
    ),
    EQQuestion(
      id: 47,
      text: {
        'ru': 'Я чувствую, когда человеку нужна моя поддержка',
        'en': 'I sense when someone needs my support',
      },
      scale: 'empathy',
    ),
    EQQuestion(
      id: 48,
      text: {
        'ru': 'Мне трудно разделять эмоции других людей',
        'en': 'I find it difficult to share other people\'s emotions',
      },
      scale: 'empathy',
      isReversed: true,
    ),
    EQQuestion(
      id: 49,
      text: {
        'ru': 'Я замечаю, когда кому-то нужна помощь, даже если они не просят',
        'en': 'I notice when someone needs help, even if they don\'t ask',
      },
      scale: 'empathy',
    ),
    EQQuestion(
      id: 50,
      text: {
        'ru': 'Я понимаю невысказанные переживания близких мне людей',
        'en': 'I understand the unspoken feelings of people close to me',
      },
      scale: 'empathy',
    ),
    
    // ============================================================
    // СОЦИАЛЬНЫЕ НАВЫКИ (Social Skills) - 10 вопросов
    // ============================================================
    EQQuestion(
      id: 51,
      text: {
        'ru': 'Я легко нахожу общий язык с разными людьми',
        'en': 'I easily find common ground with different people',
      },
      scale: 'social_skills',
    ),
    EQQuestion(
      id: 52,
      text: {
        'ru': 'Мне сложно разрешать конфликты между людьми',
        'en': 'I find it difficult to resolve conflicts between people',
      },
      scale: 'social_skills',
      isReversed: true,
    ),
    EQQuestion(
      id: 53,
      text: {
        'ru': 'Я умею вдохновлять и мотивировать других',
        'en': 'I know how to inspire and motivate others',
      },
      scale: 'social_skills',
    ),
    EQQuestion(
      id: 54,
      text: {
        'ru': 'Я эффективно работаю в команде',
        'en': 'I work effectively in a team',
      },
      scale: 'social_skills',
    ),
    EQQuestion(
      id: 55,
      text: {
        'ru': 'Мне трудно влиять на мнение других людей',
        'en': 'I find it hard to influence other people\'s opinions',
      },
      scale: 'social_skills',
      isReversed: true,
    ),
    EQQuestion(
      id: 56,
      text: {
        'ru': 'Я помогаю людям находить компромиссы в спорах',
        'en': 'I help people find compromises in arguments',
      },
      scale: 'social_skills',
    ),
    EQQuestion(
      id: 57,
      text: {
        'ru': 'Я создаю позитивную атмосферу в группе',
        'en': 'I create a positive atmosphere in a group',
      },
      scale: 'social_skills',
    ),
    EQQuestion(
      id: 58,
      text: {
        'ru': 'Мне сложно выстраивать долгосрочные отношения',
        'en': 'I find it difficult to build long-term relationships',
      },
      scale: 'social_skills',
      isReversed: true,
    ),
    EQQuestion(
      id: 59,
      text: {
        'ru': 'Я умею давать конструктивную обратную связь',
        'en': 'I know how to give constructive feedback',
      },
      scale: 'social_skills',
    ),
    EQQuestion(
      id: 60,
      text: {
        'ru': 'Я успешно адаптируюсь к разным социальным ситуациям',
        'en': 'I successfully adapt to different social situations',
      },
      scale: 'social_skills',
    ),
    
    // ============================================================
    // МОТИВАЦИЯ (Motivation) - 10 вопросов
    // ============================================================
    EQQuestion(
      id: 61,
      text: {
        'ru': 'Я сохраняю энтузиазм даже при столкновении с трудностями',
        'en': 'I maintain enthusiasm even when facing difficulties',
      },
      scale: 'motivation',
    ),
    EQQuestion(
      id: 62,
      text: {
        'ru': 'Мне трудно заставить себя работать над долгосрочными целями',
        'en': 'I find it hard to make myself work on long-term goals',
      },
      scale: 'motivation',
      isReversed: true,
    ),
    EQQuestion(
      id: 63,
      text: {
        'ru': 'Я нахожу внутренние ресурсы для преодоления препятствий',
        'en': 'I find internal resources to overcome obstacles',
      },
      scale: 'motivation',
    ),
    EQQuestion(
      id: 64,
      text: {
        'ru': 'Я стремлюсь к совершенству в том, что делаю',
        'en': 'I strive for excellence in what I do',
      },
      scale: 'motivation',
    ),
    EQQuestion(
      id: 65,
      text: {
        'ru': 'Я быстро теряю интерес к начатым делам',
        'en': 'I quickly lose interest in things I start',
      },
      scale: 'motivation',
      isReversed: true,
    ),
    EQQuestion(
      id: 66,
      text: {
        'ru': 'Я использую свои эмоции как источник энергии для действий',
        'en': 'I use my emotions as a source of energy for action',
      },
      scale: 'motivation',
    ),
    EQQuestion(
      id: 67,
      text: {
        'ru': 'Я настойчив в достижении важных для меня целей',
        'en': 'I am persistent in achieving goals that are important to me',
      },
      scale: 'motivation',
    ),
    EQQuestion(
      id: 68,
      text: {
        'ru': 'Неудачи сильно подрывают мою мотивацию',
        'en': 'Failures severely undermine my motivation',
      },
      scale: 'motivation',
      isReversed: true,
    ),
    EQQuestion(
      id: 69,
      text: {
        'ru': 'Я нахожу смысл и удовлетворение в своей деятельности',
        'en': 'I find meaning and satisfaction in my activities',
      },
      scale: 'motivation',
    ),
    EQQuestion(
      id: 70,
      text: {
        'ru': 'Я оптимистично смотрю на будущее',
        'en': 'I look at the future with optimism',
      },
      scale: 'motivation',
    ),
  ];
}

/// Конфигурация системы ответов
class EQResponseConfig {
  static const String responseType = 'frequency';
  
  static const Map<String, List<String>> options = {
    'ru': ['Никогда', 'Редко', 'Иногда', 'Часто', 'Всегда'],
    'en': ['Never', 'Rarely', 'Sometimes', 'Often', 'Always'],
  };
  
  static const List<int> scoring = [0, 1, 2, 3, 4];
  
  // Формула инверсии для реверсивных вопросов
  static int reverseScore(int score) => 4 - score;
}

/// Профили для интерпретации результатов
class EQInterpretation {
  // Уровни для каждой шкалы (проценты)
  static const Map<String, List<int>> levelThresholds = {
    'very_low': [0, 20],
    'low': [21, 40],
    'medium': [41, 60],
    'high': [61, 80],
    'very_high': [81, 100],
  };
  
  static const Map<String, Map<String, String>> levelLabels = {
    'very_low': {'ru': 'Очень низкий', 'en': 'Very Low'},
    'low': {'ru': 'Низкий', 'en': 'Low'},
    'medium': {'ru': 'Средний', 'en': 'Medium'},
    'high': {'ru': 'Высокий', 'en': 'High'},
    'very_high': {'ru': 'Очень высокий', 'en': 'Very High'},
  };
  
  // Детальные интерпретации для каждой шкалы и уровня
  static Map<String, Map<String, Map<String, dynamic>>> scaleInterpretations = {
    // ВОСПРИЯТИЕ ЭМОЦИЙ
    'emotional_perception': {
      'very_low': {
        'ru': {
          'title': 'Очень низкое восприятие эмоций',
          'description':
              'Вам значительно сложно распознавать эмоциональные сигналы — как свои собственные, так и окружающих людей. Вы можете пропускать важные невербальные подсказки в общении, что иногда приводит к недопониманию. Эмоциональные состояния других людей часто остаются для вас неочевидными.',
          'recommendations': [
            'Начните практиковать осознанность — регулярно останавливайтесь и спрашивайте себя: "Что я сейчас чувствую?"',
            'Изучайте базовые эмоции и учитесь их различать (радость, грусть, гнев, страх, удивление, отвращение)',
            'Обращайте внимание на мимику, позы и жесты людей в повседневной жизни',
            'Смотрите фильмы с субтитрами и пытайтесь определить эмоции персонажей только по выражению лица',
          ],
        },
        'en': {
          'title': 'Very Low Emotional Perception',
          'description':
              'You find it significantly difficult to recognize emotional signals—both your own and those of others. You may miss important nonverbal cues in communication, which sometimes leads to misunderstandings. The emotional states of others often remain unclear to you.',
          'recommendations': [
            'Start practicing mindfulness—regularly pause and ask yourself: "What am I feeling right now?"',
            'Study basic emotions and learn to distinguish them (joy, sadness, anger, fear, surprise, disgust)',
            'Pay attention to people\'s facial expressions, postures, and gestures in everyday life',
            'Watch movies with subtitles and try to identify characters\' emotions only by their facial expressions',
          ],
        },
      },
      'low': {
        'ru': {
          'title': 'Низкое восприятие эмоций',
          'description':
              'Вы периодически улавливаете эмоциональные сигналы, но не всегда точно их интерпретируете. Явные проявления эмоций вы замечаете, но тонкие нюансы часто ускользают от вашего внимания. Это может создавать некоторые сложности в близких отношениях и коллективной работе.',
          'recommendations': [
            'Практикуйте упражнение "эмоциональный дневник" — записывайте свои эмоции 2-3 раза в день',
            'Задавайте людям уточняющие вопросы об их чувствах вместо того, чтобы угадывать',
            'Изучайте литературу по невербальной коммуникации',
            'Развивайте эмпатию через чтение художественной литературы',
          ],
        },
        'en': {
          'title': 'Low Emotional Perception',
          'description':
              'You occasionally pick up on emotional signals but don\'t always interpret them accurately. You notice obvious emotional displays, but subtle nuances often escape your attention. This can create some difficulties in close relationships and teamwork.',
          'recommendations': [
            'Practice the "emotional diary" exercise—record your emotions 2-3 times a day',
            'Ask people clarifying questions about their feelings instead of guessing',
            'Study literature on nonverbal communication',
            'Develop empathy through reading fiction',
          ],
        },
      },
      'medium': {
        'ru': {
          'title': 'Среднее восприятие эмоций',
          'description':
              'У вас адекватная способность распознавать базовые эмоции у себя и других. В большинстве социальных ситуаций вы понимаете эмоциональный контекст, хотя иногда можете упускать детали. Вы достаточно хорошо читаете настроение окружающих в привычных ситуациях.',
          'recommendations': [
            'Развивайте навык распознавания смешанных и сложных эмоций',
            'Обращайте внимание на микровыражения лица (они длятся доли секунды)',
            'Изучайте культурные различия в выражении эмоций',
            'Практикуйте активное слушание, фокусируясь не только на словах, но и на интонации',
          ],
        },
        'en': {
          'title': 'Medium Emotional Perception',
          'description':
              'You have an adequate ability to recognize basic emotions in yourself and others. In most social situations, you understand the emotional context, although you may sometimes miss details. You read the mood of those around you quite well in familiar situations.',
          'recommendations': [
            'Develop the skill of recognizing mixed and complex emotions',
            'Pay attention to microexpressions (they last fractions of a second)',
            'Study cultural differences in emotional expression',
            'Practice active listening, focusing not only on words but also on intonation',
          ],
        },
      },
      'high': {
        'ru': {
          'title': 'Высокое восприятие эмоций',
          'description':
              'Вы хорошо настроены на эмоциональные сигналы. Вы точно определяете не только базовые, но и более сложные эмоциональные состояния людей. Ваша наблюдательность помогает вам эффективно взаимодействовать с окружающими и предвидеть их реакции.',
          'recommendations': [
            'Используйте свой навык для помощи другим в осознании их эмоций',
            'Развивайте способность распознавать подавляемые или скрываемые эмоции',
            'Обучайте других людей эмоциональной грамотности',
            'Будьте внимательны к эмоциональному выгоранию — высокая чувствительность требует заботы о себе',
          ],
        },
        'en': {
          'title': 'High Emotional Perception',
          'description':
              'You are well-attuned to emotional signals. You accurately identify not only basic but also more complex emotional states of people. Your perceptiveness helps you interact effectively with others and anticipate their reactions.',
          'recommendations': [
            'Use your skill to help others become aware of their emotions',
            'Develop the ability to recognize suppressed or hidden emotions',
            'Teach others emotional literacy',
            'Be mindful of emotional burnout—high sensitivity requires self-care',
          ],
        },
      },
      'very_high': {
        'ru': {
          'title': 'Очень высокое восприятие эмоций',
          'description':
              'У вас исключительная способность читать эмоциональные состояния. Вы мгновенно улавливаете тончайшие нюансы в эмоциональной атмосфере и можете различать даже скрываемые чувства. Это делает вас очень проницательным в межличностных отношениях, хотя может быть и эмоционально затратным.',
          'recommendations': [
            'Используйте свой дар в профессиях, требующих эмоционального интеллекта (психология, HR, переговоры)',
            'Устанавливайте эмоциональные границы, чтобы не перегружаться чужими эмоциями',
            'Практикуйте техники эмоциональной защиты',
            'Делитесь своими знаниями, помогая развивать EQ у других людей',
          ],
        },
        'en': {
          'title': 'Very High Emotional Perception',
          'description':
              'You have an exceptional ability to read emotional states. You instantly pick up on the subtlest nuances in the emotional atmosphere and can discern even hidden feelings. This makes you very perceptive in interpersonal relationships, though it can also be emotionally taxing.',
          'recommendations': [
            'Use your gift in professions requiring emotional intelligence (psychology, HR, negotiations)',
            'Set emotional boundaries to avoid being overwhelmed by others\' emotions',
            'Practice emotional protection techniques',
            'Share your knowledge by helping develop EQ in others',
          ],
        },
      },
    },
    
    // ПОНИМАНИЕ ЭМОЦИЙ
    'emotional_understanding': {
      'very_low': {
        'ru': {
          'title': 'Очень низкое понимание эмоций',
          'description':
              'Вам сложно объяснить причины возникновения эмоций и понять закономерности их развития. Связь между событиями и эмоциональными реакциями часто остаётся для вас неясной. Это может затруднять работу над собой и понимание мотивов поведения других людей.',
          'recommendations': [
            'Начните изучать базовую психологию эмоций',
            'Ведите дневник, где записывайте: событие → эмоция → почему именно эта эмоция',
            'Читайте книги по эмоциональному интеллекту (Гоулман, Экман)',
            'Обсуждайте свои эмоции с близкими людьми или психологом',
          ],
        },
        'en': {
          'title': 'Very Low Emotional Understanding',
          'description':
              'You find it difficult to explain the causes of emotions and understand the patterns of their development. The connection between events and emotional reactions often remains unclear to you. This can make self-improvement and understanding others\' behavioral motives challenging.',
          'recommendations': [
            'Start studying basic psychology of emotions',
            'Keep a diary where you record: event → emotion → why this particular emotion',
            'Read books on emotional intelligence (Goleman, Ekman)',
            'Discuss your emotions with loved ones or a psychologist',
          ],
        },
      },
      'low': {
        'ru': {
          'title': 'Низкое понимание эмоций',
          'description':
              'Вы понимаете базовые связи между ситуациями и эмоциями, но более сложные эмоциональные процессы вызывают у вас затруднения. Вам может быть непросто предсказать свои эмоциональные реакции или разобраться в смешанных чувствах.',
          'recommendations': [
            'Изучайте теорию эмоций Плутчика (колесо эмоций)',
            'Анализируйте, как одна эмоция переходит в другую',
            'Обращайте внимание на триггеры ваших эмоций',
            'Практикуйте рефлексию после эмоционально насыщенных ситуаций',
          ],
        },
        'en': {
          'title': 'Low Emotional Understanding',
          'description':
              'You understand basic connections between situations and emotions, but more complex emotional processes cause you difficulties. You may find it challenging to predict your emotional reactions or make sense of mixed feelings.',
          'recommendations': [
            'Study Plutchik\'s theory of emotions (wheel of emotions)',
            'Analyze how one emotion transitions to another',
            'Pay attention to triggers of your emotions',
            'Practice reflection after emotionally charged situations',
          ],
        },
      },
      'medium': {
        'ru': {
          'title': 'Среднее понимание эмоций',
          'description':
              'Вы достаточно хорошо понимаете механизмы возникновения эмоций и их взаимосвязи. Вы можете объяснить большинство своих эмоциональных реакций и понимаете логику чувств других людей. Однако в очень сложных эмоциональных ситуациях вам может потребоваться дополнительное время для анализа.',
          'recommendations': [
            'Углубляйте знания о когнитивной модели эмоций',
            'Изучайте, как убеждения и установки влияют на эмоции',
            'Развивайте навык эмоционального прогнозирования',
            'Читайте исследования по психологии эмоций',
          ],
        },
        'en': {
          'title': 'Medium Emotional Understanding',
          'description':
              'You understand the mechanisms of emotion emergence and their interconnections quite well. You can explain most of your emotional reactions and understand the logic of others\' feelings. However, in very complex emotional situations, you may need additional time for analysis.',
          'recommendations': [
            'Deepen knowledge of the cognitive model of emotions',
            'Study how beliefs and attitudes affect emotions',
            'Develop emotional forecasting skills',
            'Read research on the psychology of emotions',
          ],
        },
      },
      'high': {
        'ru': {
          'title': 'Высокое понимание эмоций',
          'description':
              'Вы обладаете глубоким пониманием эмоциональных процессов. Вы хорошо разбираетесь в причинах эмоций, их развитии и последствиях. Вы можете анализировать сложные эмоциональные состояния и понимать взаимосвязи между разными чувствами.',
          'recommendations': [
            'Применяйте свои знания для помощи другим в понимании их эмоций',
            'Изучайте нейробиологию эмоций',
            'Развивайте способность предвидеть эмоциональную динамику в группах',
            'Рассмотрите возможность менторства или обучения других',
          ],
        },
        'en': {
          'title': 'High Emotional Understanding',
          'description':
              'You have a deep understanding of emotional processes. You are well-versed in the causes of emotions, their development, and consequences. You can analyze complex emotional states and understand the relationships between different feelings.',
          'recommendations': [
            'Apply your knowledge to help others understand their emotions',
            'Study the neurobiology of emotions',
            'Develop the ability to anticipate emotional dynamics in groups',
            'Consider mentoring or teaching others',
          ],
        },
      },
      'very_high': {
        'ru': {
          'title': 'Очень высокое понимание эмоций',
          'description':
              'У вас экспертное понимание эмоциональных процессов. Вы способны видеть глубинные связи между эмоциями, мыслями и поведением. Вы понимаете культурный и социальный контекст эмоций и можете анализировать самые сложные эмоциональные паттерны.',
          'recommendations': [
            'Используйте свои знания в профессиональной деятельности',
            'Проводите тренинги по эмоциональному интеллекту',
            'Публикуйте статьи или ведите блог о психологии эмоций',
            'Помогайте организациям развивать эмоциональную культуру',
          ],
        },
        'en': {
          'title': 'Very High Emotional Understanding',
          'description':
              'You have expert understanding of emotional processes. You can see deep connections between emotions, thoughts, and behavior. You understand the cultural and social context of emotions and can analyze the most complex emotional patterns.',
          'recommendations': [
            'Use your knowledge in professional activities',
            'Conduct emotional intelligence training',
            'Publish articles or maintain a blog on the psychology of emotions',
            'Help organizations develop emotional culture',
          ],
        },
      },
    },
    
    // УПРАВЛЕНИЕ СОБОЙ
    'self_management': {
      'very_low': {
        'ru': {
          'title': 'Очень низкое управление собой',
          'description':
              'Вам значительно сложно контролировать свои эмоциональные реакции. Эмоции часто берут верх над вами, что может приводить к импульсивным действиям и решениям. Стресс и негативные эмоции сильно влияют на ваше поведение и самочувствие.',
          'recommendations': [
            'Начните с простых техник дыхания (4-7-8, квадратное дыхание)',
            'Практикуйте технику "STOP": Stop, Take a breath, Observe, Proceed',
            'Обратитесь к психологу для работы над эмоциональной регуляцией',
            'Избегайте принятия важных решений в состоянии сильных эмоций',
          ],
        },
        'en': {
          'title': 'Very Low Self-Management',
          'description':
              'You find it significantly difficult to control your emotional reactions. Emotions often get the better of you, which can lead to impulsive actions and decisions. Stress and negative emotions strongly affect your behavior and well-being.',
          'recommendations': [
            'Start with simple breathing techniques (4-7-8, box breathing)',
            'Practice the "STOP" technique: Stop, Take a breath, Observe, Proceed',
            'See a psychologist to work on emotional regulation',
            'Avoid making important decisions in a state of strong emotions',
          ],
        },
      },
      'low': {
        'ru': {
          'title': 'Низкое управление собой',
          'description':
              'Вы периодически теряете контроль над эмоциями, особенно в стрессовых ситуациях. Вам сложно сохранять спокойствие при сильном давлении или провокациях. Восстановление после эмоциональных потрясений занимает у вас довольно много времени.',
          'recommendations': [
            'Изучите технику когнитивной переоценки (reappraisal)',
            'Практикуйте прогрессивную мышечную релаксацию',
            'Создайте личный "план действий при стрессе"',
            'Регулярно занимайтесь физической активностью для выхода эмоций',
          ],
        },
        'en': {
          'title': 'Low Self-Management',
          'description':
              'You periodically lose control over your emotions, especially in stressful situations. You find it difficult to remain calm under strong pressure or provocation. Recovery after emotional upheavals takes you quite a long time.',
          'recommendations': [
            'Learn the cognitive reappraisal technique',
            'Practice progressive muscle relaxation',
            'Create a personal "stress action plan"',
            'Engage in regular physical activity to release emotions',
          ],
        },
      },
      'medium': {
        'ru': {
          'title': 'Среднее управление собой',
          'description':
              'Вы способны контролировать свои эмоции в большинстве ситуаций. У вас есть некоторые стратегии эмоциональной регуляции, которые обычно работают. Однако в особо стрессовых или неожиданных обстоятельствах вы всё же можете терять самообладание.',
          'recommendations': [
            'Расширяйте арсенал техник эмоциональной регуляции',
            'Практикуйте mindfulness-медитацию 10-15 минут ежедневно',
            'Развивайте стратегии предварительной подготовки к стрессовым ситуациям',
            'Учитесь распознавать ранние признаки эмоционального перенапряжения',
          ],
        },
        'en': {
          'title': 'Medium Self-Management',
          'description':
              'You are able to control your emotions in most situations. You have some emotional regulation strategies that usually work. However, in particularly stressful or unexpected circumstances, you may still lose your composure.',
          'recommendations': [
            'Expand your arsenal of emotional regulation techniques',
            'Practice mindfulness meditation 10-15 minutes daily',
            'Develop strategies for preparing in advance for stressful situations',
            'Learn to recognize early signs of emotional overload',
          ],
        },
      },
      'high': {
        'ru': {
          'title': 'Высокое управление собой',
          'description':
              'Вы хорошо управляете своими эмоциями даже в сложных ситуациях. У вас есть эффективные стратегии эмоциональной регуляции, и вы умеете быстро восстанавливаться после стресса. Вы редко действуете импульсивно под влиянием эмоций.',
          'recommendations': [
            'Помогайте другим развивать навыки эмоциональной регуляции',
            'Изучайте продвинутые техники (например, диалектическую поведенческую терапию)',
            'Оставайтесь внимательными к признакам накопленного стресса',
            'Делитесь своими стратегиями с другими людьми',
          ],
        },
        'en': {
          'title': 'High Self-Management',
          'description':
              'You manage your emotions well even in difficult situations. You have effective emotional regulation strategies and know how to recover quickly from stress. You rarely act impulsively under the influence of emotions.',
          'recommendations': [
            'Help others develop emotional regulation skills',
            'Study advanced techniques (e.g., dialectical behavior therapy)',
            'Stay mindful of signs of accumulated stress',
            'Share your strategies with others',
          ],
        },
      },
      'very_high': {
        'ru': {
          'title': 'Очень высокое управление собой',
          'description':
              'У вас исключительный уровень эмоционального самоконтроля. Вы сохраняете спокойствие и ясность мышления даже в экстремальных ситуациях. Ваша способность к эмоциональной регуляции позволяет вам эффективно справляться с любым уровнем стресса.',
          'recommendations': [
            'Используйте свой навык в критических ситуациях (кризисное управление, переговоры)',
            'Обучайте других техникам эмоциональной регуляции',
            'Будьте примером эмоциональной зрелости для окружающих',
            'Помните о важности эмоционального отдыха и восполнения ресурсов',
          ],
        },
        'en': {
          'title': 'Very High Self-Management',
          'description':
              'You have an exceptional level of emotional self-control. You remain calm and clear-headed even in extreme situations. Your emotional regulation ability allows you to effectively cope with any level of stress.',
          'recommendations': [
            'Use your skill in critical situations (crisis management, negotiations)',
            'Teach others emotional regulation techniques',
            'Be an example of emotional maturity for those around you',
            'Remember the importance of emotional rest and resource replenishment',
          ],
        },
      },
    },
    
    // ИСПОЛЬЗОВАНИЕ ЭМОЦИЙ
    'emotional_facilitation': {
      'very_low': {
        'ru': {
          'title': 'Очень низкое использование эмоций',
          'description':
              'Вы не используете эмоции как ресурс для деятельности. Эмоции скорее мешают вам, чем помогают в работе и творчестве. Вы не видите связи между эмоциональным состоянием и качеством мышления или принятия решений.',
          'recommendations': [
            'Начните замечать, как разные эмоции влияют на вашу продуктивность',
            'Экспериментируйте с созданием нужного настроения перед задачами (музыка, упражнения)',
            'Изучите концепцию "эмоций как информации"',
            'Попробуйте метод "эмоциональной подготовки" перед важными делами',
          ],
        },
        'en': {
          'title': 'Very Low Emotional Facilitation',
          'description':
              'You don\'t use emotions as a resource for activity. Emotions hinder rather than help you in work and creativity. You don\'t see the connection between emotional state and the quality of thinking or decision-making.',
          'recommendations': [
            'Start noticing how different emotions affect your productivity',
            'Experiment with creating the right mood before tasks (music, exercises)',
            'Study the concept of "emotions as information"',
            'Try the "emotional preparation" method before important tasks',
          ],
        },
      },
      'low': {
        'ru': {
          'title': 'Низкое использование эмоций',
          'description':
              'Вы редко осознанно используете эмоции для повышения эффективности. Хотя иногда вы замечаете, что настроение влияет на результаты, вы не умеете целенаправленно управлять этим процессом. Эмоции чаще воспринимаются как помеха.',
          'recommendations': [
            'Ведите журнал: задача → эмоция → результат',
            'Изучите, какие эмоции полезны для разных типов задач',
            'Практикуйте "эмоциональное якорение" (связывание эмоций с действиями)',
            'Используйте визуализацию для создания нужного эмоционального состояния',
          ],
        },
        'en': {
          'title': 'Low Emotional Facilitation',
          'description':
              'You rarely consciously use emotions to enhance effectiveness. Although you sometimes notice that mood affects results, you don\'t know how to purposefully manage this process. Emotions are more often perceived as a hindrance.',
          'recommendations': [
            'Keep a journal: task → emotion → result',
            'Study which emotions are useful for different types of tasks',
            'Practice "emotional anchoring" (linking emotions to actions)',
            'Use visualization to create the desired emotional state',
          ],
        },
      },
      'medium': {
        'ru': {
          'title': 'Среднее использование эмоций',
          'description':
              'Вы понимаете, что эмоции могут быть полезны в работе и творчестве. Вы иногда используете своё эмоциональное состояние для повышения продуктивности, хотя делаете это не всегда осознанно. Вы начинаете замечать связь между настроением и качеством результатов.',
          'recommendations': [
            'Развивайте навык целенаправленного создания нужных эмоций',
            'Изучайте методы эмоциональной подготовки спортсменов',
            'Практикуйте использование визуализации и аффирмаций',
            'Экспериментируйте с разными подходами к эмоциональной настройке',
          ],
        },
        'en': {
          'title': 'Medium Emotional Facilitation',
          'description':
              'You understand that emotions can be useful in work and creativity. You sometimes use your emotional state to increase productivity, although you don\'t always do this consciously. You begin to notice the connection between mood and result quality.',
          'recommendations': [
            'Develop the skill of purposefully creating needed emotions',
            'Study athletes\' emotional preparation methods',
            'Practice using visualization and affirmations',
            'Experiment with different approaches to emotional tuning',
          ],
        },
      },
      'high': {
        'ru': {
          'title': 'Высокое использование эмоций',
          'description':
              'Вы умело используете эмоции как инструмент для повышения эффективности. Вы знаете, какие эмоции полезны для разных задач, и можете целенаправленно создавать нужное состояние. Ваше эмоциональное состояние помогает вам в креативности и принятии решений.',
          'recommendations': [
            'Обучайте других использованию эмоций для продуктивности',
            'Изучайте передовые техники управления состоянием',
            'Применяйте навык в коучинге или менторстве',
            'Экспериментируйте с сложными эмоциональными паттернами',
          ],
        },
        'en': {
          'title': 'High Emotional Facilitation',
          'description':
              'You skillfully use emotions as a tool to enhance effectiveness. You know which emotions are useful for different tasks and can purposefully create the needed state. Your emotional state helps you in creativity and decision-making.',
          'recommendations': [
            'Teach others to use emotions for productivity',
            'Study advanced state management techniques',
            'Apply the skill in coaching or mentoring',
            'Experiment with complex emotional patterns',
          ],
        },
      },
      'very_high': {
        'ru': {
          'title': 'Очень высокое использование эмоций',
          'description':
              'У вас мастерское владение эмоциями как ресурсом. Вы виртуозно управляете своим эмоциональным состоянием для достижения максимальной эффективности. Вы понимаете тонкую настройку эмоций под разные задачи и можете быстро переключаться между состояниями.',
          'recommendations': [
            'Используйте свой талант в профессиях высокой ответственности',
            'Разрабатывайте авторские методики управления состоянием',
            'Проводите тренинги по пиковой производительности',
            'Делитесь своим опытом через публикации и выступления',
          ],
        },
        'en': {
          'title': 'Very High Emotional Facilitation',
          'description':
              'You have masterful command of emotions as a resource. You virtuously manage your emotional state to achieve maximum effectiveness. You understand the fine-tuning of emotions for different tasks and can quickly switch between states.',
          'recommendations': [
            'Use your talent in high-responsibility professions',
            'Develop proprietary state management methodologies',
            'Conduct peak performance training',
            'Share your experience through publications and presentations',
          ],
        },
      },
    },
    
    // ЭМПАТИЯ
    'empathy': {
      'very_low': {
        'ru': {
          'title': 'Очень низкая эмпатия',
          'description':
              'Вам значительно сложно понимать и разделять чувства других людей. Эмоциональные переживания окружающих часто кажутся вам непонятными или не заслуживающими внимания. Это может создавать барьеры в близких отношениях и затруднять социальное взаимодействие.',
          'recommendations': [
            'Начните практиковать активное слушание без оценок и советов',
            'Задавайте людям вопросы об их чувствах и внимательно слушайте ответы',
            'Читайте художественную литературу, чтобы "прожить" опыт других людей',
            'Попробуйте упражнение: "Если бы я был на его месте, что бы я чувствовал?"',
          ],
        },
        'en': {
          'title': 'Very Low Empathy',
          'description':
              'You find it significantly difficult to understand and share the feelings of others. The emotional experiences of those around you often seem incomprehensible or unworthy of attention. This can create barriers in close relationships and hinder social interaction.',
          'recommendations': [
            'Start practicing active listening without judgments or advice',
            'Ask people about their feelings and listen carefully to their answers',
            'Read fiction to "live through" the experiences of others',
            'Try the exercise: "If I were in their place, what would I feel?"',
          ],
        },
      },
      'low': {
        'ru': {
          'title': 'Низкая эмпатия',
          'description':
              'Вы периодически понимаете чувства других, но не всегда можете глубоко сопереживать. Эмпатия даётся вам с усилием и в основном в отношении близких людей. В сложных эмоциональных ситуациях вы можете чувствовать себя растерянно.',
          'recommendations': [
            'Практикуйте "перспективное мышление" — сознательно ставьте себя на место других',
            'Изучайте невербальные сигналы эмоций',
            'Волонтёрство может помочь развить эмпатию через реальную помощь',
            'Обсуждайте с друзьями их эмоциональный опыт',
          ],
        },
        'en': {
          'title': 'Low Empathy',
          'description':
              'You periodically understand the feelings of others but can\'t always deeply empathize. Empathy comes to you with effort and mainly in relation to close people. In complex emotional situations, you may feel confused.',
          'recommendations': [
            'Practice "perspective-taking"—consciously put yourself in others\' shoes',
            'Study nonverbal emotional signals',
            'Volunteering can help develop empathy through real help',
            'Discuss emotional experiences with friends',
          ],
        },
      },
      'medium': {
        'ru': {
          'title': 'Средняя эмпатия',
          'description':
              'У вас нормальная способность к эмпатии. Вы можете понимать и разделять чувства других людей, особенно когда они открыто о них говорят. Вы сопереживаете близким и можете оказать эмоциональную поддержку, хотя глубокие эмоциональные связи требуют от вас усилий.',
          'recommendations': [
            'Развивайте когнитивную эмпатию (понимание) и аффективную эмпатию (сочувствие)',
            'Практикуйте эмпатическое слушание — отражайте эмоции собеседника',
            'Расширяйте круг эмпатии на менее близких людей',
            'Изучайте истории людей из других культур и слоёв общества',
          ],
        },
        'en': {
          'title': 'Medium Empathy',
          'description':
              'You have a normal capacity for empathy. You can understand and share the feelings of others, especially when they openly talk about them. You empathize with loved ones and can provide emotional support, although deep emotional connections require effort from you.',
          'recommendations': [
            'Develop cognitive empathy (understanding) and affective empathy (compassion)',
            'Practice empathic listening—reflect the emotions of the speaker',
            'Expand the circle of empathy to less close people',
            'Study the stories of people from other cultures and social strata',
          ],
        },
      },
      'high': {
        'ru': {
          'title': 'Высокая эмпатия',
          'description':
              'Вы обладаете сильной способностью к эмпатии. Вы глубоко чувствуете эмоции других людей и можете искренне сопереживать им. Люди часто обращаются к вам за эмоциональной поддержкой, чувствуя ваше понимание и принятие.',
          'recommendations': [
            'Учитесь устанавливать эмоциональные границы, чтобы избежать выгорания',
            'Используйте эмпатию в помогающих профессиях (психология, соцработа, медицина)',
            'Практикуйте "сострадательную эмпатию" — не только чувствуйте, но и действуйте',
            'Заботьтесь о своём эмоциональном здоровье',
          ],
        },
        'en': {
          'title': 'High Empathy',
          'description':
              'You have a strong capacity for empathy. You deeply feel the emotions of others and can sincerely empathize with them. People often turn to you for emotional support, sensing your understanding and acceptance.',
          'recommendations': [
            'Learn to set emotional boundaries to avoid burnout',
            'Use empathy in helping professions (psychology, social work, medicine)',
            'Practice "compassionate empathy"—not only feel but also act',
            'Take care of your emotional health',
          ],
        },
      },
      'very_high': {
        'ru': {
          'title': 'Очень высокая эмпатия',
          'description':
              'У вас исключительная способность к эмпатии. Вы не просто понимаете чувства других — вы буквально переживаете их вместе с людьми. Ваша эмпатия может быть как великим даром для помощи другим, так и источником эмоциональной перегрузки для вас самих.',
          'recommendations': [
            'КРИТИЧЕСКИ ВАЖНО: развивайте навыки эмоциональной защиты',
            'Практикуйте техники "заземления" после эмоционально насыщенных взаимодействий',
            'Регулярно восстанавливайте эмоциональные ресурсы',
            'Рассмотрите работу с психологом для баланса эмпатии и самозащиты',
            'Используйте свой дар осознанно, направляя его туда, где он действительно нужен',
          ],
        },
        'en': {
          'title': 'Very High Empathy',
          'description':
              'You have an exceptional capacity for empathy. You don\'t just understand the feelings of others—you literally experience them together with people. Your empathy can be both a great gift for helping others and a source of emotional overload for yourself.',
          'recommendations': [
            'CRITICALLY IMPORTANT: develop emotional protection skills',
            'Practice "grounding" techniques after emotionally charged interactions',
            'Regularly restore emotional resources',
            'Consider working with a psychologist for balancing empathy and self-protection',
            'Use your gift consciously, directing it where it is truly needed',
          ],
        },
      },
    },
    
    // СОЦИАЛЬНЫЕ НАВЫКИ
    'social_skills': {
      'very_low': {
        'ru': {
          'title': 'Очень низкие социальные навыки',
          'description':
              'Вам значительно сложно выстраивать и поддерживать отношения с людьми. Социальные взаимодействия часто кажутся вам непонятными и сложными. Конфликты вызывают у вас растерянность, и вы не знаете, как их разрешить.',
          'recommendations': [
            'Начните с малого: здоровайтесь с людьми и улыбайтесь',
            'Изучайте базовые правила социального этикета',
            'Найдите группу поддержки или клуб по интересам для практики общения',
            'Рассмотрите возможность работы с психологом над социальными навыками',
          ],
        },
        'en': {
          'title': 'Very Low Social Skills',
          'description':
              'You find it significantly difficult to build and maintain relationships with people. Social interactions often seem incomprehensible and complex to you. Conflicts confuse you, and you don\'t know how to resolve them.',
          'recommendations': [
            'Start small: greet people and smile',
            'Study basic rules of social etiquette',
            'Find a support group or interest club to practice communication',
            'Consider working with a psychologist on social skills',
          ],
        },
      },
      'low': {
        'ru': {
          'title': 'Низкие социальные навыки',
          'description':
              'Вы умеете общаться с людьми на базовом уровне, но более сложные социальные ситуации вызывают у вас затруднения. Конфликты разрешаются с трудом, работа в команде не всегда даётся легко. Вам может быть сложно влиять на других или убеждать их.',
          'recommendations': [
            'Изучайте техники активного слушания',
            'Практикуйте навыки ассертивной коммуникации',
            'Учитесь давать и принимать обратную связь',
            'Читайте книги по межличностному общению (Карнеги, Адлер)',
          ],
        },
        'en': {
          'title': 'Low Social Skills',
          'description':
              'You can communicate with people at a basic level, but more complex social situations cause you difficulties. Conflicts are resolved with difficulty, teamwork doesn\'t always come easily. You may find it difficult to influence or persuade others.',
          'recommendations': [
            'Study active listening techniques',
            'Practice assertive communication skills',
            'Learn to give and receive feedback',
            'Read books on interpersonal communication (Carnegie, Adler)',
          ],
        },
      },
      'medium': {
        'ru': {
          'title': 'Средние социальные навыки',
          'description':
              'Вы достаточно хорошо справляетесь с социальными взаимодействиями в привычных ситуациях. У вас есть друзья и знакомые, вы можете работать в команде. Однако сложные конфликты или необходимость убеждать других всё ещё могут вызывать у вас затруднения.',
          'recommendations': [
            'Развивайте навыки разрешения конфликтов',
            'Изучайте техники влияния и убеждения',
            'Практикуйте публичные выступления',
            'Расширяйте социальный круг, знакомясь с разными людьми',
          ],
        },
        'en': {
          'title': 'Medium Social Skills',
          'description':
              'You handle social interactions quite well in familiar situations. You have friends and acquaintances, you can work in a team. However, complex conflicts or the need to persuade others may still cause you difficulties.',
          'recommendations': [
            'Develop conflict resolution skills',
            'Study influence and persuasion techniques',
            'Practice public speaking',
            'Expand your social circle by meeting different people',
          ],
        },
      },
      'high': {
        'ru': {
          'title': 'Высокие социальные навыки',
          'description':
              'Вы легко находите общий язык с людьми и эффективно взаимодействуете в различных социальных ситуациях. Вы умеете разрешать конфликты, работать в команде и влиять на других. Люди часто обращаются к вам за помощью в социальных вопросах.',
          'recommendations': [
            'Используйте свои навыки в лидерстве',
            'Развивайте способность работать с группами и коллективами',
            'Изучайте продвинутые техники переговоров',
            'Помогайте другим развивать социальные навыки',
          ],
        },
        'en': {
          'title': 'High Social Skills',
          'description':
              'You easily find common ground with people and interact effectively in various social situations. You know how to resolve conflicts, work in a team, and influence others. People often turn to you for help with social issues.',
          'recommendations': [
            'Use your skills in leadership',
            'Develop the ability to work with groups and teams',
            'Study advanced negotiation techniques',
            'Help others develop social skills',
          ],
        },
      },
      'very_high': {
        'ru': {
          'title': 'Очень высокие социальные навыки',
          'description':
              'У вас выдающиеся социальные навыки. Вы мастерски выстраиваете отношения с любыми людьми, создаёте продуктивную атмосферу в коллективах и эффективно разрешаете даже самые сложные конфликты. Ваша способность влиять и вдохновлять других делает вас естественным лидером.',
          'recommendations': [
            'Используйте свой талант в управлении, HR, дипломатии',
            'Становитесь медиатором в сложных конфликтах',
            'Проводите тренинги по коммуникации и лидерству',
            'Менторьте молодых специалистов в развитии социальных навыков',
          ],
        },
        'en': {
          'title': 'Very High Social Skills',
          'description':
              'You have outstanding social skills. You masterfully build relationships with any people, create a productive atmosphere in teams, and effectively resolve even the most complex conflicts. Your ability to influence and inspire others makes you a natural leader.',
          'recommendations': [
            'Use your talent in management, HR, diplomacy',
            'Become a mediator in complex conflicts',
            'Conduct communication and leadership training',
            'Mentor young professionals in developing social skills',
          ],
        },
      },
    },
    
    // МОТИВАЦИЯ
    'motivation': {
      'very_low': {
        'ru': {
          'title': 'Очень низкая мотивация',
          'description':
              'Вам значительно сложно поддерживать мотивацию к достижению целей. Энтузиазм быстро пропадает при столкновении с трудностями. Вам трудно заставить себя работать над долгосрочными задачами, и неудачи сильно вас демотивируют.',
          'recommendations': [
            'Начните с очень маленьких, достижимых целей',
            'Используйте внешние мотиваторы (напоминания, поддержка друзей)',
            'Создайте систему вознаграждений за выполненные задачи',
            'Обратитесь к психологу, если подозреваете депрессию',
          ],
        },
        'en': {
          'title': 'Very Low Motivation',
          'description':
              'You find it significantly difficult to maintain motivation to achieve goals. Enthusiasm quickly disappears when facing difficulties. You find it hard to make yourself work on long-term tasks, and failures strongly demotivate you.',
          'recommendations': [
            'Start with very small, achievable goals',
            'Use external motivators (reminders, friend support)',
            'Create a reward system for completed tasks',
            'See a psychologist if you suspect depression',
          ],
        },
      },
      'low': {
        'ru': {
          'title': 'Низкая мотивация',
          'description':
              'Ваша мотивация нестабильна и зависит от внешних обстоятельств. Вы можете начать проект с энтузиазмом, но быстро теряете интерес. Препятствия часто заставляют вас отказываться от целей. Вам сложно найти внутренние источники мотивации.',
          'recommendations': [
            'Определите свои истинные ценности и согласуйте цели с ними',
            'Визуализируйте желаемый результат ежедневно',
            'Найдите "accountability partner" — человека, перед которым вы отчитываетесь',
            'Изучите технику SMART для постановки целей',
          ],
        },
        'en': {
          'title': 'Low Motivation',
          'description':
              'Your motivation is unstable and depends on external circumstances. You can start a project with enthusiasm but quickly lose interest. Obstacles often make you abandon goals. You find it difficult to find internal sources of motivation.',
          'recommendations': [
            'Define your true values and align goals with them',
            'Visualize the desired result daily',
            'Find an "accountability partner"—someone to whom you report',
            'Study the SMART technique for goal setting',
          ],
        },
      },
      'medium': {
        'ru': {
          'title': 'Средняя мотивация',
          'description':
              'У вас нормальный уровень мотивации для большинства задач. Вы можете работать над целями, хотя иногда нуждаетесь в дополнительных стимулах. Неудачи расстраивают вас, но не заставляют полностью отказываться от целей. Вы находите баланс между упорством и гибкостью.',
          'recommendations': [
            'Развивайте внутреннюю мотивацию через поиск смысла в деятельности',
            'Используйте технику "маленьких побед" для поддержания импульса',
            'Создайте вдохновляющее окружение',
            'Изучайте биографии успешных людей для вдохновения',
          ],
        },
        'en': {
          'title': 'Medium Motivation',
          'description':
              'You have a normal level of motivation for most tasks. You can work towards goals, although you sometimes need additional incentives. Failures upset you but don\'t make you completely abandon goals. You find balance between persistence and flexibility.',
          'recommendations': [
            'Develop intrinsic motivation by finding meaning in activities',
            'Use the "small wins" technique to maintain momentum',
            'Create an inspiring environment',
            'Study biographies of successful people for inspiration',
          ],
        },
      },
      'high': {
        'ru': {
          'title': 'Высокая мотивация',
          'description':
              'Вы обладаете сильной внутренней мотивацией. Вы настойчиво работаете над достижением своих целей и не теряете энтузиазма при столкновении с препятствиями. Вы умеете находить смысл в том, что делаете, и это даёт вам энергию для действий.',
          'recommendations': [
            'Ставьте перед собой амбициозные, но реалистичные цели',
            'Помогайте другим находить и поддерживать мотивацию',
            'Избегайте выгорания — балансируйте усилия с отдыхом',
            'Изучайте продвинутые техники управления энергией',
          ],
        },
        'en': {
          'title': 'High Motivation',
          'description':
              'You have strong intrinsic motivation. You persistently work towards achieving your goals and don\'t lose enthusiasm when facing obstacles. You know how to find meaning in what you do, and this gives you energy for action.',
          'recommendations': [
            'Set ambitious but realistic goals for yourself',
            'Help others find and maintain motivation',
            'Avoid burnout—balance effort with rest',
            'Study advanced energy management techniques',
          ],
        },
      },
      'very_high': {
        'ru': {
          'title': 'Очень высокая мотивация',
          'description':
              'У вас исключительный уровень мотивации и драйва. Вы сохраняете энтузиазм и целеустремлённость даже в самых сложных обстоятельствах. Ваша способность находить внутренние ресурсы и оставаться оптимистичным вдохновляет окружающих. Вы превращаете препятствия в возможности.',
          'recommendations': [
            'Используйте свою энергию для реализации масштабных проектов',
            'Вдохновляйте и мотивируйте других людей',
            'ВАЖНО: следите за балансом работы и личной жизни',
            'Станьте коучем или ментором для тех, кто борется с мотивацией',
            'Делитесь своими стратегиями через книги, блоги или выступления',
          ],
        },
        'en': {
          'title': 'Very High Motivation',
          'description':
              'You have an exceptional level of motivation and drive. You maintain enthusiasm and determination even in the most difficult circumstances. Your ability to find internal resources and remain optimistic inspires those around you. You turn obstacles into opportunities.',
          'recommendations': [
            'Use your energy to implement large-scale projects',
            'Inspire and motivate others',
            'IMPORTANT: monitor work-life balance',
            'Become a coach or mentor for those struggling with motivation',
            'Share your strategies through books, blogs, or presentations',
          ],
        },
      },
    },
  };
}

/// Основной класс данных теста
class EmotionalIntelligenceTestData {
  // Конвертация вопросов в QuestionModel для совместимости с системой
  static List<QuestionModel> getQuestions(String languageCode) {
    return EmotionalIntelligenceQuestions.questions.map((eq) {
      return QuestionModel(
        id: eq.id,
        text: eq.text[languageCode] ?? eq.text['en']!,
        answers: EQResponseConfig.options[languageCode] ?? EQResponseConfig.options['en']!,
        category: eq.scale,
        isReversed: eq.isReversed,
      );
    }).toList();
  }
  
  // Получение метаданных
  static Map<String, dynamic> getMetadata(String languageCode) {
    return {
      'testId': EmotionalIntelligenceTestMetadata.testId,
      'version': EmotionalIntelligenceTestMetadata.version,
      'title': EmotionalIntelligenceTestMetadata.title[languageCode],
      'description': EmotionalIntelligenceTestMetadata.description[languageCode],
      'questionCount': EmotionalIntelligenceTestMetadata.questionCount,
      'estimatedMinutes': EmotionalIntelligenceTestMetadata.estimatedMinutes,
      'targetAudience': EmotionalIntelligenceTestMetadata.targetAudience[languageCode],
      'theoreticalBasis': EmotionalIntelligenceTestMetadata.theoreticalBasis,
    };
  }
  
  // Получение информации о шкалах
  static Map<String, dynamic> getScaleInfo(String scaleId, String languageCode) {
    return {
      'id': scaleId,
      'name': EmotionalIntelligenceScales.scaleNames[scaleId]?[languageCode],
      'description': EmotionalIntelligenceScales.scaleDescriptions[scaleId]?[languageCode],
    };
  }
  
  // Получение интерпретации результата
  static Map<String, dynamic>? getInterpretation(
    String scaleId,
    double percentage,
    String languageCode,
  ) {
    String level = _getLevel(percentage);
    var interpretation = EQInterpretation.scaleInterpretations[scaleId]?[level];
    
    if (interpretation == null) return null;
    
    var langData = interpretation[languageCode];
    if (langData == null) return null;
    
    return {
      'level': level,
      'levelLabel': EQInterpretation.levelLabels[level]?[languageCode],
      'percentage': percentage.round(),
      'title': langData['title'],
      'description': langData['description'],
      'recommendations': langData['recommendations'],
    };
  }
  
  // Определение уровня по проценту
  static String _getLevel(double percentage) {
    if (percentage <= 20) return 'very_low';
    if (percentage <= 40) return 'low';
    if (percentage <= 60) return 'medium';
    if (percentage <= 80) return 'high';
    return 'very_high';
  }
  
  // Вычисление результатов по шкалам
  static Map<String, double> calculateScaleScores(List<int> answers) {
    Map<String, double> scaleScores = {};
    Map<String, int> scaleQuestionCounts = {};
    
    // Инициализация счётчиков
    for (var scale in EmotionalIntelligenceScales.scaleNames.keys) {
      scaleScores[scale] = 0;
      scaleQuestionCounts[scale] = 0;
    }
    
    // Подсчёт баллов по каждой шкале
    for (int i = 0; i < EmotionalIntelligenceQuestions.questions.length; i++) {
      var question = EmotionalIntelligenceQuestions.questions[i];
      var scale = question.scale;
      var answer = answers[i];
      
      // Применяем инверсию для реверсивных вопросов
      var score = question.isReversed 
          ? EQResponseConfig.reverseScore(answer) 
          : answer;
      
      scaleScores[scale] = (scaleScores[scale] ?? 0) + score;
      scaleQuestionCounts[scale] = (scaleQuestionCounts[scale] ?? 0) + 1;
    }
    
    // Нормализация: преобразование в проценты (0-100)
    Map<String, double> normalizedScores = {};
    for (var scale in scaleScores.keys) {
      var rawScore = scaleScores[scale]!;
      var questionCount = scaleQuestionCounts[scale]!;
      var maxPossibleScore = questionCount * 4; // максимум 4 балла за вопрос
      
      normalizedScores[scale] = (rawScore / maxPossibleScore) * 100;
    }
    
    return normalizedScores;
  }
  
  // Вычисление общего EQ (среднее по всем шкалам)
  static double calculateOverallEQ(Map<String, double> scaleScores) {
    if (scaleScores.isEmpty) return 0;
    
    double sum = scaleScores.values.reduce((a, b) => a + b);
    return sum / scaleScores.length;
  }
}
