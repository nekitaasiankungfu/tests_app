// Sleep Quality and Recovery Test
// 40 вопросов, 8 факторов, ~10-12 минут

import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Основной класс данных для теста качества сна и восстановления
class SleepRecoveryData {
  /// Получить модель теста
  static TestModel getSleepRecoveryTest() {
    return TestModel(
      id: 'sleep_recovery_v1',
      categoryId: 'emotional',
      title: {
        'ru': 'Качество сна и восстановления',
        'en': 'Sleep Quality and Recovery',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional Wellbeing',
      },
      description: {
        'ru': 'Этот опрос помогает оценить, насколько сон действительно восстанавливает вас: насколько стабилен ваш режим, '
            'насколько глубок и непрерывный сон, как вы чувствуете себя днём, и насколько на сон влияют стресс и использование гаджетов. '
            'Результат показывает сильные стороны вашего режима сна и зоны риска, которые снижают ресурсность и настроение.\n\n'
            'Тест не является медицинской диагностикой, но помогает заметить привычки, которые поддерживают или, наоборот, '
            'подрывают восстановление. Его удобно использовать вместе с тестами на уровень стресса и цифровой детокс, '
            'чтобы получить целостную картинку вашего эмоционального состояния и образа жизни.',
        'en': 'This questionnaire helps you understand how restorative your sleep really is: how regular your schedule is, '
            'how deep and continuous your sleep feels, how you function during the day, and how stress and digital devices affect your rest. '
            'The result highlights both strengths and risk zones in your sleep routine.\n\n'
            'This is not a medical diagnostic tool, but it can show which habits support recovery and which undermine it. '
            'It works well together with stress and digital detox assessments to give a more complete picture of your emotional well-being and lifestyle.',
      },
      estimatedTime: 12,
      type: TestType.multiFactor,
      factorIds: [
        'sleep_rhythm',
        'sleep_quality',
        'daytime_functioning',
        'screens_and_habits',
        'stress_and_recovery',
        'sleep_environment',
        'physical_symptoms',
        'sleep_disorders',
      ],
      questions: _getQuestions(),
    );
  }

  /// Определить профиль на основе процентов факторов
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_uneven_recovery';

    // Общий балл = среднее по всем 8 факторам
    final avgScore = percentages.values.reduce((a, b) => a + b) / percentages.length;

    if (avgScore >= 85) return 'profile_high_recovery';
    if (avgScore >= 70) return 'profile_stable_recovery';
    if (avgScore >= 50) return 'profile_uneven_recovery';
    return 'profile_fragmented_recovery';
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  // ============================================================
  // PROFILES
  // ============================================================

  static final Map<String, TestProfile> _profiles = {
    'profile_fragmented_recovery': TestProfile(
      id: 'profile_fragmented_recovery',
      name: {
        'ru': 'Сон слабо восстанавливает',
        'en': 'Sleep restores you poorly',
      },
      description: {
        'ru': 'Сразу несколько аспектов сна и восстановления проседают. Режим нестабилен, качество сна низкое, '
            'днём ощущается недостаток энергии. Гаджеты и стресс значительно влияют на засыпание и глубину сна. '
            'Важно обратить внимание на режим и факторы, которые мешают полноценному восстановлению.',
        'en': 'Several aspects of sleep and recovery are low. Schedule is unstable, sleep quality is poor, '
            'and there is a lack of energy during the day. Gadgets and stress significantly affect falling asleep and sleep depth. '
            'It is important to review schedule and factors that prevent full recovery.',
      },
      whyThisProfile: {
        'ru': 'Ваш средний балл по всем факторам сна ниже 50%',
        'en': 'Your average score across all sleep factors is below 50%',
      },
      strengths: {
        'ru': [
          'Осознание проблем со сном — первый шаг к улучшению',
          'Готовность обратить внимание на свои привычки',
        ],
        'en': [
          'Awareness of sleep problems is the first step to improvement',
          'Willingness to address your habits',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Нестабильный режим сна снижает восстановление',
          'Частые пробуждения и долгое засыпание',
          'Дневная сонливость и недостаток энергии',
          'Гаджеты перед сном мешают расслаблению',
          'Стресс и тревожные мысли нарушают сон',
        ],
        'en': [
          'Unstable sleep schedule reduces recovery',
          'Frequent awakenings and long falling asleep time',
          'Daytime sleepiness and lack of energy',
          'Gadgets before bed prevent relaxation',
          'Stress and worrying thoughts disrupt sleep',
        ],
      },
      recommendations: {
        'ru': [
          'Установите постоянное время отхода ко сну и подъёма (даже в выходные)',
          'Уберите экраны за 30-60 минут до сна',
          'Создайте вечерние ритуалы: тёплый душ, лёгкая растяжка, дыхательные упражнения',
          'Сократите кофеин после 16:00',
          'Если тревожные мысли мешают спать, попробуйте выписать их перед сном',
          'При хронических проблемах обратитесь к врачу или сомнологу',
        ],
        'en': [
          'Set a consistent bedtime and wake time (even on weekends)',
          'Remove screens 30-60 minutes before bed',
          'Create evening rituals: warm shower, light stretching, breathing exercises',
          'Reduce caffeine after 4 PM',
          'If worrying thoughts disrupt sleep, try journaling them before bed',
          'For chronic problems, see a doctor or sleep specialist',
        ],
      },
      tryToday: {
        'ru': 'Установите будильник на одно и то же время на всю неделю',
        'en': 'Set an alarm for the same time for the entire week',
      },
      inspiringConclusion: {
        'ru': 'Каждый маленький шаг к лучшему сну — это инвестиция в ваше здоровье и настроение!',
        'en': 'Every small step towards better sleep is an investment in your health and mood!',
      },
    ),
    'profile_uneven_recovery': TestProfile(
      id: 'profile_uneven_recovery',
      name: {
        'ru': 'Неровное восстановление',
        'en': 'Uneven recovery',
      },
      description: {
        'ru': 'Часть привычек поддерживает сон, но есть уязвимые места. Возможно, режим нестабилен, '
            'или гаджеты и стресс периодически мешают качественному отдыху. В целом вы восстанавливаетесь, '
            'но есть запас для улучшений, которые сделают сон более ресурсным.',
        'en': 'Some habits support sleep, but there are vulnerable areas. Perhaps the schedule is unstable, '
            'or gadgets and stress occasionally interfere with quality rest. Overall you recover, '
            'but there is room for improvements that will make sleep more restorative.',
      },
      whyThisProfile: {
        'ru': 'Ваш средний балл по факторам сна находится в диапазоне 50-69%',
        'en': 'Your average score across sleep factors is in the 50-69% range',
      },
      strengths: {
        'ru': [
          'Осознание важности качественного сна',
          'Некоторые здоровые привычки уже есть',
          'Способность замечать факторы, влияющие на сон',
        ],
        'en': [
          'Awareness of the importance of quality sleep',
          'Some healthy habits are already in place',
          'Ability to notice factors affecting sleep',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Режим сна может быть нестабильным',
          'Гаджеты иногда мешают засыпанию',
          'Стресс периодически влияет на качество сна',
          'Дневная энергия колеблется',
        ],
        'en': [
          'Sleep schedule may be unstable',
          'Gadgets sometimes interfere with falling asleep',
          'Stress occasionally affects sleep quality',
          'Daytime energy fluctuates',
        ],
      },
      recommendations: {
        'ru': [
          'Выберите 1-2 слабых места и сосредоточьтесь на их улучшении',
          'Создайте «режим полёта для мозга»: 30-60 минут до сна без экранов',
          'Добавьте короткие практики разгрузки перед сном',
          'Следите за связью между стрессом днём и качеством сна',
          'Сравните результаты с тестами на стресс и цифровой детокс',
        ],
        'en': [
          'Choose 1-2 weak spots and focus on improving them',
          'Create a "flight mode for the brain": 30-60 minutes before bed without screens',
          'Add short unloading practices before bed',
          'Track the link between daytime stress and sleep quality',
          'Compare results with stress and digital detox tests',
        ],
      },
      tryToday: {
        'ru': 'Создайте простой вечерний ритуал: душ или 5 минут дыхательных упражнений',
        'en': 'Create a simple evening ritual: shower or 5 minutes of breathing exercises',
      },
      inspiringConclusion: {
        'ru': 'Вы на правильном пути — несколько корректировок сделают сон вашим ресурсом!',
        'en': 'You are on the right path — a few adjustments will make sleep your resource!',
      },
    ),
    'profile_stable_recovery': TestProfile(
      id: 'profile_stable_recovery',
      name: {
        'ru': 'Достаточное восстановление',
        'en': 'Adequate recovery',
      },
      description: {
        'ru': 'В целом сон хорошо восстанавливает вас. Режим достаточно стабильный, качество сна приемлемое, '
            'днём хватает энергии. Гаджеты и стресс не сильно мешают отдыху. Отдельные корректировки '
            'могут сделать режим ещё более ресурсным и устойчивым.',
        'en': 'Overall sleep restores you well. Schedule is quite stable, sleep quality is acceptable, '
            'there is enough energy during the day. Gadgets and stress do not greatly interfere with rest. '
            'Small adjustments can make the routine even more restorative and resilient.',
      },
      whyThisProfile: {
        'ru': 'Ваш средний балл по факторам сна находится в диапазоне 70-84%',
        'en': 'Your average score across sleep factors is in the 70-84% range',
      },
      strengths: {
        'ru': [
          'Стабильный режим сна и подъёма',
          'Хорошее качество сна и непрерывность',
          'Достаточная дневная бодрость и энергия',
          'Здоровые привычки перед сном',
          'Умение восстанавливаться после стресса',
        ],
        'en': [
          'Stable sleep and wake schedule',
          'Good sleep quality and continuity',
          'Adequate daytime alertness and energy',
          'Healthy pre-sleep habits',
          'Ability to recover after stress',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Есть запас для оптимизации режима',
          'Стрессовые периоды могут влиять на сон',
        ],
        'en': [
          'There is room for schedule optimization',
          'Stressful periods may affect sleep',
        ],
      },
      recommendations: {
        'ru': [
          'Поддерживайте текущие здоровые привычки',
          'Отслеживайте изменения качества сна в стрессовые периоды',
          'Добавьте больше восстановительных активностей при высоком стрессе',
          'Продолжайте соблюдать гигиену сна',
          'Делитесь своим опытом с теми, кто борется со сном',
        ],
        'en': [
          'Maintain current healthy habits',
          'Track sleep quality changes during stressful periods',
          'Add more recovery activities when stress is high',
          'Continue practicing good sleep hygiene',
          'Share your experience with those struggling with sleep',
        ],
      },
      tryToday: {
        'ru': 'Поблагодарите себя за здоровые привычки сна, которые вы уже внедрили',
        'en': 'Thank yourself for the healthy sleep habits you have already implemented',
      },
      inspiringConclusion: {
        'ru': 'Ваш сон — надёжный ресурс, который поддерживает ваше благополучие!',
        'en': 'Your sleep is a reliable resource that supports your well-being!',
      },
    ),
    'profile_high_recovery': TestProfile(
      id: 'profile_high_recovery',
      name: {
        'ru': 'Сон как ключевой ресурс',
        'en': 'Sleep as a key resource',
      },
      description: {
        'ru': 'Сон устойчиво поддерживает ваше состояние. Режим стабильный, качество сна высокое, '
            'днём вы чувствуете себя бодрым и энергичным. Вы умеете защищать свой сон от гаджетов и стресса, '
            'быстро засыпаете и хорошо восстанавливаетесь. Важно бережно сохранять этот ресурс даже в стрессовые периоды.',
        'en': 'Sleep consistently supports your well-being. Schedule is stable, sleep quality is high, '
            'you feel alert and energetic during the day. You know how to protect your sleep from gadgets and stress, '
            'fall asleep quickly and recover well. It is important to protect this resource even during stressful periods.',
      },
      whyThisProfile: {
        'ru': 'Ваш средний балл по факторам сна выше 85%',
        'en': 'Your average score across sleep factors is above 85%',
      },
      strengths: {
        'ru': [
          'Очень стабильный режим сна и подъёма',
          'Отличное качество сна и быстрое засыпание',
          'Высокая дневная энергия и концентрация',
          'Эффективные вечерние ритуалы',
          'Умение защищать сон от внешних факторов',
          'Быстрое восстановление после стресса',
        ],
        'en': [
          'Very stable sleep and wake schedule',
          'Excellent sleep quality and quick falling asleep',
          'High daytime energy and concentration',
          'Effective evening rituals',
          'Ability to protect sleep from external factors',
          'Quick recovery after stress',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск потери навыков при изменении обстоятельств',
        ],
        'en': [
          'Risk of losing skills when circumstances change',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте бережно относиться к своему сну',
          'Делитесь своими практиками с окружающими',
          'Будьте примером здоровых привычек сна',
          'При стрессе возвращайтесь к базовым принципам гигиены сна',
          'Помогайте другим выстроить здоровый режим',
        ],
        'en': [
          'Continue to treat your sleep with care',
          'Share your practices with others',
          'Be an example of healthy sleep habits',
          'Return to basic sleep hygiene principles during stress',
          'Help others build a healthy schedule',
        ],
      },
      tryToday: {
        'ru': 'Поделитесь одним секретом качественного сна с кем-то близким',
        'en': 'Share one secret to quality sleep with someone close',
      },
      inspiringConclusion: {
        'ru': 'Ваш сон — мощный ресурс, который поддерживает всю вашу жизнь. Берегите его!',
        'en': 'Your sleep is a powerful resource that supports your entire life. Protect it!',
      },
    ),
  };

  // ============================================================
  // FACTOR NAMES
  // ============================================================

  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'sleep_rhythm': {
        'ru': 'Режим сна',
        'en': 'Sleep rhythm',
      },
      'sleep_quality': {
        'ru': 'Субъективное качество сна',
        'en': 'Subjective sleep quality',
      },
      'daytime_functioning': {
        'ru': 'Дневная бодрость',
        'en': 'Daytime functioning',
      },
      'screens_and_habits': {
        'ru': 'Гаджеты и привычки перед сном',
        'en': 'Screens and pre-sleep habits',
      },
      'stress_and_recovery': {
        'ru': 'Стресс и восстановление',
        'en': 'Stress and recovery',
      },
      'sleep_environment': {
        'ru': 'Условия в спальне',
        'en': 'Sleep environment',
      },
      'physical_symptoms': {
        'ru': 'Физические симптомы',
        'en': 'Physical symptoms',
      },
      'sleep_disorders': {
        'ru': 'Признаки нарушений сна',
        'en': 'Sleep disorder signs',
      },
    };
  }

  // ============================================================
  // FACTOR INTERPRETATIONS
  // ============================================================

  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    // NaN protection
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    // Все факторы имеют одинаковые уровни интерпретации
    if (percentage >= 80) {
      return _getHighInterpretation(factorId);
    } else if (percentage >= 60) {
      return _getModerateInterpretation(factorId);
    } else if (percentage >= 40) {
      return _getLowInterpretation(factorId);
    } else {
      return _getVeryLowInterpretation(factorId);
    }
  }

  static Map<String, String> _getVeryLowInterpretation(String factorId) {
    final interpretations = {
      'sleep_rhythm': {
        'ru': 'Низкий уровень восстановления. Зона риска, выраженные трудности в этой области.',
        'en': 'Low recovery level. Risk zone with pronounced difficulties in this area.',
      },
      'sleep_quality': {
        'ru': 'Низкий уровень восстановления. Зона риска, выраженные трудности в этой области.',
        'en': 'Low recovery level. Risk zone with pronounced difficulties in this area.',
      },
      'daytime_functioning': {
        'ru': 'Низкий уровень восстановления. Зона риска, выраженные трудности в этой области.',
        'en': 'Low recovery level. Risk zone with pronounced difficulties in this area.',
      },
      'screens_and_habits': {
        'ru': 'Низкий уровень восстановления. Зона риска, выраженные трудности в этой области.',
        'en': 'Low recovery level. Risk zone with pronounced difficulties in this area.',
      },
      'stress_and_recovery': {
        'ru': 'Низкий уровень восстановления. Зона риска, выраженные трудности в этой области.',
        'en': 'Low recovery level. Risk zone with pronounced difficulties in this area.',
      },
      'sleep_environment': {
        'ru': 'Низкий уровень. Условия в спальне значительно мешают качественному сну.',
        'en': 'Low level. Bedroom conditions significantly interfere with quality sleep.',
      },
      'physical_symptoms': {
        'ru': 'Низкий уровень. Частые физические симптомы и дискомфорт во время сна.',
        'en': 'Low level. Frequent physical symptoms and discomfort during sleep.',
      },
      'sleep_disorders': {
        'ru': 'Низкий уровень. Множественные признаки нарушений сна. Рекомендуется консультация специалиста.',
        'en': 'Low level. Multiple signs of sleep disorders. Specialist consultation recommended.',
      },
    };
    return interpretations[factorId] ?? {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'};
  }

  static Map<String, String> _getLowInterpretation(String factorId) {
    final interpretations = {
      'sleep_rhythm': {
        'ru': 'Уязвимый уровень. Есть слабые места, которые стоит проработать.',
        'en': 'Vulnerable level. Some weak spots that need attention.',
      },
      'sleep_quality': {
        'ru': 'Уязвимый уровень. Есть слабые места, которые стоит проработать.',
        'en': 'Vulnerable level. Some weak spots that need attention.',
      },
      'daytime_functioning': {
        'ru': 'Уязвимый уровень. Есть слабые места, которые стоит проработать.',
        'en': 'Vulnerable level. Some weak spots that need attention.',
      },
      'screens_and_habits': {
        'ru': 'Уязвимый уровень. Есть слабые места, которые стоит проработать.',
        'en': 'Vulnerable level. Some weak spots that need attention.',
      },
      'stress_and_recovery': {
        'ru': 'Уязвимый уровень. Есть слабые места, которые стоит проработать.',
        'en': 'Vulnerable level. Some weak spots that need attention.',
      },
      'sleep_environment': {
        'ru': 'Уязвимый уровень. Некоторые условия в спальне нуждаются в улучшении.',
        'en': 'Vulnerable level. Some bedroom conditions need improvement.',
      },
      'physical_symptoms': {
        'ru': 'Уязвимый уровень. Периодический дискомфорт влияет на качество сна.',
        'en': 'Vulnerable level. Periodic discomfort affects sleep quality.',
      },
      'sleep_disorders': {
        'ru': 'Уязвимый уровень. Некоторые признаки нарушений сна присутствуют.',
        'en': 'Vulnerable level. Some signs of sleep disorders are present.',
      },
    };
    return interpretations[factorId] ?? {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'};
  }

  static Map<String, String> _getModerateInterpretation(String factorId) {
    final interpretations = {
      'sleep_rhythm': {
        'ru': 'Функциональный уровень. В целом всё работает, но есть запас для улучшений.',
        'en': 'Functional level. Overall things work, but there is room for improvement.',
      },
      'sleep_quality': {
        'ru': 'Функциональный уровень. В целом всё работает, но есть запас для улучшений.',
        'en': 'Functional level. Overall things work, but there is room for improvement.',
      },
      'daytime_functioning': {
        'ru': 'Функциональный уровень. В целом всё работает, но есть запас для улучшений.',
        'en': 'Functional level. Overall things work, but there is room for improvement.',
      },
      'screens_and_habits': {
        'ru': 'Функциональный уровень. В целом всё работает, но есть запас для улучшений.',
        'en': 'Functional level. Overall things work, but there is room for improvement.',
      },
      'stress_and_recovery': {
        'ru': 'Функциональный уровень. В целом всё работает, но есть запас для улучшений.',
        'en': 'Functional level. Overall things work, but there is room for improvement.',
      },
      'sleep_environment': {
        'ru': 'Функциональный уровень. Условия в спальне в целом подходящие для сна.',
        'en': 'Functional level. Bedroom conditions are generally suitable for sleep.',
      },
      'physical_symptoms': {
        'ru': 'Функциональный уровень. Физический комфорт во время сна в норме.',
        'en': 'Functional level. Physical comfort during sleep is normal.',
      },
      'sleep_disorders': {
        'ru': 'Функциональный уровень. Минимальные признаки нарушений сна.',
        'en': 'Functional level. Minimal signs of sleep disorders.',
      },
    };
    return interpretations[factorId] ?? {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'};
  }

  static Map<String, String> _getHighInterpretation(String factorId) {
    final interpretations = {
      'sleep_rhythm': {
        'ru': 'Ресурсный уровень. Зона силы, здоровые привычки хорошо поддерживают сон.',
        'en': 'Resourceful level. Strength area, habits support healthy sleep.',
      },
      'sleep_quality': {
        'ru': 'Ресурсный уровень. Зона силы, здоровые привычки хорошо поддерживают сон.',
        'en': 'Resourceful level. Strength area, habits support healthy sleep.',
      },
      'daytime_functioning': {
        'ru': 'Ресурсный уровень. Зона силы, здоровые привычки хорошо поддерживают сон.',
        'en': 'Resourceful level. Strength area, habits support healthy sleep.',
      },
      'screens_and_habits': {
        'ru': 'Ресурсный уровень. Зона силы, здоровые привычки хорошо поддерживают сон.',
        'en': 'Resourceful level. Strength area, habits support healthy sleep.',
      },
      'stress_and_recovery': {
        'ru': 'Ресурсный уровень. Зона силы, здоровые привычки хорошо поддерживают сон.',
        'en': 'Resourceful level. Strength area, habits support healthy sleep.',
      },
      'sleep_environment': {
        'ru': 'Ресурсный уровень. Отличные условия для качественного сна.',
        'en': 'Resourceful level. Excellent conditions for quality sleep.',
      },
      'physical_symptoms': {
        'ru': 'Ресурсный уровень. Нет физического дискомфорта во время сна.',
        'en': 'Resourceful level. No physical discomfort during sleep.',
      },
      'sleep_disorders': {
        'ru': 'Ресурсный уровень. Отсутствие признаков нарушений сна.',
        'en': 'Resourceful level. No signs of sleep disorders.',
      },
    };
    return interpretations[factorId] ?? {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'};
  }

  // ============================================================
  // QUESTIONS
  // ============================================================

  static List<QuestionModel> _getQuestions() {
    final answers = _getLikertAnswers();

    return [
      // sleep_rhythm (3 questions: 1, 2, 16)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я обычно ложусь спать примерно в одно и то же время (±30 минут).',
          'en': 'I usually go to bed at roughly the same time (±30 minutes).',
        },
        answers: answers,
        factorId: 'sleep_rhythm',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'По будням и выходным я просыпаюсь в похожее время.',
          'en': 'On weekdays and weekends I wake up at similar times.',
        },
        answers: answers,
        factorId: 'sleep_rhythm',
        isReversed: false,
      ),
      // sleep_quality (4 questions: 3, 4, 5, 13)
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Большинство ночей я засыпаю в течение 20–30 минут.',
          'en': 'On most nights I fall asleep within 20–30 minutes.',
        },
        answers: answers,
        factorId: 'sleep_quality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я редко долго лежу ночью без сна или часто просыпаюсь.',
          'en': 'I rarely lie awake for long at night or wake up repeatedly.',
        },
        answers: answers,
        factorId: 'sleep_quality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'По утрам я чаще чувствую себя отдохнувшим(ей), чем разбитым(ой).',
          'en': 'In the morning I more often feel rested than exhausted.',
        },
        answers: answers,
        factorId: 'sleep_quality',
        isReversed: false,
      ),
      // daytime_functioning (3 questions: 6, 7, 8 - где 6 и 8 reversed)
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Днём мне настолько хочется спать, что тянет прилечь или вздремнуть.',
          'en': 'During the day I feel so sleepy that I want to lie down or nap.',
        },
        answers: answers,
        factorId: 'daytime_functioning',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'В течение дня мне в целом хватает энергии и концентрации.',
          'en': 'Overall I have enough energy and concentration during the day.',
        },
        answers: answers,
        factorId: 'daytime_functioning',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'За последние пару недель я случайно засыпал(а) днём (за рабочим столом, перед экраном, в транспорте).',
          'en': 'In the past couple of weeks I have unintentionally nodded off during the day (at my desk, in front of a screen, in transport).',
        },
        answers: answers,
        factorId: 'daytime_functioning',
        isReversed: true, // REVERSED
      ),
      // screens_and_habits (5 questions: 9, 10, 11, 14, 19 - где 10 и 14 reversed)
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'За 30–60 минут до сна я стараюсь отложить телефон, компьютер и другие экраны.',
          'en': 'I try to put away my phone, computer and other screens 30–60 minutes before bedtime.',
        },
        answers: answers,
        factorId: 'screens_and_habits',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Лежа в постели, я часто листаю ленту, мессенджеры или смотрю видео.',
          'en': 'While in bed I often scroll feeds, check messengers or watch videos.',
        },
        answers: answers,
        factorId: 'screens_and_habits',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'В моей спальне достаточно тихо, темно и прохладно, чтобы хорошо спать.',
          'en': 'My bedroom is quiet, dark and cool enough for good sleep.',
        },
        answers: answers,
        factorId: 'screens_and_habits',
        isReversed: false,
      ),
      // stress_and_recovery (5 questions: 12, 15, 17, 18, 20 - где 12 и 15 reversed)
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Когда я ложусь спать, мысли о работе, делах или проблемах мешают мне расслабиться.',
          'en': 'When I go to bed, thoughts about work, tasks or problems keep me from relaxing.',
        },
        answers: answers,
        factorId: 'stress_and_recovery',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Если я просыпаюсь среди ночи, мне обычно несложно снова заснуть.',
          'en': 'If I wake up during the night, I can usually fall asleep again without much difficulty.',
        },
        answers: answers,
        factorId: 'sleep_quality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я регулярно употребляю кофеин или энергетики во второй половине дня (после 16:00).',
          'en': 'I regularly consume caffeine or energy drinks in the late afternoon or evening (after 4 p.m.).',
        },
        answers: answers,
        factorId: 'screens_and_habits',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Ночью я часто смотрю на часы и начинаю нервничать из-за того, что «опять не высплюсь».',
          'en': 'At night I often check the time and feel anxious that I \'won\'t get enough sleep again\'.',
        },
        answers: answers,
        factorId: 'stress_and_recovery',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'В среднем я сплю не менее 7 и не более 9 часов в сутки.',
          'en': 'On average I sleep at least 7 and no more than 9 hours per night.',
        },
        answers: answers,
        factorId: 'sleep_rhythm',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'После напряжённого дня одна-две ночи нормального сна обычно помогают мне восстановиться.',
          'en': 'After a demanding day, one or two nights of normal sleep usually help me recover.',
        },
        answers: answers,
        factorId: 'stress_and_recovery',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Если мне удаётся несколько ночей подряд нормально высыпаться, моё настроение заметно улучшается.',
          'en': 'If I manage to sleep well for several nights in a row, my mood noticeably improves.',
        },
        answers: answers,
        factorId: 'stress_and_recovery',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'У меня есть небольшие вечерние ритуалы (душ, чтение, растяжка и т.п.), которые помогают спокойно перейти ко сну.',
          'en': 'I have small evening rituals (shower, reading, stretching, etc.) that help me wind down for sleep.',
        },
        answers: answers,
        factorId: 'screens_and_habits',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Если я замечаю, что сон ухудшается, я стараюсь быстро корректировать режим или привычки.',
          'en': 'If I notice my sleep getting worse, I try to adjust my schedule or habits quickly.',
        },
        answers: answers,
        factorId: 'stress_and_recovery',
        isReversed: false,
      ),

      // ========================================================================
      // SLEEP_ENVIRONMENT (5 questions: 21-25)
      // Условия в спальне: температура, свет, шум, комфорт
      // ========================================================================
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Температура в моей спальне комфортная для сна (прохладная, не жаркая).',
          'en': 'The temperature in my bedroom is comfortable for sleep (cool, not hot).',
        },
        answers: answers,
        factorId: 'sleep_environment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Посторонние звуки (шум с улицы, соседи) мешают мне засыпать или будят ночью.',
          'en': 'External noises (street noise, neighbors) prevent me from falling asleep or wake me up at night.',
        },
        answers: answers,
        factorId: 'sleep_environment',
        isReversed: true,  // reversed
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'В моей спальне достаточно темно ночью (нет яркого света из окон или устройств).',
          'en': 'My bedroom is dark enough at night (no bright light from windows or devices).',
        },
        answers: answers,
        factorId: 'sleep_environment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Моя кровать или подушка вызывает дискомфорт во время сна.',
          'en': 'My bed or pillow causes discomfort during sleep.',
        },
        answers: answers,
        factorId: 'sleep_environment',
        isReversed: true,  // reversed
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Моя спальня предназначена только для сна (не для работы или еды).',
          'en': 'My bedroom is used only for sleep (not for work or eating).',
        },
        answers: answers,
        factorId: 'sleep_environment',
        isReversed: false,
      ),

      // ========================================================================
      // PHYSICAL_SYMPTOMS (5 questions: 26-30)
      // Физические симптомы: боли, дискомфорт, ночные пробуждения
      // ========================================================================
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я просыпаюсь ночью из-за боли, дискомфорта или необходимости в туалет.',
          'en': 'I wake up at night due to pain, discomfort, or needing the bathroom.',
        },
        answers: answers,
        factorId: 'physical_symptoms',
        isReversed: true,  // reversed
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'По утрам у меня не болит голова или шея.',
          'en': 'I do not have headaches or neck pain in the morning.',
        },
        answers: answers,
        factorId: 'physical_symptoms',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Во время сна я часто потею или мне то жарко, то холодно.',
          'en': 'During sleep I often sweat or feel too hot or too cold.',
        },
        answers: answers,
        factorId: 'physical_symptoms',
        isReversed: true,  // reversed
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я могу спать в удобной позе всю ночь без необходимости часто менять положение.',
          'en': 'I can sleep in a comfortable position all night without needing to change position frequently.',
        },
        answers: answers,
        factorId: 'physical_symptoms',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Утром я чувствую себя физически восстановленным(ой), а не разбитым(ой).',
          'en': 'In the morning I feel physically restored, not exhausted.',
        },
        answers: answers,
        factorId: 'physical_symptoms',
        isReversed: false,
      ),

      // ========================================================================
      // SLEEP_DISORDERS (10 questions: 31-40)
      // Признаки нарушений сна: храп, апноэ, бессонница, беспокойные ноги
      // ========================================================================
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Мне говорили, что я громко храплю во сне.',
          'en': 'I have been told that I snore loudly during sleep.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я просыпаюсь с ощущением удушья или нехватки воздуха.',
          'en': 'I wake up feeling like I am choking or short of breath.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: true,  // reversed
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'У меня бывают неприятные ощущения в ногах (покалывание, мурашки), которые мешают заснуть.',
          'en': 'I have unpleasant sensations in my legs (tingling, crawling) that prevent me from falling asleep.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я могу заснуть без проблем, когда хочу.',
          'en': 'I can fall asleep without problems when I want to.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Мне часто снятся кошмары или очень тревожные сны.',
          'en': 'I often have nightmares or very disturbing dreams.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я просыпаюсь слишком рано утром и не могу снова заснуть.',
          'en': 'I wake up too early in the morning and cannot fall back asleep.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: true,  // reversed
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я чувствую себя сонным(ой) днём, даже если поспал(а) достаточно часов.',
          'en': 'I feel sleepy during the day even if I have slept enough hours.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Мне приходится двигать ногами ночью, чтобы избавиться от дискомфорта.',
          'en': 'I have to move my legs at night to relieve discomfort.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я засыпаю в неподходящих ситуациях (на работе, за рулём, во время разговора).',
          'en': 'I fall asleep in inappropriate situations (at work, while driving, during conversations).',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'В целом я не испытываю серьёзных проблем с засыпанием или качеством сна.',
          'en': 'Overall, I do not experience serious problems with falling asleep or sleep quality.',
        },
        answers: answers,
        factorId: 'sleep_disorders',
        isReversed: false,
      ),
    ];
  }

  /// Ответы Likert 5-point (0-4): Почти никогда - Редко - Иногда - Часто - Почти всегда
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: '0',
        text: {
          'ru': 'Почти никогда',
          'en': 'Almost never',
        },
        score: 0,
      ),
      AnswerModel(
        id: '1',
        text: {
          'ru': 'Редко',
          'en': 'Rarely',
        },
        score: 1,
      ),
      AnswerModel(
        id: '2',
        text: {
          'ru': 'Иногда',
          'en': 'Sometimes',
        },
        score: 2,
      ),
      AnswerModel(
        id: '3',
        text: {
          'ru': 'Часто',
          'en': 'Often',
        },
        score: 3,
      ),
      AnswerModel(
        id: '4',
        text: {
          'ru': 'Почти всегда',
          'en': 'Almost always',
        },
        score: 4,
      ),
    ];
  }
}
