import '../models/test_model.dart';

class FisherTemperamentData {
  static TestModel getFisherTemperamentTest() {
    // Варианты ответов (одинаковые для всех вопросов)
    final answers = [
      AnswerModel(
        id: 'strongly_disagree',
        text: {
          'ru': 'Полностью не согласен',
          'en': 'Strongly Disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'disagree',
        text: {
          'ru': 'Не согласен',
          'en': 'Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'agree',
        text: {
          'ru': 'Согласен',
          'en': 'Agree',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'strongly_agree',
        text: {
          'ru': 'Полностью согласен',
          'en': 'Strongly Agree',
        },
        score: 3,
      ),
    ];

    return TestModel(
      id: 'fisher_temperament',
      title: {
        'ru': 'Опросник темперамента Фишер (FTI)',
        'en': 'Fisher Temperament Inventory (FTI)',
      },
      description: {
        'ru': 'Опросник из 56 вопросов, который определяет 4 основных измерения темперамента, связанных с нейрохимическими системами мозга: дофамин, серотонин, тестостерон и эстроген/окситоцин.',
        'en': 'A 56-item questionnaire that defines 4 temperament dimensions associated with brain neurochemical systems: dopamine, serotonin, testosterone, and estrogen/oxytocin.',
      },
      category: {
        'ru': 'Темперамент',
        'en': 'Temperament',
      },
      categoryId: 'temperament',
      disclaimer: {
        'ru': '''**Опросник темперамента Фишер**

Интерактивная версия опросника темперамента Фишер.

**Введение**
FTI - это мера личности, основанная на идее, что поведение находится под влиянием доминирования нейротрансмиттеров в мозге. FTI идентифицирует четыре химические подсистемы мозга (дофамин, серотонин, тестостерон, эстроген) и измеряет четыре шкалы поведения, предположительно производимые этими системами, и общий тип темперамента.

**Процедура**
Тест состоит из утверждений о вас, которые вы должны оценить по четырехбалльной шкале согласия.

**Участие**
Этот тест предоставляется только для образовательных целей. Он не должен использоваться как психологический совет и не дает никаких гарантий точности или пригодности для конкретной цели. Ваши ответы могут быть записаны и анонимно использованы для исследований.''',
        'en': '''**Fisher Temperament Inventory**

This is an interactive version of the Fisher Temperament Inventory.

**Introduction**
The FTI is a measure of personality based on the idea that behavior is influenced by the dominance of neurotransmitters in the brain. The FTI identifies four chemical subsystems of the brain (dopamine, serotonin, testosterone, estrogen) and measures four scales of behavior believed to be produced by those systems and an overall temperament type.

**Procedure**
The test consists of statements about you that you must rate on a four point scale of how much you agree with each.

**Participation**
This test is provided for educational use only. It should not be used as psychological advice of any kind and comes without any guarantee of accuracy or fitness for any particular purpose. Also, your responses may be recorded and anonymously used for research or otherwise distributed.''',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: ['curious_energetic', 'cautious_compliant', 'analytical_tough', 'prosocial_empathetic'],
      questions: [
        // Curious/Energetic (Любопытный/Энергичный) - вопросы 1-14
        QuestionModel(
          id: 'q1',
          text: {
            'ru': 'Непредсказуемые ситуации меня воодушевляют.',
            'en': 'I find unpredictable situations exhilarating.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q2',
          text: {
            'ru': 'Я делаю вещи спонтанно, под влиянием момента.',
            'en': 'I do things on the spur of the moment.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q3',
          text: {
            'ru': 'Мне становится скучно, когда приходится делать одни и те же знакомые вещи.',
            'en': 'I get bored when I have to do the same familiar things.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q4',
          text: {
            'ru': 'У меня очень широкий круг интересов.',
            'en': 'I have a very wide range of interests.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q5',
          text: {
            'ru': 'Я более оптимистичен, чем большинство людей.',
            'en': 'I am more optimistic than most people.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q6',
          text: {
            'ru': 'Я более креативен, чем большинство людей.',
            'en': 'I am more creative than most people.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q7',
          text: {
            'ru': 'Я всегда ищу новый опыт.',
            'en': 'I am always looking for new experiences.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q8',
          text: {
            'ru': 'Я всегда делаю что-то новое.',
            'en': 'I am always doing new things.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q9',
          text: {
            'ru': 'Я более энтузиаст, чем большинство людей.',
            'en': 'I am more enthusiastic than most people.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q10',
          text: {
            'ru': 'Я готов рисковать, чтобы делать то, что хочу.',
            'en': 'I am willing to take risks to do what I want to do.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q11',
          text: {
            'ru': 'Я начинаю беспокоиться, если приходится долго сидеть дома.',
            'en': 'I get restless if I have to stay home for any length of time.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q12',
          text: {
            'ru': 'Мои друзья сказали бы, что я очень любопытный.',
            'en': 'My friends would say I am very curious.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q13',
          text: {
            'ru': 'У меня больше энергии, чем у большинства людей.',
            'en': 'I have more energy than most people.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q14',
          text: {
            'ru': 'В свободное время я люблю свободно делать то, что кажется интересным.',
            'en': 'On my time off, I like to be free to do whatever looks fun.',
          },
          answers: answers,
          factorId: 'curious_energetic',
          isReversed: false,
        ),

        // Cautious/Social Norm Compliant (Осторожный/Следующий нормам) - вопросы 15-28
        QuestionModel(
          id: 'q15',
          text: {
            'ru': 'Я думаю, что стабильный распорядок делает жизнь упорядоченной и расслабленной.',
            'en': 'I think consistent routines keep life orderly and relaxing.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q16',
          text: {
            'ru': 'Я рассматриваю (и пересматриваю) каждый вариант тщательно, прежде чем составить план.',
            'en': 'I consider (and reconsider) every option thoroughly before making a plan.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q17',
          text: {
            'ru': 'Люди должны вести себя в соответствии с установленными стандартами правильного поведения.',
            'en': 'People should behave according to established standards of proper conduct.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q18',
          text: {
            'ru': 'Мне нравится планировать заранее.',
            'en': 'I enjoy planning way ahead.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q19',
          text: {
            'ru': 'В целом, я думаю, что важно следовать правилам.',
            'en': 'In general, I think it is important to follow rules.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q20',
          text: {
            'ru': 'Забота о моих вещах - высокий приоритет для меня.',
            'en': 'Taking care of my possessions is a high priority for me.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q21',
          text: {
            'ru': 'Мои друзья и семья сказали бы, что у меня традиционные ценности.',
            'en': 'My friends and family would say I have traditional values.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q22',
          text: {
            'ru': 'Я склонен быть тщательным в своих обязанностях.',
            'en': 'I tend to be meticulous in my duties.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q23',
          text: {
            'ru': 'Я склонен быть осторожным, но не боязливым.',
            'en': 'I tend to be cautious, but not fearful.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q24',
          text: {
            'ru': 'Люди должны вести себя морально правильно.',
            'en': 'People should behave in ways that are morally correct.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q25',
          text: {
            'ru': 'Важно уважать авторитет.',
            'en': 'It is important to respect authority.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q26',
          text: {
            'ru': 'Я бы предпочел верных друзей интересным друзьям.',
            'en': 'I would rather have loyal friends than interesting friends.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q27',
          text: {
            'ru': 'Давно установленные обычаи нужно уважать и сохранять.',
            'en': 'Long established customs need to be respected and preserved.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q28',
          text: {
            'ru': 'Мне нравится работать прямым путем к завершению задачи.',
            'en': 'I like to work in a straightforward path toward completing the task.',
          },
          answers: answers,
          factorId: 'cautious_compliant',
          isReversed: false,
        ),

        // Analytical/Tough-minded (Аналитический/Жесткомыслящий) - вопросы 29-42
        QuestionModel(
          id: 'q29',
          text: {
            'ru': 'Я легко понимаю сложные механизмы.',
            'en': 'I understand complex machines easily.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q30',
          text: {
            'ru': 'Мне нравятся конкурентные разговоры.',
            'en': 'I enjoy competitive conversations.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q31',
          text: {
            'ru': 'Меня интригуют правила и закономерности, которые управляют системами.',
            'en': 'I am intrigued by rules and patterns that govern systems.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q32',
          text: {
            'ru': 'Я более аналитичен и логичен, чем большинство людей.',
            'en': 'I am more analytical and logical than most people.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q33',
          text: {
            'ru': 'Я изучаю интеллектуальные темы тщательно и регулярно.',
            'en': 'I pursue intellectual topics thoroughly and regularly.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q34',
          text: {
            'ru': 'Я способен решать проблемы, не позволяя эмоциям мешать.',
            'en': 'I am able to solve problems without letting emotion get in the way.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q35',
          text: {
            'ru': 'Мне нравится разбираться, как всё работает.',
            'en': 'I like to figure out how things work.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q36',
          text: {
            'ru': 'Я жесткомыслящий.',
            'en': 'I am tough-minded.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q37',
          text: {
            'ru': 'Дебаты - хороший способ померяться силами с другими.',
            'en': 'Debating is a good way to match my wits with others.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q38',
          text: {
            'ru': 'У меня нет проблем с выбором, даже когда несколько вариантов кажутся одинаково хорошими.',
            'en': 'I have no trouble making a choice, even when several alternatives seem equally good at first.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q39',
          text: {
            'ru': 'Когда я покупаю новое устройство (камеру, компьютер или автомобиль), я хочу знать все его технические характеристики.',
            'en': 'When I buy a new machine (e.g., camera, computer or car), I want to know all of its technical features.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q40',
          text: {
            'ru': 'Мне нравится избегать нюансов и говорить именно то, что я имею в виду.',
            'en': 'I like to avoid the nuances and say exactly what I mean.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q41',
          text: {
            'ru': 'Я думаю, что важно быть прямым.',
            'en': 'I think it is important to be direct.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q42',
          text: {
            'ru': 'При принятии решения я предпочитаю придерживаться фактов, а не поддаваться чувствам людей.',
            'en': 'When making a decision, I like to stick to the facts rather than be swayed by people\'s feelings.',
          },
          answers: answers,
          factorId: 'analytical_tough',
          isReversed: false,
        ),

        // Prosocial/Empathetic (Просоциальный/Эмпатичный) - вопросы 43-56
        QuestionModel(
          id: 'q43',
          text: {
            'ru': 'Мне нравится узнавать самые глубокие потребности и чувства моих друзей.',
            'en': 'I like to get to know my friends\' deepest needs and feelings.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q44',
          text: {
            'ru': 'Я высоко ценю глубокую эмоциональную близость в отношениях.',
            'en': 'I highly value deep emotional intimacy in my relationships.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q45',
          text: {
            'ru': 'Независимо от того, что логично, я обычно слушаю свое сердце при принятии важных решений.',
            'en': 'Regardless of what is logical, I generally listen to my heart when making important decisions.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q46',
          text: {
            'ru': 'Я часто ловлю себя на том, что витаю в облаках.',
            'en': 'I frequently catch myself daydreaming.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q47',
          text: {
            'ru': 'Я легко могу изменить своё мнение.',
            'en': 'I can change my mind easily.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q48',
          text: {
            'ru': 'После просмотра эмоционального фильма я часто всё ещё чувствую себя тронутым спустя несколько часов.',
            'en': 'After watching an emotional film I often still feel moved by it several hours later.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q49',
          text: {
            'ru': 'Я ярко представляю, как со мной происходят как замечательные, так и ужасные вещи.',
            'en': 'I vividly imagine both wonderful and horrible things happening to me.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q50',
          text: {
            'ru': 'Я очень чувствителен к чувствам и потребностям людей.',
            'en': 'I am very sensitive to people\'s feelings and needs.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q51',
          text: {
            'ru': 'Я часто ловлю себя на том, что теряюсь в своих мыслях в течение дня.',
            'en': 'I often find myself getting lost in my thoughts during the day.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q52',
          text: {
            'ru': 'Я чувствую эмоции глубже, чем большинство людей.',
            'en': 'I feel emotions more deeply than most people.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q53',
          text: {
            'ru': 'У меня яркое воображение.',
            'en': 'I have a vivid imagination.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q54',
          text: {
            'ru': 'Когда я просыпаюсь от яркого сна, мне требуется несколько секунд, чтобы вернуться в реальность.',
            'en': 'When I wake up from a vivid dream, it takes me a few seconds to return to reality.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q55',
          text: {
            'ru': 'При чтении мне нравится, когда писатель отвлекается, чтобы сказать что-то красивое или значимое.',
            'en': 'When reading, I enjoy when the writer takes a sidetrack to say something beautiful or meaningful.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
        QuestionModel(
          id: 'q56',
          text: {
            'ru': 'Я очень эмпатичен.',
            'en': 'I am very empathetic.',
          },
          answers: answers,
          factorId: 'prosocial_empathetic',
          isReversed: false,
        ),
      ],
    );
  }

  // Тайбрейкеры для разрешения ситуаций с одинаковыми баллами
  static List<TiebreakerQuestion> getTiebreakers() {
    return [
      // 1. Curious/Energetic vs Cautious/Norm Compliant
      TiebreakerQuestion(
        id: 'tb1',
        factor1: 'curious_energetic',
        factor2: 'cautious_compliant',
        option1: {
          'ru': 'Я постоянно ищу новые приключения.',
          'en': 'I constantly seek new adventures.',
        },
        option2: {
          'ru': 'Я обычно предпочитаю делать знакомые вещи.',
          'en': 'I generally prefer to do familiar things.',
        },
      ),
      
      // 2. Curious/Energetic vs Analytical/Tough-Minded
      TiebreakerQuestion(
        id: 'tb2',
        factor1: 'curious_energetic',
        factor2: 'analytical_tough',
        option1: {
          'ru': 'Мне интересны разные люди.',
          'en': 'I\'m interested in all kinds of different people.',
        },
        option2: {
          'ru': 'Мне интересны люди, которые разделяют мои глубочайшие интересы.',
          'en': 'I am interested in people who share my deepest interests.',
        },
      ),
      
      // 3. Curious/Energetic vs Prosocial/Empathetic
      TiebreakerQuestion(
        id: 'tb3',
        factor1: 'curious_energetic',
        factor2: 'prosocial_empathetic',
        option1: {
          'ru': 'Я не очень интроспективен; мне нравится смотреть наружу, а не внутрь.',
          'en': 'I\'m not very introspective; I like to look out not in.',
        },
        option2: {
          'ru': 'Я очень интроспективен; мне интересно глубоко понимать других.',
          'en': 'I\'m very introspective; I\'m interested in deeply understanding others.',
        },
      ),
      
      // 4. Cautious/Norm Compliant vs Analytical/Tough-Minded
      TiebreakerQuestion(
        id: 'tb4',
        factor1: 'cautious_compliant',
        factor2: 'analytical_tough',
        option1: {
          'ru': 'Я склонен быть осторожным в работе и мышлении.',
          'en': 'I tend to be cautious in my work and thinking.',
        },
        option2: {
          'ru': 'Я склонен быть смелым в работе и мышлении.',
          'en': 'I tend to be daring in my work and thinking.',
        },
      ),
      
      // 5. Cautious/Norm Compliant vs Prosocial/Empathetic
      TiebreakerQuestion(
        id: 'tb5',
        factor1: 'cautious_compliant',
        factor2: 'prosocial_empathetic',
        option1: {
          'ru': 'Я склонен мыслить конкретно; я доверяю только фактам.',
          'en': 'I tend to think concretely; I only trust the facts.',
        },
        option2: {
          'ru': 'Я склонен быть образным и слушать свою интуицию.',
          'en': 'I tend to be imaginative and listen to my intuition.',
        },
      ),
      
      // 6. Analytical/Tough-Minded vs Prosocial/Empathetic
      TiebreakerQuestion(
        id: 'tb6',
        factor1: 'analytical_tough',
        factor2: 'prosocial_empathetic',
        option1: {
          'ru': 'Я склонен быть жесткомыслящим.',
          'en': 'I tend to be tough minded.',
        },
        option2: {
          'ru': 'Я склонен быть чувствительным.',
          'en': 'I tend to be tender hearted.',
        },
      ),
    ];
  }

  // Получение интерпретации для каждого фактора
  static Map<String, Map<String, String>> getFactorInterpretations() {
    return {
      'curious_energetic': {
        'ru': '''**Любопытный/Энергичный (Система дофамина)**

Вы склонны быть энергичным, любопытным и спонтанным. Вы ищете новизну и приключения, легко идёте на риск и часто действуете импульсивно. Вы креативны, оптимистичны и полны энтузиазма.

**Нейрохимическая основа:** Дофамин и норэпинефрин

**Характерные черты:**
• Высокая энергия и энтузиазм
• Любопытство и жажда новизны
• Креативность и оптимизм
• Спонтанность и готовность к риску
• Широкий круг интересов

**В отношениях:** Вы приносите энергию, веселье и спонтанность. Вы любите разнообразие и новый опыт в паре.''',
        'en': '''**Curious/Energetic (Dopamine System)**

You tend to be energetic, curious, and spontaneous. You seek novelty and adventure, take risks easily, and often act impulsively. You are creative, optimistic, and enthusiastic.

**Neurochemical basis:** Dopamine and norepinephrine

**Characteristic traits:**
• High energy and enthusiasm
• Curiosity and novelty seeking
• Creativity and optimism
• Spontaneity and risk-taking
• Wide range of interests

**In relationships:** You bring energy, fun, and spontaneity. You enjoy variety and new experiences as a couple.''',
      },
      'cautious_compliant': {
        'ru': '''**Осторожный/Следующий нормам (Система серотонина)**

Вы склонны быть осторожным, организованным и последовательным. Вы цените традиции, следуете правилам и предпочитаете знакомые рутины. Вы внимательны к деталям, добросовестны и уважаете авторитет.

**Нейрохимическая основа:** Серотонин

**Характерные черты:**
• Осторожность и предусмотрительность
• Уважение к традициям и правилам
• Организованность и планирование
• Внимательность к деталям
• Стабильность и надёжность

**В отношениях:** Вы приносите стабильность, надёжность и преданность. Вы цените долгосрочные обязательства и семейные ценности.''',
        'en': '''**Cautious/Social Norm Compliant (Serotonin System)**

You tend to be cautious, organized, and consistent. You value traditions, follow rules, and prefer familiar routines. You are detail-oriented, conscientious, and respect authority.

**Neurochemical basis:** Serotonin

**Characteristic traits:**
• Caution and prudence
• Respect for traditions and rules
• Organization and planning
• Attention to detail
• Stability and reliability

**In relationships:** You bring stability, reliability, and loyalty. You value long-term commitment and family values.''',
      },
      'analytical_tough': {
        'ru': '''**Аналитический/Жесткомыслящий (Система тестостерона)**

Вы склонны быть аналитичным, логичным и прямым. Вы любите решать проблемы, понимать, как всё работает, и принимать решения на основе фактов. Вы интеллектуально любопытны и эмоционально независимы.

**Нейрохимическая основа:** Тестостерон

**Характерные черты:**
• Аналитическое и логическое мышление
• Интерес к системам и механизмам
• Прямота и честность
• Эмоциональная независимость
• Конкурентность и решительность

**В отношениях:** Вы приносите ясность, честность и интеллектуальную стимуляцию. Вы цените независимость и прямое общение.''',
        'en': '''**Analytical/Tough-minded (Testosterone System)**

You tend to be analytical, logical, and direct. You enjoy solving problems, understanding how things work, and making fact-based decisions. You are intellectually curious and emotionally independent.

**Neurochemical basis:** Testosterone

**Characteristic traits:**
• Analytical and logical thinking
• Interest in systems and mechanisms
• Directness and honesty
• Emotional independence
• Competitiveness and decisiveness

**In relationships:** You bring clarity, honesty, and intellectual stimulation. You value independence and direct communication.''',
      },
      'prosocial_empathetic': {
        'ru': '''**Просоциальный/Эмпатичный (Система эстрогена/окситоцина)**

Вы склонны быть эмпатичным, заботливым и образным. Вы глубоко чувствуете эмоции, цените эмоциональную близость и принимаете решения сердцем. Вы чувствительны к потребностям других и обладаете богатым воображением.

**Нейрохимическая основа:** Эстроген и окситоцин

**Характерные черты:**
• Высокая эмпатия и чувствительность
• Глубокая эмоциональность
• Богатое воображение
• Интуитивность
• Забота о других

**В отношениях:** Вы приносите глубокую эмоциональную связь, понимание и поддержку. Вы цените близость и эмоциональную интимность.''',
        'en': '''**Prosocial/Empathetic (Estrogen/Oxytocin System)**

You tend to be empathetic, nurturing, and imaginative. You feel emotions deeply, value emotional intimacy, and make heart-based decisions. You are sensitive to others' needs and have a vivid imagination.

**Neurochemical basis:** Estrogen and oxytocin

**Characteristic traits:**
• High empathy and sensitivity
• Deep emotionality
• Rich imagination
• Intuitiveness
• Caring for others

**In relationships:** You bring deep emotional connection, understanding, and support. You value closeness and emotional intimacy.''',
      },
    };
  }

  // Названия факторов
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'curious_energetic': {
        'ru': 'Любопытный/Энергичный',
        'en': 'Curious/Energetic',
      },
      'cautious_compliant': {
        'ru': 'Осторожный/Следующий нормам',
        'en': 'Cautious/Social Norm Compliant',
      },
      'analytical_tough': {
        'ru': 'Аналитический/Жесткомыслящий',
        'en': 'Analytical/Tough-minded',
      },
      'prosocial_empathetic': {
        'ru': 'Просоциальный/Эмпатичный',
        'en': 'Prosocial/Empathetic',
      },
    };
  }
}

// Модель тайбрейкера
class TiebreakerQuestion {
  final String id;
  final String factor1;
  final String factor2;
  final Map<String, String> option1;
  final Map<String, String> option2;

  TiebreakerQuestion({
    required this.id,
    required this.factor1,
    required this.factor2,
    required this.option1,
    required this.option2,
  });
}

