import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определение профиля на основе процентов по факторам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_balanced';

    final curious = percentages['curious_energetic'] ?? 0;
    final cautious = percentages['cautious_compliant'] ?? 0;
    final analytical = percentages['analytical_tough'] ?? 0;
    final prosocial = percentages['prosocial_empathetic'] ?? 0;

    // Находим доминирующий и вторичный типы
    final scores = {
      'curious_energetic': curious,
      'cautious_compliant': cautious,
      'analytical_tough': analytical,
      'prosocial_empathetic': prosocial,
    };

    final sorted = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final dominant = sorted[0];
    final secondary = sorted[1];

    // Если разница между первым и вторым < 10%, это комбо-профиль
    if (dominant.value - secondary.value < 10 && dominant.value > 50) {
      // Explorer + Builder = Adventurous Stabilizer
      if ((dominant.key == 'curious_energetic' && secondary.key == 'cautious_compliant') ||
          (dominant.key == 'cautious_compliant' && secondary.key == 'curious_energetic')) {
        return 'profile_adventurous_stabilizer';
      }
      // Explorer + Director = Visionary Leader
      if ((dominant.key == 'curious_energetic' && secondary.key == 'analytical_tough') ||
          (dominant.key == 'analytical_tough' && secondary.key == 'curious_energetic')) {
        return 'profile_visionary_leader';
      }
      // Explorer + Negotiator = Creative Connector
      if ((dominant.key == 'curious_energetic' && secondary.key == 'prosocial_empathetic') ||
          (dominant.key == 'prosocial_empathetic' && secondary.key == 'curious_energetic')) {
        return 'profile_creative_connector';
      }
      // Builder + Director = Strategic Executor
      if ((dominant.key == 'cautious_compliant' && secondary.key == 'analytical_tough') ||
          (dominant.key == 'analytical_tough' && secondary.key == 'cautious_compliant')) {
        return 'profile_strategic_executor';
      }
      // Builder + Negotiator = Caring Organizer
      if ((dominant.key == 'cautious_compliant' && secondary.key == 'prosocial_empathetic') ||
          (dominant.key == 'prosocial_empathetic' && secondary.key == 'cautious_compliant')) {
        return 'profile_caring_organizer';
      }
      // Director + Negotiator = Empathic Analyst
      if ((dominant.key == 'analytical_tough' && secondary.key == 'prosocial_empathetic') ||
          (dominant.key == 'prosocial_empathetic' && secondary.key == 'analytical_tough')) {
        return 'profile_empathic_analyst';
      }
    }

    // Чистый доминирующий тип
    if (dominant.value > 60) {
      switch (dominant.key) {
        case 'curious_energetic':
          return 'profile_explorer';
        case 'cautious_compliant':
          return 'profile_builder';
        case 'analytical_tough':
          return 'profile_director';
        case 'prosocial_empathetic':
          return 'profile_negotiator';
      }
    }

    return 'profile_balanced';
  }

  /// Получение профиля по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static const Map<String, TestProfile> _profiles = {
    // ===== ОСНОВНЫЕ ТИПЫ =====
    'profile_explorer': TestProfile(
      id: 'profile_explorer',
      name: {
        'ru': 'Исследователь',
        'en': 'Explorer',
      },
      description: {
        'ru': 'Вы — любопытный и энергичный человек, движимый дофамином. Вас влечёт новизна, приключения и творческие идеи. Вы спонтанны, оптимистичны и всегда готовы к новым открытиям.',
        'en': 'You are a curious and energetic person driven by dopamine. You are attracted to novelty, adventure, and creative ideas. You are spontaneous, optimistic, and always ready for new discoveries.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокий уровень любознательности, стремления к новизне и энергичности — ключевые черты Исследователя по системе Хелен Фишер.',
        'en': 'Your answers showed high levels of curiosity, novelty-seeking, and energy — key traits of the Explorer in Helen Fisher\'s system.',
      },
      strengths: {
        'ru': [
          'Креативность и нестандартное мышление',
          'Энергичность и энтузиазм',
          'Открытость новому опыту',
          'Оптимизм и позитивный настрой',
          'Гибкость и адаптивность',
          'Способность вдохновлять других',
        ],
        'en': [
          'Creativity and unconventional thinking',
          'Energy and enthusiasm',
          'Openness to new experiences',
          'Optimism and positive attitude',
          'Flexibility and adaptability',
          'Ability to inspire others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Склонность к импульсивным решениям',
          'Трудности с рутиной и долгосрочными обязательствами',
          'Риск распыления внимания',
          'Нетерпеливость с медлительными людьми',
        ],
        'en': [
          'Tendency toward impulsive decisions',
          'Difficulty with routine and long-term commitments',
          'Risk of scattered attention',
          'Impatience with slower people',
        ],
      },
      recommendations: {
        'ru': [
          'Найдите работу с разнообразием и возможностью творчества',
          'Создавайте структуру для важных проектов, но оставляйте пространство для спонтанности',
          'Практикуйте осознанность для баланса энергии',
          'В отношениях ищите партнёра, который ценит ваш авантюризм',
          'Ведите список идей, чтобы не терять ценные мысли',
        ],
        'en': [
          'Find work with variety and creative opportunities',
          'Create structure for important projects while leaving room for spontaneity',
          'Practice mindfulness to balance your energy',
          'In relationships, seek a partner who values your adventurousness',
          'Keep an idea list so you don\'t lose valuable thoughts',
        ],
      },
      tryToday: {
        'ru': 'Попробуйте что-то совершенно новое сегодня — это зарядит вас энергией и подтвердит вашу природу Исследователя.',
        'en': 'Try something completely new today — it will energize you and affirm your Explorer nature.',
      },
      inspiringConclusion: {
        'ru': 'Ваша любознательность и энергия — дар миру. Продолжайте исследовать, творить и вдохновлять других своим энтузиазмом!',
        'en': 'Your curiosity and energy are a gift to the world. Keep exploring, creating, and inspiring others with your enthusiasm!',
      },
    ),

    'profile_builder': TestProfile(
      id: 'profile_builder',
      name: {
        'ru': 'Строитель',
        'en': 'Builder',
      },
      description: {
        'ru': 'Вы — надёжный и стабильный человек, руководимый серотонином. Вы цените традиции, порядок и социальные нормы. Вы преданы семье, друзьям и сообществу.',
        'en': 'You are a reliable and stable person guided by serotonin. You value traditions, order, and social norms. You are devoted to family, friends, and community.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокий уровень приверженности традициям, стабильности и следования нормам — ключевые черты Строителя.',
        'en': 'Your answers showed high levels of commitment to traditions, stability, and following norms — key traits of the Builder.',
      },
      strengths: {
        'ru': [
          'Надёжность и верность слову',
          'Организованность и планирование',
          'Уважение к традициям и институтам',
          'Лояльность семье и друзьям',
          'Практичность и реалистичность',
          'Способность создавать стабильность',
        ],
        'en': [
          'Reliability and keeping your word',
          'Organization and planning',
          'Respect for traditions and institutions',
          'Loyalty to family and friends',
          'Practicality and realism',
          'Ability to create stability',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сопротивление переменам',
          'Чрезмерная осторожность',
          'Трудности с нарушением правил, даже когда это оправдано',
          'Склонность к ригидности',
        ],
        'en': [
          'Resistance to change',
          'Excessive caution',
          'Difficulty breaking rules even when justified',
          'Tendency toward rigidity',
        ],
      },
      recommendations: {
        'ru': [
          'Находите работу со структурой и чёткими ожиданиями',
          'Позволяйте себе небольшие спонтанные действия',
          'Цените свою способность создавать порядок, но учитесь гибкости',
          'В отношениях ищите партнёра, который разделяет ваши ценности',
          'Создавайте семейные традиции — это питает вашу душу',
        ],
        'en': [
          'Find work with structure and clear expectations',
          'Allow yourself small spontaneous actions',
          'Value your ability to create order but learn flexibility',
          'In relationships, seek a partner who shares your values',
          'Create family traditions — this nourishes your soul',
        ],
      },
      tryToday: {
        'ru': 'Позвоните кому-то из близких, чтобы укрепить связь — это важно для вашего типа.',
        'en': 'Call someone close to strengthen your bond — this is important for your type.',
      },
      inspiringConclusion: {
        'ru': 'Ваша надёжность и верность — фундамент, на котором строятся крепкие отношения и сообщества. Вы — опора для многих!',
        'en': 'Your reliability and loyalty are the foundation on which strong relationships and communities are built. You are a pillar for many!',
      },
    ),

    'profile_director': TestProfile(
      id: 'profile_director',
      name: {
        'ru': 'Директор',
        'en': 'Director',
      },
      description: {
        'ru': 'Вы — аналитический и решительный человек, движимый тестостероном. Вы логичны, прямолинейны и конкурентоспособны. Вы хорошо понимаете системы и стремитесь к достижениям.',
        'en': 'You are an analytical and decisive person driven by testosterone. You are logical, straightforward, and competitive. You understand systems well and strive for achievement.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокий уровень аналитического мышления, прямолинейности и конкурентоспособности — ключевые черты Директора.',
        'en': 'Your answers showed high levels of analytical thinking, directness, and competitiveness — key traits of the Director.',
      },
      strengths: {
        'ru': [
          'Логическое и системное мышление',
          'Решительность и уверенность',
          'Способность принимать трудные решения',
          'Стратегическое видение',
          'Независимость и самодостаточность',
          'Нацеленность на результат',
        ],
        'en': [
          'Logical and systems thinking',
          'Decisiveness and confidence',
          'Ability to make tough decisions',
          'Strategic vision',
          'Independence and self-sufficiency',
          'Results orientation',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Трудности с выражением эмоций',
          'Нетерпимость к неэффективности',
          'Склонность к чрезмерной критичности',
          'Риск пренебрежения эмоциями других',
        ],
        'en': [
          'Difficulty expressing emotions',
          'Intolerance of inefficiency',
          'Tendency toward excessive criticism',
          'Risk of dismissing others\' emotions',
        ],
      },
      recommendations: {
        'ru': [
          'Ищите роли лидера или аналитика',
          'Практикуйте активное слушание и эмпатию',
          'Учитесь выражать признательность вербально',
          'В отношениях выбирайте партнёра, который поможет вам открыться эмоционально',
          'Помните, что не всё можно решить логикой',
        ],
        'en': [
          'Seek leadership or analyst roles',
          'Practice active listening and empathy',
          'Learn to express appreciation verbally',
          'In relationships, choose a partner who helps you open up emotionally',
          'Remember that not everything can be solved with logic',
        ],
      },
      tryToday: {
        'ru': 'Скажите кому-то искренний комплимент без анализа — это хорошая практика эмоционального выражения.',
        'en': 'Give someone a sincere compliment without analysis — this is good practice for emotional expression.',
      },
      inspiringConclusion: {
        'ru': 'Ваша аналитическая сила и решительность способны менять мир. Добавьте к ним тепло человеческих связей, и вы станете непобедимы!',
        'en': 'Your analytical strength and decisiveness can change the world. Add human warmth to them, and you will be unstoppable!',
      },
    ),

    'profile_negotiator': TestProfile(
      id: 'profile_negotiator',
      name: {
        'ru': 'Переговорщик',
        'en': 'Negotiator',
      },
      description: {
        'ru': 'Вы — эмпатичный и интуитивный человек, движимый эстрогеном и окситоцином. Вы глубоко чувствуете эмоции, цените близость и обладаете богатым воображением.',
        'en': 'You are an empathetic and intuitive person driven by estrogen and oxytocin. You feel emotions deeply, value intimacy, and have a rich imagination.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокий уровень эмпатии, эмоциональной глубины и заботы о других — ключевые черты Переговорщика.',
        'en': 'Your answers showed high levels of empathy, emotional depth, and care for others — key traits of the Negotiator.',
      },
      strengths: {
        'ru': [
          'Глубокая эмпатия и понимание других',
          'Интуиция и чувствительность',
          'Способность видеть общую картину',
          'Талант к примирению конфликтов',
          'Богатое воображение и креативность',
          'Умение создавать эмоциональные связи',
        ],
        'en': [
          'Deep empathy and understanding of others',
          'Intuition and sensitivity',
          'Ability to see the big picture',
          'Talent for conflict resolution',
          'Rich imagination and creativity',
          'Ability to create emotional connections',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Склонность к руминации и самокопанию',
          'Трудности с принятием быстрых решений',
          'Чувствительность к критике',
          'Риск потери себя в чужих проблемах',
        ],
        'en': [
          'Tendency toward rumination and overthinking',
          'Difficulty making quick decisions',
          'Sensitivity to criticism',
          'Risk of losing yourself in others\' problems',
        ],
      },
      recommendations: {
        'ru': [
          'Ищите работу, где важны отношения и творчество',
          'Устанавливайте границы, чтобы защитить свою энергию',
          'Практикуйте принятие решений с дедлайнами',
          'В отношениях выбирайте партнёра, который ценит вашу глубину',
          'Направляйте воображение в творческие проекты',
        ],
        'en': [
          'Seek work where relationships and creativity matter',
          'Set boundaries to protect your energy',
          'Practice decision-making with deadlines',
          'In relationships, choose a partner who values your depth',
          'Channel imagination into creative projects',
        ],
      },
      tryToday: {
        'ru': 'Уделите время творческой деятельности — рисованию, письму или музыке. Это питает вашу душу.',
        'en': 'Spend time on creative activity — drawing, writing, or music. This nourishes your soul.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность чувствовать и понимать других — редкий дар. Вы создаёте мосты между людьми и приносите гармонию!',
        'en': 'Your ability to feel and understand others is a rare gift. You build bridges between people and bring harmony!',
      },
    ),

    // ===== КОМБИНИРОВАННЫЕ ПРОФИЛИ =====
    'profile_adventurous_stabilizer': TestProfile(
      id: 'profile_adventurous_stabilizer',
      name: {
        'ru': 'Авантюрный Стабилизатор',
        'en': 'Adventurous Stabilizer',
      },
      description: {
        'ru': 'Вы сочетаете любопытство Исследователя с надёжностью Строителя. Вы любите новое, но умеете создавать стабильность. Вы привносите свежие идеи в традиционные структуры.',
        'en': 'You combine the Explorer\'s curiosity with the Builder\'s reliability. You love novelty but can create stability. You bring fresh ideas to traditional structures.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали баланс между стремлением к новизне и ценностью стабильности — редкое сочетание Исследователя и Строителя.',
        'en': 'Your answers showed a balance between novelty-seeking and valuing stability — a rare combination of Explorer and Builder.',
      },
      strengths: {
        'ru': [
          'Способность внедрять инновации без хаоса',
          'Креативность в рамках структуры',
          'Надёжность с гибкостью',
          'Умение балансировать риск и безопасность',
        ],
        'en': [
          'Ability to innovate without chaos',
          'Creativity within structure',
          'Reliability with flexibility',
          'Ability to balance risk and safety',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Внутренний конфликт между свободой и порядком',
          'Трудности с выбором между новым и проверенным',
        ],
        'en': [
          'Internal conflict between freedom and order',
          'Difficulty choosing between new and proven',
        ],
      },
      recommendations: {
        'ru': [
          'Найдите роль, где можно улучшать существующие системы',
          'Планируйте время для спонтанности',
          'Цените обе стороны своей природы',
        ],
        'en': [
          'Find a role where you can improve existing systems',
          'Schedule time for spontaneity',
          'Value both sides of your nature',
        ],
      },
      tryToday: {
        'ru': 'Внесите одно небольшое улучшение в привычную рутину.',
        'en': 'Make one small improvement to your usual routine.',
      },
      inspiringConclusion: {
        'ru': 'Вы — мост между инновациями и традициями. Это редкий и ценный дар!',
        'en': 'You are a bridge between innovation and tradition. This is a rare and valuable gift!',
      },
    ),

    'profile_visionary_leader': TestProfile(
      id: 'profile_visionary_leader',
      name: {
        'ru': 'Визионер-Лидер',
        'en': 'Visionary Leader',
      },
      description: {
        'ru': 'Вы сочетаете энергию Исследователя с аналитической силой Директора. Вы генерируете идеи и умеете их реализовывать. Вы — стратег с креативностью.',
        'en': 'You combine the Explorer\'s energy with the Director\'s analytical strength. You generate ideas and know how to implement them. You are a strategist with creativity.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сочетание творческой энергии и аналитического мышления — мощная комбинация для лидерства.',
        'en': 'Your answers showed a combination of creative energy and analytical thinking — a powerful combination for leadership.',
      },
      strengths: {
        'ru': [
          'Стратегическое видение с инновациями',
          'Способность вдохновлять и направлять',
          'Решительность в реализации идей',
          'Независимое и оригинальное мышление',
        ],
        'en': [
          'Strategic vision with innovation',
          'Ability to inspire and guide',
          'Decisiveness in implementing ideas',
          'Independent and original thinking',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Нетерпение с медленным прогрессом',
          'Риск пренебрежения деталями и чувствами других',
        ],
        'en': [
          'Impatience with slow progress',
          'Risk of neglecting details and others\' feelings',
        ],
      },
      recommendations: {
        'ru': [
          'Ищите роли, где нужны инновации и лидерство',
          'Окружите себя людьми, которые дополняют вас',
          'Не забывайте о человеческом факторе',
        ],
        'en': [
          'Seek roles requiring innovation and leadership',
          'Surround yourself with people who complement you',
          'Don\'t forget the human factor',
        ],
      },
      tryToday: {
        'ru': 'Поделитесь одной из своих идей с кем-то и попросите обратную связь.',
        'en': 'Share one of your ideas with someone and ask for feedback.',
      },
      inspiringConclusion: {
        'ru': 'Вы способны не только мечтать, но и воплощать мечты в реальность. Это сила, которая меняет мир!',
        'en': 'You can not only dream but also turn dreams into reality. This is a world-changing power!',
      },
    ),

    'profile_creative_connector': TestProfile(
      id: 'profile_creative_connector',
      name: {
        'ru': 'Творческий Коннектор',
        'en': 'Creative Connector',
      },
      description: {
        'ru': 'Вы сочетаете любопытство Исследователя с эмпатией Переговорщика. Вы творческий человек с глубоким пониманием людей. Вы вдохновляете и объединяете.',
        'en': 'You combine the Explorer\'s curiosity with the Negotiator\'s empathy. You are creative with deep understanding of people. You inspire and unite.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сочетание творческой энергии и эмоциональной глубины — идеально для творческих и социальных ролей.',
        'en': 'Your answers showed a combination of creative energy and emotional depth — ideal for creative and social roles.',
      },
      strengths: {
        'ru': [
          'Креативность с эмоциональным интеллектом',
          'Способность вдохновлять через искусство или идеи',
          'Глубокие и интересные отношения',
          'Интуитивное понимание трендов и людей',
        ],
        'en': [
          'Creativity with emotional intelligence',
          'Ability to inspire through art or ideas',
          'Deep and interesting relationships',
          'Intuitive understanding of trends and people',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Эмоциональные американские горки',
          'Трудности с практическими деталями',
        ],
        'en': [
          'Emotional roller coasters',
          'Difficulty with practical details',
        ],
      },
      recommendations: {
        'ru': [
          'Найдите творческую работу с человеческим элементом',
          'Окружите себя людьми, которые заземляют вас',
          'Направляйте эмоции в творчество',
        ],
        'en': [
          'Find creative work with a human element',
          'Surround yourself with people who ground you',
          'Channel emotions into creativity',
        ],
      },
      tryToday: {
        'ru': 'Создайте что-то творческое вместе с другом или близким человеком.',
        'en': 'Create something creative together with a friend or loved one.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность творить и соединять сердца — волшебство, которое делает мир прекраснее!',
        'en': 'Your ability to create and connect hearts is magic that makes the world more beautiful!',
      },
    ),

    'profile_strategic_executor': TestProfile(
      id: 'profile_strategic_executor',
      name: {
        'ru': 'Стратегический Исполнитель',
        'en': 'Strategic Executor',
      },
      description: {
        'ru': 'Вы сочетаете надёжность Строителя с аналитической силой Директора. Вы создаёте эффективные системы и неукоснительно их выполняете.',
        'en': 'You combine the Builder\'s reliability with the Director\'s analytical strength. You create efficient systems and execute them consistently.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сочетание организованности и аналитического мышления — идеально для управления и операционной работы.',
        'en': 'Your answers showed a combination of organization and analytical thinking — ideal for management and operations.',
      },
      strengths: {
        'ru': [
          'Создание и поддержание эффективных систем',
          'Надёжность в достижении целей',
          'Логичный и структурированный подход',
          'Способность управлять сложными проектами',
        ],
        'en': [
          'Creating and maintaining efficient systems',
          'Reliability in achieving goals',
          'Logical and structured approach',
          'Ability to manage complex projects',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Ригидность и сопротивление переменам',
          'Недостаток спонтанности и гибкости',
        ],
        'en': [
          'Rigidity and resistance to change',
          'Lack of spontaneity and flexibility',
        ],
      },
      recommendations: {
        'ru': [
          'Ищите роли в управлении проектами или операциях',
          'Специально планируйте время для творчества',
          'Учитесь видеть ценность в хаосе',
        ],
        'en': [
          'Seek roles in project management or operations',
          'Specifically schedule time for creativity',
          'Learn to see value in chaos',
        ],
      },
      tryToday: {
        'ru': 'Сделайте что-то вне своего обычного плана — просто для эксперимента.',
        'en': 'Do something outside your usual plan — just as an experiment.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность создавать порядок из хаоса — суперсила, которая двигает мир вперёд!',
        'en': 'Your ability to create order from chaos is a superpower that moves the world forward!',
      },
    ),

    'profile_caring_organizer': TestProfile(
      id: 'profile_caring_organizer',
      name: {
        'ru': 'Заботливый Организатор',
        'en': 'Caring Organizer',
      },
      description: {
        'ru': 'Вы сочетаете надёжность Строителя с эмпатией Переговорщика. Вы создаёте стабильность и заботитесь о людях. Вы — опора для семьи и сообщества.',
        'en': 'You combine the Builder\'s reliability with the Negotiator\'s empathy. You create stability and care for people. You are a pillar for family and community.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сочетание организованности и заботы о других — идеально для ролей поддержки и управления людьми.',
        'en': 'Your answers showed a combination of organization and care for others — ideal for support and people management roles.',
      },
      strengths: {
        'ru': [
          'Создание стабильной и тёплой среды',
          'Надёжность с эмоциональной поддержкой',
          'Умение организовывать и заботиться одновременно',
          'Лояльность и глубокая привязанность',
        ],
        'en': [
          'Creating a stable and warm environment',
          'Reliability with emotional support',
          'Ability to organize and care simultaneously',
          'Loyalty and deep attachment',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Склонность брать на себя слишком много',
          'Трудности с установлением границ',
        ],
        'en': [
          'Tendency to take on too much',
          'Difficulty setting boundaries',
        ],
      },
      recommendations: {
        'ru': [
          'Найдите баланс между заботой о себе и других',
          'Устанавливайте чёткие границы',
          'Цените свой вклад, даже если он не виден',
        ],
        'en': [
          'Find balance between self-care and caring for others',
          'Set clear boundaries',
          'Value your contribution even if it\'s not visible',
        ],
      },
      tryToday: {
        'ru': 'Сделайте что-то приятное для себя без чувства вины.',
        'en': 'Do something nice for yourself without guilt.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность создавать уют и стабильность — бесценный дар для всех, кто рядом с вами!',
        'en': 'Your ability to create comfort and stability is a priceless gift for everyone around you!',
      },
    ),

    'profile_empathic_analyst': TestProfile(
      id: 'profile_empathic_analyst',
      name: {
        'ru': 'Эмпатичный Аналитик',
        'en': 'Empathic Analyst',
      },
      description: {
        'ru': 'Вы сочетаете аналитическую силу Директора с эмпатией Переговорщика. Вы понимаете и системы, и людей. Это редкий и мощный баланс.',
        'en': 'You combine the Director\'s analytical strength with the Negotiator\'s empathy. You understand both systems and people. This is a rare and powerful balance.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сочетание логического мышления и эмоциональной глубины — редкая комбинация для решения сложных человеческих проблем.',
        'en': 'Your answers showed a combination of logical thinking and emotional depth — a rare combination for solving complex human problems.',
      },
      strengths: {
        'ru': [
          'Понимание и логики, и эмоций',
          'Способность решать сложные межличностные проблемы',
          'Стратегическое мышление с человечностью',
          'Эффективная коммуникация на разных уровнях',
        ],
        'en': [
          'Understanding both logic and emotions',
          'Ability to solve complex interpersonal problems',
          'Strategic thinking with humanity',
          'Effective communication at different levels',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Внутренний конфликт между головой и сердцем',
          'Усталость от переключения между режимами',
        ],
        'en': [
          'Internal conflict between head and heart',
          'Fatigue from switching between modes',
        ],
      },
      recommendations: {
        'ru': [
          'Ищите роли, требующие и анализа, и работы с людьми',
          'Интегрируйте обе стороны вместо их разделения',
          'Помните, что ваша уникальность — в балансе',
        ],
        'en': [
          'Seek roles requiring both analysis and people work',
          'Integrate both sides instead of separating them',
          'Remember that your uniqueness is in the balance',
        ],
      },
      tryToday: {
        'ru': 'Используйте логику для решения эмоциональной проблемы или эмпатию для технической.',
        'en': 'Use logic to solve an emotional problem or empathy for a technical one.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность понимать и системы, и души делает вас незаменимым в сложных ситуациях!',
        'en': 'Your ability to understand both systems and souls makes you invaluable in complex situations!',
      },
    ),

    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': 'Сбалансированный',
        'en': 'Balanced',
      },
      description: {
        'ru': 'Вы имеете сбалансированное сочетание всех четырёх темпераментов. Вы адаптивны и можете проявлять разные качества в зависимости от ситуации.',
        'en': 'You have a balanced combination of all four temperaments. You are adaptive and can display different qualities depending on the situation.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали относительно равномерное распределение по всем четырём системам темперамента.',
        'en': 'Your answers showed a relatively even distribution across all four temperament systems.',
      },
      strengths: {
        'ru': [
          'Высокая адаптивность к разным ситуациям',
          'Способность понимать разных людей',
          'Гибкость в подходах и решениях',
          'Отсутствие выраженных слабостей',
        ],
        'en': [
          'High adaptability to different situations',
          'Ability to understand different people',
          'Flexibility in approaches and decisions',
          'No pronounced weaknesses',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможная неопределённость в идентичности',
          'Трудности с выбором направления',
        ],
        'en': [
          'Possible uncertainty in identity',
          'Difficulty choosing direction',
        ],
      },
      recommendations: {
        'ru': [
          'Исследуйте разные роли и найдите то, что резонирует',
          'Используйте свою адаптивность как преимущество',
          'Не пытайтесь вписаться в один тип',
        ],
        'en': [
          'Explore different roles and find what resonates',
          'Use your adaptability as an advantage',
          'Don\'t try to fit into one type',
        ],
      },
      tryToday: {
        'ru': 'Поэкспериментируйте с разными подходами к одной задаче.',
        'en': 'Experiment with different approaches to one task.',
      },
      inspiringConclusion: {
        'ru': 'Ваша уникальность — в универсальности. Вы — хамелеон, способный адаптироваться к любой ситуации!',
        'en': 'Your uniqueness is in your universality. You are a chameleon capable of adapting to any situation!',
      },
    ),
  };
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

