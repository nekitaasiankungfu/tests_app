import '../models/test_model.dart';

/// Test data for 16 Personality Types (based on Jung's typology)
/// IMPORTANT: Never use "MBTI" trademark - use "16 Personality Types" instead
class SixteenTypesData {
  static TestModel getSixteenTypesTest() {
    return TestModel(
      id: 'sixteen_types',
      title: {
        'ru': '16 типов личности',
        'en': '16 Personality Types',
      },
      description: {
        'ru': 'Развёрнутый личностный тест, основанный на концепции психологических типов К. Г. Юнга',
        'en': 'Comprehensive personality test based on C.G. Jung\'s concept of psychological types',
      },
      category: {
        'ru': 'Типология личности',
        'en': 'Personality Typology',
      },
      categoryId: 'personality',
      estimatedTime: 15,
      type: TestType.multiFactor,
      isBipolar: true,
      factorIds: ['EI', 'SN', 'TF', 'JP'],
      bipolarDimensions: ['mbti_ei', 'mbti_sn', 'mbti_tf', 'mbti_jp'],
      disclaimer: {
        'ru': '''Этот тест основан на концепции психологических типов К.Г. Юнга и помогает лучше понять свои предпочтения в восприятии мира и принятии решений.

Отвечайте спонтанно — как вы чувствуете чаще всего, а не как "должно быть". Нет правильных или неправильных ответов.

Результаты носят рекомендательный характер и не являются профессиональной психодиагностикой. Ваш тип личности не ограничивает вас — он помогает понять, как вы воспринимаете мир и принимаете решения.''',
        'en': '''This test is based on C.G. Jung's concept of psychological types and helps you better understand your preferences in perceiving the world and making decisions.

Answer spontaneously — as you feel most of the time, not as it "should be". There are no right or wrong answers.

Results are for guidance only and are not professional psychological diagnostics. Your personality type does not limit you — it helps you understand how you perceive the world and make decisions.''',
      },
      questions: _getQuestions(),
    );
  }

  static List<QuestionModel> _getQuestions() {
    // Likert scale answers (1-5)
    final answers = [
      AnswerModel(
        id: 'a1',
        text: {'ru': 'Совсем не согласен(на)', 'en': 'Strongly Disagree'},
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {'ru': 'Скорее не согласен(на)', 'en': 'Disagree'},
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {'ru': 'Нейтрально', 'en': 'Neutral'},
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {'ru': 'Скорее согласен(на)', 'en': 'Agree'},
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {'ru': 'Полностью согласен(на)', 'en': 'Strongly Agree'},
        score: 5,
      ),
    ];

    return [
      // ============================================================
      // A. EXTRAVERSION (E) / INTROVERSION (I) - Questions 1-20
      // ============================================================

      // E questions
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Мне комфортно быть в центре внимания',
          'en': 'I feel comfortable being the center of attention',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'После общения с людьми я чувствую прилив энергии',
          'en': 'After socializing with people, I feel energized',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я часто думаю вслух',
          'en': 'I often think out loud',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),

      // I questions
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я предпочитаю проводить время в одиночестве',
          'en': 'I prefer spending time alone',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Мне нужно уединение, чтобы восстановиться',
          'en': 'I need solitude to recharge',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'В новых компаниях я чувствую скованность',
          'en': 'I feel constrained in new social settings',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),

      // E questions
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я получаю удовольствие от общения с незнакомцами',
          'en': 'I enjoy talking to strangers',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я говорю, чтобы разобраться в мысли',
          'en': 'I speak to figure out my thoughts',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),

      // I questions
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я тщательно обдумываю слова, прежде чем сказать',
          'en': 'I carefully think through my words before speaking',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Мне сложно начинать разговор первым',
          'en': 'I find it difficult to start conversations first',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),

      // E questions
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я чувствую себя живым, когда вокруг движение и люди',
          'en': 'I feel alive when there\'s activity and people around',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),

      // I questions
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Мне комфортнее слушать, чем говорить',
          'en': 'I\'m more comfortable listening than speaking',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),

      // E questions
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я люблю, когда день наполнен встречами',
          'en': 'I love when my day is filled with meetings',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),

      // I questions
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я предпочитаю небольшие, тёплые компании',
          'en': 'I prefer small, intimate gatherings',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),

      // E questions
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я быстро завожу знакомства',
          'en': 'I make new acquaintances easily',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),

      // I questions
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Мне легче писать, чем говорить',
          'en': 'I find it easier to write than to speak',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),

      // E questions
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я часто ищу новых людей и впечатлений',
          'en': 'I often seek new people and experiences',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),

      // I questions
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я чувствую усталость после вечеринок',
          'en': 'I feel tired after parties',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),

      // E questions
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я активно делюсь идеями в группе',
          'en': 'I actively share ideas in groups',
        },
        answers: answers,
        bipolarPole: 'E',
        bipolarDimension: 'mbti_ei',
        targetScale: 'extraversion',
      ),

      // I questions
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я люблю долгие разговоры один на один',
          'en': 'I love long one-on-one conversations',
        },
        answers: answers,
        bipolarPole: 'I',
        bipolarDimension: 'mbti_ei',
        targetScale: 'introversion',
      ),

      // ============================================================
      // B. SENSING (S) / INTUITION (N) - Questions 21-40
      // ============================================================

      // S questions
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я предпочитаю факты и конкретику',
          'en': 'I prefer facts and specifics',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Мне интереснее реальные примеры, чем теории',
          'en': 'I find real examples more interesting than theories',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я обращаю внимание на детали',
          'en': 'I pay attention to details',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я больше доверяю опыту, чем догадкам',
          'en': 'I trust experience more than hunches',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я люблю пошаговые инструкции',
          'en': 'I like step-by-step instructions',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),

      // N questions
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Мне сложно сосредоточиться на мелочах',
          'en': 'I find it hard to focus on small details',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я часто думаю о будущем и возможностях',
          'en': 'I often think about the future and possibilities',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я легко вижу скрытые связи между вещами',
          'en': 'I easily see hidden connections between things',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я люблю фантазировать о том, «что если»',
          'en': 'I love imagining "what if" scenarios',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),

      // S questions
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Мне важны конкретные результаты, а не идеи',
          'en': 'Concrete results matter more to me than ideas',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я предпочитаю работать с фактами, а не с гипотезами',
          'en': 'I prefer working with facts rather than hypotheses',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),

      // N questions
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я замечаю символику и подтексты',
          'en': 'I notice symbolism and subtexts',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я доверяю интуиции в принятии решений',
          'en': 'I trust my intuition when making decisions',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),

      // S questions
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я лучше запоминаю ощущения, чем слова',
          'en': 'I remember sensations better than words',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я люблю анализировать прошлый опыт',
          'en': 'I like analyzing past experiences',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),

      // N questions
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я часто мыслю абстрактно',
          'en': 'I often think abstractly',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я чувствую вдохновение от новых идей',
          'en': 'I feel inspired by new ideas',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),

      // S questions
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я не люблю неопределённость',
          'en': 'I dislike ambiguity',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),

      // N questions
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я думаю образами и ассоциациями',
          'en': 'I think in images and associations',
        },
        answers: answers,
        bipolarPole: 'N',
        bipolarDimension: 'mbti_sn',
        targetScale: 'intuition',
      ),

      // S questions
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Я предпочитаю «теперь и здесь», а не «что будет потом»',
          'en': 'I prefer "here and now" rather than "what comes next"',
        },
        answers: answers,
        bipolarPole: 'S',
        bipolarDimension: 'mbti_sn',
        targetScale: 'sensing',
      ),

      // ============================================================
      // C. THINKING (T) / FEELING (F) - Questions 41-60
      // ============================================================

      // T questions
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я принимаю решения на основе логики',
          'en': 'I make decisions based on logic',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Мне важно, чтобы решение было справедливым, а не просто приятным',
          'en': 'It\'s important to me that a decision is fair, not just pleasant',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я стараюсь быть объективным(ой)',
          'en': 'I try to be objective',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // F questions
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Я избегаю ссор, чтобы никого не обидеть',
          'en': 'I avoid arguments to not hurt anyone',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Мне важно, что чувствуют другие',
          'en': 'What others feel matters to me',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я часто поступаю сердцем, а не умом',
          'en': 'I often act with my heart rather than my head',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),

      // T questions
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Я анализирую аргументы перед принятием решения',
          'en': 'I analyze arguments before making a decision',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // F questions
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Мне трудно спорить с близкими',
          'en': 'I find it hard to argue with loved ones',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),

      // T questions
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Я воспринимаю критику спокойно',
          'en': 'I take criticism calmly',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // F questions
      QuestionModel(
        id: 'q50',
        text: {
          'ru': 'Я остро реагирую на эмоции других',
          'en': 'I react strongly to others\' emotions',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),

      // T questions
      QuestionModel(
        id: 'q51',
        text: {
          'ru': 'Я люблю объективные факты',
          'en': 'I love objective facts',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // F questions
      QuestionModel(
        id: 'q52',
        text: {
          'ru': 'Я часто ставлю чувства выше логики',
          'en': 'I often put feelings above logic',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),

      // T questions
      QuestionModel(
        id: 'q53',
        text: {
          'ru': 'Я говорю прямо, даже если это неприятно',
          'en': 'I speak directly, even if it\'s unpleasant',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // F questions
      QuestionModel(
        id: 'q54',
        text: {
          'ru': 'Я предпочитаю поддерживать, а не критиковать',
          'en': 'I prefer to support rather than criticize',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),

      // T questions
      QuestionModel(
        id: 'q55',
        text: {
          'ru': 'Я считаю, что истина важнее комфорта',
          'en': 'I believe truth is more important than comfort',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // F questions
      QuestionModel(
        id: 'q56',
        text: {
          'ru': 'Я принимаю решения, чтобы сохранить гармонию',
          'en': 'I make decisions to maintain harmony',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),

      // T questions
      QuestionModel(
        id: 'q57',
        text: {
          'ru': 'Я больше доверяю рациональности',
          'en': 'I trust rationality more',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // F questions
      QuestionModel(
        id: 'q58',
        text: {
          'ru': 'Мне трудно оставаться хладнокровным(ой) при ссоре',
          'en': 'I find it hard to stay calm during arguments',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),
      QuestionModel(
        id: 'q59',
        text: {
          'ru': 'Я считаю эмоции полезным источником информации',
          'en': 'I consider emotions a useful source of information',
        },
        answers: answers,
        bipolarPole: 'F',
        bipolarDimension: 'mbti_tf',
        targetScale: 'feeling',
      ),

      // T questions
      QuestionModel(
        id: 'q60',
        text: {
          'ru': 'Я верю, что честность — лучше, чем дипломатия',
          'en': 'I believe honesty is better than diplomacy',
        },
        answers: answers,
        bipolarPole: 'T',
        bipolarDimension: 'mbti_tf',
        targetScale: 'thinking',
      ),

      // ============================================================
      // D. JUDGING (J) / PERCEIVING (P) - Questions 61-80
      // ============================================================

      // J questions
      QuestionModel(
        id: 'q61',
        text: {
          'ru': 'Я предпочитаю чёткий план действий',
          'en': 'I prefer a clear action plan',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),
      QuestionModel(
        id: 'q62',
        text: {
          'ru': 'Я чувствую тревогу, если всё неопределённо',
          'en': 'I feel anxious when everything is uncertain',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),
      QuestionModel(
        id: 'q63',
        text: {
          'ru': 'Я люблю завершать начатое',
          'en': 'I like to finish what I start',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),
      QuestionModel(
        id: 'q64',
        text: {
          'ru': 'Мне комфортно, когда есть расписание',
          'en': 'I feel comfortable when there\'s a schedule',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),

      // P questions
      QuestionModel(
        id: 'q65',
        text: {
          'ru': 'Я люблю импровизировать и менять планы',
          'en': 'I love improvising and changing plans',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),
      QuestionModel(
        id: 'q66',
        text: {
          'ru': 'Я часто откладываю решения до последнего',
          'en': 'I often postpone decisions until the last moment',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),
      QuestionModel(
        id: 'q67',
        text: {
          'ru': 'Я гибко реагирую на изменения',
          'en': 'I respond flexibly to changes',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),
      QuestionModel(
        id: 'q68',
        text: {
          'ru': 'Мне нравится, когда день складывается спонтанно',
          'en': 'I like when the day unfolds spontaneously',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),

      // J questions
      QuestionModel(
        id: 'q69',
        text: {
          'ru': 'Я предпочитаю заранее продумать детали',
          'en': 'I prefer to think through details in advance',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),

      // P questions
      QuestionModel(
        id: 'q70',
        text: {
          'ru': 'Я не люблю ограничивающие правила',
          'en': 'I don\'t like restrictive rules',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),

      // J questions
      QuestionModel(
        id: 'q71',
        text: {
          'ru': 'Я чувствую удовлетворение, когда всё под контролем',
          'en': 'I feel satisfied when everything is under control',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),

      // P questions
      QuestionModel(
        id: 'q72',
        text: {
          'ru': 'Мне скучно следовать плану',
          'en': 'I get bored following a plan',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),

      // J questions
      QuestionModel(
        id: 'q73',
        text: {
          'ru': 'Я предпочитаю порядок хаосу',
          'en': 'I prefer order over chaos',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),

      // P questions
      QuestionModel(
        id: 'q74',
        text: {
          'ru': 'Я часто берусь за несколько дел без структуры',
          'en': 'I often take on several tasks without structure',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),

      // J questions
      QuestionModel(
        id: 'q75',
        text: {
          'ru': 'Я ценю пунктуальность и порядок',
          'en': 'I value punctuality and order',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),

      // P questions
      QuestionModel(
        id: 'q76',
        text: {
          'ru': 'Я легко переключаюсь между задачами',
          'en': 'I easily switch between tasks',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),

      // J questions
      QuestionModel(
        id: 'q77',
        text: {
          'ru': 'Я люблю планировать отпуск заранее',
          'en': 'I like to plan vacations in advance',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),

      // P questions
      QuestionModel(
        id: 'q78',
        text: {
          'ru': 'Я чувствую себя живым в неопределённости',
          'en': 'I feel alive in uncertainty',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),

      // J questions
      QuestionModel(
        id: 'q79',
        text: {
          'ru': 'Я придерживаюсь правил',
          'en': 'I stick to rules',
        },
        answers: answers,
        bipolarPole: 'J',
        bipolarDimension: 'mbti_jp',
        targetScale: 'judging',
      ),

      // P questions
      QuestionModel(
        id: 'q80',
        text: {
          'ru': 'Я предпочитаю действовать по ситуации',
          'en': 'I prefer to act according to the situation',
        },
        answers: answers,
        bipolarPole: 'P',
        bipolarDimension: 'mbti_jp',
        targetScale: 'perceiving',
      ),
    ];
  }

  /// Get personality type descriptions
  /// Returns detailed description for each of 16 types
  static Map<String, Map<String, String>> getTypeDescriptions() {
    return {
      'ISTJ': {
        'ru': '''**Администратор** — Ответственный, надёжный, ценит порядок и стабильность.

**Сильные стороны:**
• Высокая ответственность и надёжность
• Систематический и организованный подход
• Отличная память на детали и факты
• Честность и следование принципам
• Практичность в решении задач

**Зоны развития:**
• Гибкость в изменяющихся условиях
• Открытость новым идеям и подходам
• Выражение эмоций и эмпатия
• Умение видеть общую картину

**Карьера:** Бухгалтерия, аудит, администрирование, военная служба, юриспруденция, медицина.''',
        'en': '''**Administrator** — Responsible, reliable, values order and stability.

**Strengths:**
• High responsibility and reliability
• Systematic and organized approach
• Excellent memory for details and facts
• Honesty and adherence to principles
• Practicality in problem-solving

**Development Areas:**
• Flexibility in changing conditions
• Openness to new ideas and approaches
• Expressing emotions and empathy
• Seeing the big picture

**Career:** Accounting, auditing, administration, military service, law, medicine.''',
      },

      'ISFJ': {
        'ru': '''**Защитник** — Заботливый, надёжный, стремится помогать другим.

**Сильные стороны:**
• Чуткость к нуждам окружающих
• Преданность и верность
• Практическая помощь людям
• Внимание к деталям в отношениях
• Стабильность и надёжность

**Зоны развития:**
• Забота о собственных потребностях
• Установление границ
• Принятие перемен
• Выход из зоны комфорта

**Карьера:** Медицина, преподавание, социальная работа, администрирование, HR.''',
        'en': '''**Defender** — Caring, reliable, seeks to help others.

**Strengths:**
• Sensitivity to others' needs
• Loyalty and devotion
• Practical help to people
• Attention to details in relationships
• Stability and reliability

**Development Areas:**
• Caring for own needs
• Setting boundaries
• Accepting change
• Stepping out of comfort zone

**Career:** Medicine, teaching, social work, administration, HR.''',
      },

      'INFJ': {
        'ru': '''**Советник** — Интуитивный, эмпатичный, ищет смысл и гармонию.

**Сильные стороны:**
• Глубокое понимание людей
• Стремление к гармонии и смыслу
• Творческий подход к решению проблем
• Сильная интуиция и предвидение
• Идеализм и стремление помогать

**Зоны развития:**
• Практичность в реализации идей
• Принятие несовершенства мира
• Забота о себе, а не только о других
• Гибкость в методах достижения целей

**Карьера:** Психология, консультирование, писательство, образование, некоммерческий сектор.''',
        'en': '''**Counselor** — Intuitive, empathetic, seeks meaning and harmony.

**Strengths:**
• Deep understanding of people
• Pursuit of harmony and meaning
• Creative approach to problem-solving
• Strong intuition and foresight
• Idealism and desire to help

**Development Areas:**
• Practicality in implementing ideas
• Accepting world's imperfections
• Self-care, not just caring for others
• Flexibility in achieving goals

**Career:** Psychology, counseling, writing, education, non-profit sector.''',
      },

      'INTJ': {
        'ru': '''**Архитектор** — Стратег, системный мыслитель, планирует наперёд.

**Сильные стороны:**
• Стратегическое мышление
• Независимость и самодостаточность
• Высокий интеллект и аналитика
• Долгосрочное планирование
• Уверенность в своих идеях

**Зоны развития:**
• Эмпатия и понимание эмоций
• Гибкость в планах
• Терпение к людям и процессам
• Выражение признательности

**Карьера:** Наука, IT, стратегический менеджмент, инженерия, архитектура.''',
        'en': '''**Architect** — Strategist, systematic thinker, plans ahead.

**Strengths:**
• Strategic thinking
• Independence and self-sufficiency
• High intelligence and analytics
• Long-term planning
• Confidence in own ideas

**Development Areas:**
• Empathy and understanding emotions
• Flexibility in plans
• Patience with people and processes
• Expressing appreciation

**Career:** Science, IT, strategic management, engineering, architecture.''',
      },

      'ISTP': {
        'ru': '''**Мастер** — Практичный, наблюдательный, быстро решает задачи.

**Сильные стороны:**
• Практические навыки и умения
• Быстрая реакция в кризисах
• Логический анализ проблем
• Независимость и самостоятельность
• Способность работать с инструментами

**Зоны развития:**
• Долгосрочное планирование
• Выражение эмоций
• Учёт чувств других людей
• Следование правилам и процедурам

**Карьера:** Инженерия, механика, IT, спорт, экстремальные профессии, ремёсла.''',
        'en': '''**Craftsperson** — Practical, observant, solves problems quickly.

**Strengths:**
• Practical skills and abilities
• Quick response in crises
• Logical problem analysis
• Independence and self-reliance
• Ability to work with tools

**Development Areas:**
• Long-term planning
• Expressing emotions
• Considering others' feelings
• Following rules and procedures

**Career:** Engineering, mechanics, IT, sports, extreme professions, crafts.''',
      },

      'ISFP': {
        'ru': '''**Художник** — Чуткий, эстетичный, живёт в моменте.

**Сильные стороны:**
• Художественное восприятие мира
• Эмпатия и чуткость
• Гибкость и адаптивность
• Присутствие в моменте
• Гармония и эстетика

**Зоны развития:**
• Долгосрочное планирование
• Отстаивание своих интересов
• Принятие решений
• Структурированность

**Карьера:** Искусство, дизайн, музыка, работа с животными, медицина, психология.''',
        'en': '''**Artist** — Sensitive, aesthetic, lives in the moment.

**Strengths:**
• Artistic perception of the world
• Empathy and sensitivity
• Flexibility and adaptability
• Living in the moment
• Harmony and aesthetics

**Development Areas:**
• Long-term planning
• Standing up for own interests
• Decision-making
• Being structured

**Career:** Arts, design, music, working with animals, medicine, psychology.''',
      },

      'INFP': {
        'ru': '''**Мечтатель** — Идеалист, ориентирован на внутренние ценности.

**Сильные стороны:**
• Глубокие внутренние ценности
• Креативность и воображение
• Эмпатия и понимание
• Стремление к аутентичности
• Идеализм и вдохновение

**Зоны развития:**
• Практическая реализация идей
• Принятие критики
• Структурированность
• Баланс между идеалом и реальностью

**Карьера:** Писательство, психология, искусство, образование, некоммерческий сектор.''',
        'en': '''**Dreamer** — Idealist, oriented toward inner values.

**Strengths:**
• Deep inner values
• Creativity and imagination
• Empathy and understanding
• Pursuit of authenticity
• Idealism and inspiration

**Development Areas:**
• Practical implementation of ideas
• Accepting criticism
• Being structured
• Balance between ideal and reality

**Career:** Writing, psychology, arts, education, non-profit sector.''',
      },

      'INTP': {
        'ru': '''**Аналитик** — Логичный, любознательный, любит концепции.

**Сильные стороны:**
• Аналитическое мышление
• Любовь к теоретическим концепциям
• Креативность в решении задач
• Независимость мышления
• Стремление к знаниям

**Зоны развития:**
• Практическое применение идей
• Эмоциональный интеллект
• Завершение проектов
• Социальные навыки

**Карьера:** Наука, философия, IT, математика, исследования, инженерия.''',
        'en': '''**Analyst** — Logical, curious, loves concepts.

**Strengths:**
• Analytical thinking
• Love for theoretical concepts
• Creativity in problem-solving
• Independent thinking
• Quest for knowledge

**Development Areas:**
• Practical application of ideas
• Emotional intelligence
• Completing projects
• Social skills

**Career:** Science, philosophy, IT, mathematics, research, engineering.''',
      },

      'ESTP': {
        'ru': '''**Предприниматель** — Действует быстро, любит вызовы и активность.

**Сильные стороны:**
• Энергичность и активность
• Быстрая адаптация к ситуации
• Практичность и результативность
• Харизма и общительность
• Умение рисковать

**Зоны развития:**
• Долгосрочное планирование
• Учёт последствий действий
• Эмпатия и тактичность
• Терпение и усидчивость

**Карьера:** Продажи, маркетинг, спорт, предпринимательство, экстренные службы.''',
        'en': '''**Entrepreneur** — Acts quickly, loves challenges and activity.

**Strengths:**
• Energy and activity
• Quick adaptation to situations
• Practicality and effectiveness
• Charisma and sociability
• Ability to take risks

**Development Areas:**
• Long-term planning
• Considering consequences of actions
• Empathy and tact
• Patience and perseverance

**Career:** Sales, marketing, sports, entrepreneurship, emergency services.''',
      },

      'ESFP': {
        'ru': '''**Исполнитель** — Весёлый, общительный, живёт эмоциями.

**Сильные стороны:**
• Энтузиазм и оптимизм
• Спонтанность и живость
• Практическая помощь людям
• Умение радоваться жизни
• Харизма и обаяние

**Зоны развития:**
• Планирование будущего
• Глубина в отношениях
• Финансовая дисциплина
• Сосредоточенность на целях

**Карьера:** Развлечения, туризм, продажи, обслуживание, event-менеджмент.''',
        'en': '''**Entertainer** — Fun-loving, sociable, lives by emotions.

**Strengths:**
• Enthusiasm and optimism
• Spontaneity and liveliness
• Practical help to people
• Ability to enjoy life
• Charisma and charm

**Development Areas:**
• Planning for the future
• Depth in relationships
• Financial discipline
• Focus on goals

**Career:** Entertainment, tourism, sales, service, event management.''',
      },

      'ENFP': {
        'ru': '''**Энтузиаст** — Творческий вдохновитель, ищет смысл и свободу.

**Сильные стороны:**
• Энтузиазм и вдохновение
• Креативность и воображение
• Эмпатия и понимание людей
• Способность видеть возможности
• Харизма и коммуникабельность

**Зоны развития:**
• Завершение начатого
• Фокусировка на одной цели
• Практичность и структура
• Управление временем

**Карьера:** Маркетинг, PR, психология, писательство, образование, актёрство.''',
        'en': '''**Enthusiast** — Creative inspirer, seeks meaning and freedom.

**Strengths:**
• Enthusiasm and inspiration
• Creativity and imagination
• Empathy and understanding people
• Ability to see possibilities
• Charisma and sociability

**Development Areas:**
• Finishing what's started
• Focusing on one goal
• Practicality and structure
• Time management

**Career:** Marketing, PR, psychology, writing, education, acting.''',
      },

      'ENTP': {
        'ru': '''**Изобретатель** — Креативный, аргументированный, любит споры и идеи.

**Сильные стороны:**
• Креативность и инновации
• Острый ум и аргументация
• Энтузиазм к новым идеям
• Адаптивность и гибкость
• Харизма и убедительность

**Зоны развития:**
• Практическая реализация
• Тактичность в дискуссиях
• Завершение проектов
• Рутинные задачи

**Карьера:** Инновации, стартапы, консалтинг, маркетинг, юриспруденция, изобретательство.''',
        'en': '''**Inventor** — Creative, argumentative, loves debates and ideas.

**Strengths:**
• Creativity and innovation
• Sharp mind and argumentation
• Enthusiasm for new ideas
• Adaptability and flexibility
• Charisma and persuasiveness

**Development Areas:**
• Practical implementation
• Tact in discussions
• Completing projects
• Routine tasks

**Career:** Innovation, startups, consulting, marketing, law, inventing.''',
      },

      'ESTJ': {
        'ru': '''**Организатор** — Практичный лидер, ориентирован на результат.

**Сильные стороны:**
• Организованность и эффективность
• Лидерские качества
• Практичность и прагматизм
• Ответственность и надёжность
• Умение управлять людьми

**Зоны развития:**
• Гибкость в подходах
• Эмпатия и чуткость
• Открытость новым идеям
• Терпимость к различиям

**Карьера:** Менеджмент, администрирование, военная служба, финансы, юриспруденция.''',
        'en': '''**Executive** — Practical leader, results-oriented.

**Strengths:**
• Organization and efficiency
• Leadership qualities
• Practicality and pragmatism
• Responsibility and reliability
• People management skills

**Development Areas:**
• Flexibility in approaches
• Empathy and sensitivity
• Openness to new ideas
• Tolerance of differences

**Career:** Management, administration, military service, finance, law.''',
      },

      'ESFJ': {
        'ru': '''**Наставник** — Тёплый, отзывчивый, создаёт комфорт и порядок.

**Сильные стороны:**
• Забота о других людях
• Организованность и структура
• Гармония в отношениях
• Практическая помощь
• Лояльность и преданность

**Зоны развития:**
• Забота о собственных нуждах
• Принятие критики
• Гибкость в правилах
• Независимость от мнения других

**Карьера:** Образование, медицина, HR, организация мероприятий, социальная работа.''',
        'en': '''**Consul** — Warm, responsive, creates comfort and order.

**Strengths:**
• Caring for others
• Organization and structure
• Harmony in relationships
• Practical help
• Loyalty and devotion

**Development Areas:**
• Caring for own needs
• Accepting criticism
• Flexibility with rules
• Independence from others' opinions

**Career:** Education, medicine, HR, event organization, social work.''',
      },

      'ENFJ': {
        'ru': '''**Гуманист** — Эмпатичный лидер, вдохновляет и объединяет.

**Сильные стороны:**
• Харизма и вдохновляющее лидерство
• Глубокая эмпатия
• Умение мотивировать других
• Организаторские способности
• Идеализм и стремление к гармонии

**Зоны развития:**
• Забота о собственных потребностях
• Принятие конфликтов
• Объективность в оценках
• Установление границ

**Карьера:** Образование, HR, психология, политика, общественная деятельность, менеджмент.''',
        'en': '''**Protagonist** — Empathetic leader, inspires and unites.

**Strengths:**
• Charisma and inspiring leadership
• Deep empathy
• Ability to motivate others
• Organizational abilities
• Idealism and pursuit of harmony

**Development Areas:**
• Caring for own needs
• Accepting conflicts
• Objectivity in assessments
• Setting boundaries

**Career:** Education, HR, psychology, politics, public service, management.''',
      },

      'ENTJ': {
        'ru': '''**Командир** — Решительный стратег, ведёт за собой.

**Сильные стороны:**
• Стратегическое мышление
• Природное лидерство
• Решительность и уверенность
• Эффективность и результативность
• Умение видеть долгосрочную перспективу

**Зоны развития:**
• Терпение к людям
• Эмпатия и чуткость
• Гибкость в методах
• Признание эмоций

**Карьера:** Топ-менеджмент, предпринимательство, консалтинг, юриспруденция, политика.''',
        'en': '''**Commander** — Decisive strategist, leads others.

**Strengths:**
• Strategic thinking
• Natural leadership
• Decisiveness and confidence
• Efficiency and effectiveness
• Ability to see long-term perspective

**Development Areas:**
• Patience with people
• Empathy and sensitivity
• Flexibility in methods
• Acknowledging emotions

**Career:** Top management, entrepreneurship, consulting, law, politics.''',
      },
    };
  }
}
