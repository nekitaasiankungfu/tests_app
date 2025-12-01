import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Conflict Communication Style Test Data
class ConflictCommunicationStyleData {
  static TestModel getConflictCommunicationStyleTest() {
    return TestModel(
      id: 'conflict_communication_style_v1',
      title: {
        'ru': 'Тест стиля общения и поведения в конфликтах',
        'en': 'Communication and Conflict Style Test',
      },
      description: {
        'ru': '''Этот тест поможет вам понять, как вы обычно ведёте себя в конфликтных и спорных ситуациях.

Тест основан на классической модели конфликтного поведения Томаса-Килманна, которая выделяет пять основных стилей: избегание, приспособление, соперничество, компромисс и сотрудничество.

Вы увидите 45 реальных жизненных ситуаций. Для каждой выберите вариант поведения, который наиболее точно описывает вашу типичную реакцию.''',
        'en': '''This test will help you understand how you typically behave in conflict situations.

The test is based on the Thomas-Kilmann conflict behavior model, which identifies five main styles: avoiding, accommodating, competing, compromising, and collaborating.

You will see 45 real-life situations. For each, choose the behavior option that most accurately describes your typical reaction.''',
      },
      category: {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      categoryId: 'relationships',
      questions: _questions,
      estimatedTime: 12,
      type: TestType.multiFactor,
      factorIds: ['avoiding', 'accommodating', 'competing', 'compromising', 'collaborating'],
    );
  }

  static final List<QuestionModel> _questions = [
    QuestionModel(
      id: '1',
      text: {
        'ru': 'На совещании коллега критикует ваше предложение перед всей командой. Вы:',
        'en': 'At a meeting, a colleague criticizes your proposal in front of the entire team. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Промолчите и не будете защищать свою идею',
            'en': 'Stay silent and don\'t defend your idea',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Согласитесь с критикой, чтобы не создавать напряжённую атмосферу',
            'en': 'Agree with the criticism to avoid creating tension',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Жёстко отстоите свою позицию и укажете на недостатки критики коллеги',
            'en': 'Firmly defend your position and point out flaws in the colleague\'s criticism',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предложите учесть замечания коллеги, немного модифицировав своё предложение',
            'en': 'Suggest considering the colleague\'s remarks by slightly modifying your proposal',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Попросите коллегу детально объяснить свои возражения и вместе найдёте оптимальное решение',
            'en': 'Ask the colleague to explain their objections in detail and find the optimal solution together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '2',
      text: {
        'ru': 'Ваш партнёр хочет провести выходные с его/её семьёй, а вы планировали отдохнуть вдвоём. Вы:',
        'en': 'Your partner wants to spend the weekend with their family, while you planned to relax together. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Делаете вид, что это не важно, и не обсуждаете свои планы',
            'en': 'Pretend it doesn\'t matter and don\'t discuss your plans',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь поехать к его/её семье, откладывая свои желания',
            'en': 'Agree to visit their family, postponing your wishes',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Настаиваете на своём плане, объясняя, что вам важнее провести время вдвоём',
            'en': 'Insist on your plan, explaining that spending time together is more important to you',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете съездить к семье на один день, а второй день провести вдвоём',
            'en': 'Suggest visiting the family for one day and spending the second day together',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Обсуждаете важность обоих планов и ищете способ совместить или перенести',
            'en': 'Discuss the importance of both plans and look for ways to combine or reschedule',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '3',
      text: {
        'ru': 'Вам поручили проект, но вы считаете, что дедлайн нереалистичен. Вы:',
        'en': 'You\'ve been assigned a project, but you think the deadline is unrealistic. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Принимаете проект, ничего не говоря о дедлайне, надеясь как-нибудь справиться',
            'en': 'Accept the project without saying anything about the deadline, hoping to manage somehow',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь со сроками, чтобы не показаться неспособным',
            'en': 'Agree to the timeline to avoid appearing incapable',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Категорически отказываетесь от таких сроков и требуете их пересмотра',
            'en': 'Categorically refuse such deadlines and demand their revision',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете сократить объём задач в обмен на сохранение дедлайна',
            'en': 'Suggest reducing the scope of tasks in exchange for keeping the deadline',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Детально анализируете проект с руководителем, вместе определяя реалистичные сроки',
            'en': 'Analyze the project in detail with your manager, jointly determining realistic timelines',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '4',
      text: {
        'ru': 'Друг постоянно опаздывает на встречи, и это вас раздражает. Вы:',
        'en': 'A friend is constantly late for meetings, and it annoys you. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Молчите, но начинаете реже назначать встречи с этим другом',
            'en': 'Stay silent but start scheduling meetings with this friend less often',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Продолжаете ждать, считая, что так он/она устроен/а',
            'en': 'Continue waiting, thinking that\'s just how they are',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Прямо говорите, что больше не намерены мириться с опозданиями',
            'en': 'Directly say you\'re no longer willing to tolerate lateness',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете начать встречаться в местах ближе к другу или в более удобное время',
            'en': 'Suggest meeting in places closer to the friend or at a more convenient time',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спокойно обсуждаете с другом, почему опоздания для вас важны и как решить проблему',
            'en': 'Calmly discuss with the friend why lateness matters to you and how to solve the problem',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '5',
      text: {
        'ru': 'В магазине кассир грубо разговаривает с вами. Вы:',
        'en': 'At a store, the cashier speaks to you rudely. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Быстро заканчиваете покупку и уходите, ничего не говоря',
            'en': 'Quickly finish your purchase and leave without saying anything',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Извиняетесь, думая, что, возможно, сами чем-то раздражили',
            'en': 'Apologize, thinking you might have annoyed them somehow',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Требуете позвать администратора и жалуетесь на поведение кассира',
            'en': 'Demand to speak to the manager and complain about the cashier\'s behavior',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Вежливо указываете на грубость, но продолжаете покупку',
            'en': 'Politely point out the rudeness but continue with your purchase',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спокойно спрашиваете, всё ли в порядке, и предлагаете начать общение заново',
            'en': 'Calmly ask if everything is okay and suggest starting the interaction over',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '6',
      text: {
        'ru': 'Коллега берёт на себя часть вашей заслуги за успешный проект. Вы:',
        'en': 'A colleague takes partial credit for your success on a project. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Не поднимаете этот вопрос, чтобы не портить отношения',
            'en': 'Don\'t raise the issue to avoid damaging the relationship',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Позволяете коллеге разделить заслугу, думая, что это не так важно',
            'en': 'Let the colleague share the credit, thinking it\'s not that important',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Публично восстанавливаете справедливость, указывая на свой вклад',
            'en': 'Publicly set the record straight by pointing out your contribution',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'В следующий раз просите коллегу упомянуть ваш вклад, а сейчас оставляете как есть',
            'en': 'Next time ask the colleague to mention your contribution, but leave it as is for now',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Наедине обсуждаете с коллегой важность честного признания вклада каждого',
            'en': 'Discuss privately with the colleague the importance of honestly acknowledging everyone\'s contribution',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '7',
      text: {
        'ru': 'Родители критикуют ваш выбор карьеры. Вы:',
        'en': 'Your parents criticize your career choice. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Избегаете разговоров на эту тему',
            'en': 'Avoid conversations on this topic',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь с их мнением, чтобы не расстраивать',
            'en': 'Agree with their opinion to avoid upsetting them',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Решительно защищаете свой выбор, не принимая их аргументов',
            'en': 'Firmly defend your choice without accepting their arguments',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Обещаете учесть их мнение в будущих решениях',
            'en': 'Promise to consider their opinion in future decisions',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Подробно объясняете свою мотивацию и пытаетесь понять их беспокойство',
            'en': 'Explain your motivation in detail and try to understand their concerns',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '8',
      text: {
        'ru': 'Два члена вашей команды постоянно спорят, что мешает работе. Вы:',
        'en': 'Two members of your team constantly argue, disrupting work. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Надеетесь, что они сами разберутся, и не вмешиваетесь',
            'en': 'Hope they\'ll figure it out themselves and don\'t intervene',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Просите обоих быть терпимее друг к другу',
            'en': 'Ask both to be more tolerant of each other',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Строго требуете прекратить споры и сосредоточиться на работе',
            'en': 'Strictly demand they stop arguing and focus on work',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Разделяете их задачи, чтобы минимизировать взаимодействие',
            'en': 'Separate their tasks to minimize interaction',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Организуете встречу, где все вместе обсудите причины конфликта и найдёте решение',
            'en': 'Organize a meeting where everyone discusses the causes of conflict and finds a solution together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '9',
      text: {
        'ru': 'Друг одолжил у вас деньги месяц назад и не возвращает. Вы:',
        'en': 'A friend borrowed money from you a month ago and hasn\'t returned it. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Не напоминаете, боясь показаться мелочным',
            'en': 'Don\'t remind them, afraid of seeming petty',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Решаете простить долг, чтобы не портить дружбу',
            'en': 'Decide to forgive the debt to preserve the friendship',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Прямо требуете вернуть деньги немедленно',
            'en': 'Directly demand the money back immediately',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Мягко напоминаете и предлагаете вернуть частями, если сразу сложно',
            'en': 'Gently remind them and suggest returning it in installments if all at once is difficult',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Открыто спрашиваете о ситуации друга и вместе планируете возврат',
            'en': 'Openly ask about your friend\'s situation and plan the repayment together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '10',
      text: {
        'ru': 'Сосед включает громкую музыку поздно вечером. Вы:',
        'en': 'A neighbor plays loud music late in the evening. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Терпите и используете беруши',
            'en': 'Endure it and use earplugs',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Думаете, что у соседа могут быть причины, и не жалуетесь',
            'en': 'Think the neighbor might have reasons and don\'t complain',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Стучите в стену или вызываете полицию',
            'en': 'Knock on the wall or call the police',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Оставляете записку с просьбой делать потише после 23:00',
            'en': 'Leave a note asking to keep it down after 11 PM',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Идёте к соседу, знакомитесь и спокойно обсуждаете проблему шума',
            'en': 'Go to the neighbor, introduce yourself, and calmly discuss the noise issue',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '11',
      text: {
        'ru': 'Вас несправедливо обвинили в ошибке, допущенной другим сотрудником. Вы:',
        'en': 'You\'ve been unfairly blamed for a mistake made by another employee. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Молчите, не желая выдавать коллегу',
            'en': 'Stay silent, not wanting to expose the colleague',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Берёте вину на себя, чтобы защитить коллегу',
            'en': 'Take the blame to protect the colleague',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Немедленно называете истинного виновника',
            'en': 'Immediately name the real culprit',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Признаёте свою часть ответственности, если она есть, но просите разобраться',
            'en': 'Acknowledge your share of responsibility if any, but ask for an investigation',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Предлагаете вместе с коллегой объяснить руководству, что произошло',
            'en': 'Suggest explaining to management together with the colleague what happened',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '12',
      text: {
        'ru': 'Ваш ребёнок/младший родственник отказывается делать уроки. Вы:',
        'en': 'Your child/younger relative refuses to do homework. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Оставляете в покое, надеясь, что сам/а передумает',
            'en': 'Leave them alone, hoping they\'ll change their mind',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Делаете уроки за него/неё, чтобы избежать конфликта',
            'en': 'Do the homework for them to avoid conflict',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Строго приказываете сесть за уроки прямо сейчас',
            'en': 'Strictly order them to sit down and do homework right now',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Договариваетесь: после выполнения части заданий — перерыв',
            'en': 'Make a deal: after completing part of the assignments — a break',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спокойно выясняете причины нежелания и вместе ищете мотивацию',
            'en': 'Calmly find out the reasons for the reluctance and look for motivation together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '13',
      text: {
        'ru': 'Друзья выбрали ресторан, который вам не нравится. Вы:',
        'en': 'Friends chose a restaurant you don\'t like. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Идёте туда, но ищете предлог уйти пораньше',
            'en': 'Go there but look for an excuse to leave early',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь без возражений ради компании',
            'en': 'Agree without objection for the company\'s sake',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Настаиваете на смене места, убеждая всех в своей правоте',
            'en': 'Insist on changing the place, convincing everyone you\'re right',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете пойти туда сейчас, но в следующий раз выбирать будете вы',
            'en': 'Suggest going there now, but next time you\'ll choose',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Честно делитесь своими предпочтениями и ищете место, устраивающее всех',
            'en': 'Honestly share your preferences and look for a place that suits everyone',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '14',
      text: {
        'ru': 'Руководство предлагает вам взять на себя дополнительные обязанности без повышения зарплаты. Вы:',
        'en': 'Management offers you additional responsibilities without a raise. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Говорите, что подумаете, но потом тянете с ответом',
            'en': 'Say you\'ll think about it, then delay giving an answer',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь, надеясь, что это оценят в будущем',
            'en': 'Agree, hoping it will be appreciated in the future',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Решительно отказываетесь, если нет финансовой компенсации',
            'en': 'Firmly refuse if there\'s no financial compensation',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Соглашаетесь частично выполнять новые задачи',
            'en': 'Agree to partially perform the new tasks',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Обсуждаете с руководством ценность новых обязанностей и варианты компенсации',
            'en': 'Discuss with management the value of new responsibilities and compensation options',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '15',
      text: {
        'ru': 'В очереди кто-то пытается пройти перед вами. Вы:',
        'en': 'In a queue, someone tries to cut in front of you. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Ничего не говорите, чувствуя дискомфорт',
            'en': 'Say nothing, feeling uncomfortable',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Пропускаете, думая, что человеку, может быть, срочно',
            'en': 'Let them through, thinking they might be in a hurry',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Громко указываете на нарушение и требуете встать в конец очереди',
            'en': 'Loudly point out the violation and demand they go to the back of the line',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Вежливо говорите, что здесь очередь, указывая на её конец',
            'en': 'Politely say there\'s a queue, pointing to its end',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спрашиваете, может быть, человеку действительно срочно, и предлагаете решение',
            'en': 'Ask if the person is really in a hurry and suggest a solution',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '16',
      text: {
        'ru': 'Близкий родственник постоянно даёт вам непрошеные советы. Вы:',
        'en': 'A close relative constantly gives you unsolicited advice. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Избегаете общения на личные темы',
            'en': 'Avoid discussing personal topics',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Киваете и соглашаетесь, чтобы не обижать',
            'en': 'Nod and agree so as not to offend',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Резко просите не вмешиваться в вашу жизнь',
            'en': 'Sharply ask them not to interfere in your life',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Благодарите за совет, но просите давать их только когда вы спрашиваете',
            'en': 'Thank them for the advice but ask them to give it only when you ask',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Объясняете, что цените заботу, но хотите самостоятельности, и обсуждаете границы',
            'en': 'Explain that you appreciate the care but want independence, and discuss boundaries',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '17',
      text: {
        'ru': 'На встрече команда движется к решению, которое вы считаете ошибочным. Вы:',
        'en': 'At a meeting, the team is moving toward a decision you consider wrong. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Промолчите, подумав «пусть сами разберутся»',
            'en': 'Stay silent, thinking \'let them figure it out themselves\'',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Поддерживаете решение большинства, отодвигая свои сомнения',
            'en': 'Support the majority decision, putting aside your doubts',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Категорически выступаете против и пытаетесь переубедить всех',
            'en': 'Categorically oppose and try to persuade everyone',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете модифицировать решение, включив элементы вашего подхода',
            'en': 'Suggest modifying the decision to include elements of your approach',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Делитесь своими опасениями и предлагаете проанализировать все варианты',
            'en': 'Share your concerns and suggest analyzing all options',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '18',
      text: {
        'ru': 'Друг забыл о важном для вас событии (дне рождения, встрече). Вы:',
        'en': 'A friend forgot about an important event for you (birthday, meeting). You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Не говорите об обиде и делаете вид, что всё нормально',
            'en': 'Don\'t mention being hurt and pretend everything is fine',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Оправдываете друга, думая, что у него/неё много дел',
            'en': 'Excuse the friend, thinking they have a lot going on',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Прямо говорите, как вы разочарованы и обижены',
            'en': 'Directly say how disappointed and hurt you are',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Мягко напоминаете о событии и предлагаете встретиться позже',
            'en': 'Gently remind about the event and suggest meeting later',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Честно рассказываете о своих чувствах и выясняете, что случилось',
            'en': 'Honestly share your feelings and find out what happened',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '19',
      text: {
        'ru': 'Вам не нравится новая политика компании по удалённой работе. Вы:',
        'en': 'You don\'t like the company\'s new remote work policy. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Принимаете новые правила, жалуясь только в кругу коллег',
            'en': 'Accept the new rules, complaining only among colleagues',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Подстраиваетесь под новые условия без протеста',
            'en': 'Adapt to the new conditions without protest',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Требуете пересмотра политики или грозите уходом',
            'en': 'Demand a policy review or threaten to leave',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете гибридный вариант, устраивающий обе стороны',
            'en': 'Suggest a hybrid option that suits both sides',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Инициируете обсуждение с руководством, предлагая альтернативные решения',
            'en': 'Initiate discussion with management, suggesting alternative solutions',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '20',
      text: {
        'ru': 'В ресторане вам принесли не то блюдо, которое вы заказывали. Вы:',
        'en': 'At a restaurant, they brought you the wrong dish. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Едите то, что принесли, чтобы не создавать проблем',
            'en': 'Eat what they brought to avoid creating problems',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Думаете, что может это даже лучше, и оставляете как есть',
            'en': 'Think maybe it\'s even better and leave it as is',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Возмущённо требуете исправить ошибку немедленно',
            'en': 'Indignantly demand they fix the mistake immediately',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Вежливо указываете на ошибку и просите скидку или что-то в подарок',
            'en': 'Politely point out the mistake and ask for a discount or something complimentary',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спокойно объясняете ситуацию и вместе с официантом находите решение',
            'en': 'Calmly explain the situation and find a solution together with the waiter',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '21',
      text: {
        'ru': 'Вы и ваш партнёр не можете договориться, куда поехать в отпуск. Вы:',
        'en': 'You and your partner can\'t agree on where to go on vacation. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Откладываете решение, надеясь, что всё само решится',
            'en': 'Postpone the decision, hoping it will resolve itself',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь с выбором партнёра, отказываясь от своих планов',
            'en': 'Agree with your partner\'s choice, abandoning your plans',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Настаиваете на своём варианте, приводя весомые аргументы',
            'en': 'Insist on your option, providing strong arguments',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете поехать в третье место, нейтральное для обоих',
            'en': 'Suggest going to a third place, neutral for both',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Вместе изучаете варианты, ищете место, сочетающее интересы обоих',
            'en': 'Study options together, looking for a place that combines both interests',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '22',
      text: {
        'ru': 'Коллега систематически перебивает вас на совещаниях. Вы:',
        'en': 'A colleague systematically interrupts you at meetings. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Замолкаете и больше не пытаетесь высказаться',
            'en': 'Fall silent and no longer try to speak up',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Позволяете перебивать, считая коллегу более важным',
            'en': 'Allow the interruptions, considering the colleague more important',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Жёстко обрываете коллегу и требуете дать вам договорить',
            'en': 'Harshly cut off the colleague and demand they let you finish',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Договариваетесь очерёдностью выступлений через руководителя',
            'en': 'Arrange speaking turns through the manager',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'После встречи спокойно обсуждаете с коллегой проблему перебивания',
            'en': 'After the meeting, calmly discuss the interruption problem with the colleague',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '23',
      text: {
        'ru': 'Друг постоянно отменяет планы в последний момент. Вы:',
        'en': 'A friend constantly cancels plans at the last moment. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Перестаёте строить планы с этим другом',
            'en': 'Stop making plans with this friend',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Продолжаете прощать, думая, что так бывает',
            'en': 'Continue forgiving, thinking it happens',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Говорите, что больше не будете общаться, если это повторится',
            'en': 'Say you won\'t communicate anymore if it happens again',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете встречаться более спонтанно, без заблаговременных планов',
            'en': 'Suggest meeting more spontaneously, without advance plans',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Открыто говорите о своих чувствах и вместе ищете причину проблемы',
            'en': 'Openly talk about your feelings and look for the cause of the problem together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '24',
      text: {
        'ru': 'Таксист едет не по самому короткому маршруту. Вы:',
        'en': 'The taxi driver is not taking the shortest route. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Молчите, не желая конфликта',
            'en': 'Stay silent, not wanting conflict',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Думаете, что водитель лучше знает дороги',
            'en': 'Think the driver knows the roads better',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Требуете ехать по вашему маршруту и угрожаете жалобой',
            'en': 'Demand to follow your route and threaten to complain',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Указываете на более короткий путь и просите скидку за лишние километры',
            'en': 'Point out a shorter route and ask for a discount for extra kilometers',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спрашиваете водителя о причине выбора маршрута и обсуждаете альтернативы',
            'en': 'Ask the driver about the reason for the route choice and discuss alternatives',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '25',
      text: {
        'ru': 'Ваша идея на мозговом штурме была проигнорирована командой. Вы:',
        'en': 'Your idea was ignored by the team during brainstorming. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Больше не предлагаете идей на этой встрече',
            'en': 'Stop suggesting ideas at this meeting',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Поддерживаете другие идеи, забывая о своей',
            'en': 'Support other ideas, forgetting about yours',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Настойчиво повторяете свою идею, пока её не услышат',
            'en': 'Persistently repeat your idea until it\'s heard',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете объединить вашу идею с идеей кого-то другого',
            'en': 'Suggest combining your idea with someone else\'s',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Вежливо просите вернуться к вашему предложению и подробнее объяснить его',
            'en': 'Politely ask to return to your suggestion and explain it in more detail',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '26',
      text: {
        'ru': 'Родственник критикует ваш стиль воспитания детей. Вы:',
        'en': 'A relative criticizes your parenting style. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Избегаете обсуждения темы воспитания с этим человеком',
            'en': 'Avoid discussing parenting topics with this person',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь с критикой, чтобы не портить отношения',
            'en': 'Agree with the criticism to avoid damaging the relationship',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Категорически заявляете, что это не их дело',
            'en': 'Categorically state it\'s none of their business',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Принимаете часть замечаний, но защищаете основные принципы',
            'en': 'Accept some comments but defend the main principles',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Объясняете свой подход и интересуетесь опытом родственника',
            'en': 'Explain your approach and take interest in the relative\'s experience',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '27',
      text: {
        'ru': 'Друг просит вас солгать для его/её алиби. Вы:',
        'en': 'A friend asks you to lie to provide an alibi. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Уклоняетесь от ответа и исчезаете на время',
            'en': 'Evade answering and disappear for a while',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь помочь, несмотря на дискомфорт',
            'en': 'Agree to help despite discomfort',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Категорически отказываетесь и читаете другу мораль',
            'en': 'Categorically refuse and lecture the friend',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете помочь по-другому, без лжи',
            'en': 'Offer to help differently, without lying',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Честно объясняете свои принципы и обсуждаете ситуацию друга',
            'en': 'Honestly explain your principles and discuss the friend\'s situation',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '28',
      text: {
        'ru': 'В вашей зоне ответственности произошла ошибка из-за нечётких инструкций руководства. Вы:',
        'en': 'An error occurred in your area of responsibility due to unclear management instructions. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Надеетесь, что ошибку не заметят',
            'en': 'Hope the error won\'t be noticed',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Берёте всю вину на себя',
            'en': 'Take all the blame yourself',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Перекладываете ответственность на руководство за плохие инструкции',
            'en': 'Shift responsibility to management for poor instructions',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Признаёте ошибку и просите улучшить инструкции на будущее',
            'en': 'Acknowledge the error and ask for improved instructions in the future',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Анализируете причины с командой и вместе создаёте более чёткие процессы',
            'en': 'Analyze the causes with the team and create clearer processes together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '29',
      text: {
        'ru': 'В спортзале кто-то занял тренажёр, который вы хотели использовать. Вы:',
        'en': 'At the gym, someone took the machine you wanted to use. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Уходите к другому тренажёру, даже если он вам не подходит',
            'en': 'Go to another machine, even if it doesn\'t suit you',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Ждёте неопределённо долго, не спрашивая, сколько ещё',
            'en': 'Wait indefinitely without asking how much longer',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Требуете освободить тренажёр, так как вы тоже имеете право',
            'en': 'Demand they free the machine because you also have the right',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Спрашиваете, можете ли работать с этим человеком по очереди',
            'en': 'Ask if you can work with this person in turns',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Вежливо уточняете, сколько подходов осталось, и предлагаете дружески работать вместе',
            'en': 'Politely ask how many sets are left and suggest working together in a friendly way',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '30',
      text: {
        'ru': 'Вы хотите поменять традицию семейных праздников, но другие против. Вы:',
        'en': 'You want to change a family holiday tradition, but others are against it. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Отказываетесь от своей идеи, не настаивая',
            'en': 'Give up your idea without insisting',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь сохранить традицию ради семейной гармонии',
            'en': 'Agree to keep the tradition for family harmony',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Настаиваете на изменениях, убеждая в их необходимости',
            'en': 'Insist on changes, convincing of their necessity',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете чередовать старую и новую традицию',
            'en': 'Suggest alternating between old and new traditions',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Организуете семейное обсуждение, где каждый выскажет своё мнение',
            'en': 'Organize a family discussion where everyone expresses their opinion',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '31',
      text: {
        'ru': 'Новый сотрудник не соблюдает установленные командой правила. Вы:',
        'en': 'A new employee doesn\'t follow the team\'s established rules. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Надеетесь, что кто-то другой скажет новичку',
            'en': 'Hope someone else will tell the newcomer',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Приспосабливаетесь к стилю новичка, не говоря о правилах',
            'en': 'Adapt to the newcomer\'s style without mentioning the rules',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Строго указываете на нарушения и требуете соблюдения',
            'en': 'Strictly point out violations and demand compliance',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете пересмотреть некоторые правила с учётом опыта новичка',
            'en': 'Suggest reviewing some rules considering the newcomer\'s experience',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Дружелюбно объясняете правила и спрашиваете, есть ли сложности с их выполнением',
            'en': 'Friendly explain the rules and ask if there are difficulties following them',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '32',
      text: {
        'ru': 'Друзья планируют дорогое мероприятие, которое вам не по карману. Вы:',
        'en': 'Friends are planning an expensive event you can\'t afford. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Придумываете отговорку, чтобы не идти',
            'en': 'Make up an excuse not to go',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Идёте, влезая в долги, чтобы не выделяться',
            'en': 'Go, getting into debt, to not stand out',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Критикуете идею и настаиваете на более дешёвом варианте',
            'en': 'Criticize the idea and insist on a cheaper option',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете альтернативу средней стоимости',
            'en': 'Suggest a mid-priced alternative',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Честно делитесь своей ситуацией и вместе ищете вариант для всех',
            'en': 'Honestly share your situation and look for an option that works for everyone together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '33',
      text: {
        'ru': 'Ваш график работы конфликтует с личными обязательствами. Вы:',
        'en': 'Your work schedule conflicts with personal commitments. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Ничего не говорите руководству, пытаясь справиться сами',
            'en': 'Say nothing to management, trying to cope on your own',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Жертвуете личными делами ради работы',
            'en': 'Sacrifice personal matters for work',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Требуете изменить график под ваши нужды',
            'en': 'Demand the schedule be changed to fit your needs',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Просите временно изменить график на критичный период',
            'en': 'Ask to temporarily change the schedule for the critical period',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Обсуждаете с руководителем варианты гибкого графика, учитывая интересы обеих сторон',
            'en': 'Discuss flexible schedule options with your manager, considering both sides\' interests',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '34',
      text: {
        'ru': 'В самолёте пассажир перед вами полностью откинул спинку кресла. Вы:',
        'en': 'On a plane, the passenger in front fully reclined their seat. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Терпите дискомфорт весь полёт',
            'en': 'Endure the discomfort the entire flight',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Думаете, что человек устал, и не просите поднять спинку',
            'en': 'Think the person is tired and don\'t ask them to raise the seat',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Грубо толкаете кресло или требуете вернуть спинку в вертикальное положение',
            'en': 'Rudely push the seat or demand they return it to upright position',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Просите немного приподнять спинку, хотя бы частично',
            'en': 'Ask to raise the seat a bit, at least partially',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Вежливо объясняете ситуацию и предлагаете найти удобное для обоих положение',
            'en': 'Politely explain the situation and suggest finding a position comfortable for both',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '35',
      text: {
        'ru': 'Члены семьи не помогают с домашними делами. Вы:',
        'en': 'Family members don\'t help with household chores. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Молча делаете всё сами, накапливая обиду',
            'en': 'Silently do everything yourself, accumulating resentment',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Считаете, что это ваша обязанность, и продолжаете',
            'en': 'Consider it your duty and continue',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Устраиваете «забастовку», отказываясь что-либо делать',
            'en': 'Go on \'strike,\' refusing to do anything',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Просите помогать хотя бы с определёнными задачами',
            'en': 'Ask for help with at least certain tasks',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Организуете семейное собрание для справедливого распределения обязанностей',
            'en': 'Organize a family meeting for fair distribution of responsibilities',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '36',
      text: {
        'ru': 'Коллега распространяет о вас непроверенную информацию. Вы:',
        'en': 'A colleague is spreading unverified information about you. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Игнорируете слухи, надеясь, что они сами затихнут',
            'en': 'Ignore the rumors, hoping they\'ll die down on their own',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Оправдываетесь перед всеми, кому попало',
            'en': 'Justify yourself to everyone you meet',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Публично обвиняете коллегу и требуете извинений',
            'en': 'Publicly accuse the colleague and demand an apology',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Просите коллегу прекратить, обещая не поднимать шум',
            'en': 'Ask the colleague to stop, promising not to make a fuss',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спокойно разговариваете с коллегой наедине, выясняя причины и устраняя недопонимание',
            'en': 'Calmly talk with the colleague privately, finding out reasons and clearing up misunderstandings',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '37',
      text: {
        'ru': 'Друг просит вас помочь с переездом, но у вас уже есть планы. Вы:',
        'en': 'A friend asks you to help with moving, but you already have plans. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Говорите «может быть», но в итоге не приходите',
            'en': 'Say \'maybe\' but don\'t show up in the end',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Отменяете свои планы, чтобы помочь другу',
            'en': 'Cancel your plans to help the friend',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Категорически отказываетесь, не предлагая альтернатив',
            'en': 'Categorically refuse without offering alternatives',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете помочь в другое время или частично',
            'en': 'Offer to help at another time or partially',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Обсуждаете с другом важность его переезда и ваших планов, ищете решение',
            'en': 'Discuss with the friend the importance of their move and your plans, look for a solution',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '38',
      text: {
        'ru': 'Команда выбирает инструмент, с которым вы не умеете работать. Вы:',
        'en': 'The team is choosing a tool you don\'t know how to use. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Молчите о своей некомпетентности, надеясь научиться на ходу',
            'en': 'Stay silent about your incompetence, hoping to learn as you go',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь с выбором команды, скрывая свои опасения',
            'en': 'Agree with the team\'s choice, hiding your concerns',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Настаиваете на выборе знакомого вам инструмента',
            'en': 'Insist on choosing a tool you\'re familiar with',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете альтернативный инструмент, похожий на выбранный',
            'en': 'Suggest an alternative tool similar to the chosen one',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Открыто говорите о своём уровне и вместе планируете обучение',
            'en': 'Openly discuss your skill level and plan training together',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '39',
      text: {
        'ru': 'Человек курит в неположенном месте рядом с вами. Вы:',
        'en': 'Someone is smoking in a prohibited area near you. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Отходите подальше, ничего не говоря',
            'en': 'Move away without saying anything',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Терпите дым, не желая конфликтовать',
            'en': 'Tolerate the smoke, not wanting to conflict',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Требуете немедленно потушить сигарету, угрожая вызвать полицию',
            'en': 'Demand they immediately put out the cigarette, threatening to call police',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Вежливо указываете на запрет курения в этом месте',
            'en': 'Politely point out smoking is prohibited in this place',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Спокойно объясняете, что дым вам мешает, и предлагаете место, где можно курить',
            'en': 'Calmly explain that the smoke bothers you and suggest a place where smoking is allowed',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '40',
      text: {
        'ru': 'Ваш подросток хочет принять решение, с которым вы не согласны. Вы:',
        'en': 'Your teenager wants to make a decision you disagree with. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Избегаете разговора, надеясь, что ребёнок передумает',
            'en': 'Avoid the conversation, hoping the child will change their mind',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Разрешаете, хотя считаете это ошибкой',
            'en': 'Allow it, though you think it\'s a mistake',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Категорически запрещаете без объяснений',
            'en': 'Categorically forbid without explanations',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Устанавливаете условия, при которых согласитесь',
            'en': 'Set conditions under which you\'ll agree',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Подробно обсуждаете все за и против, помогая подростку самому прийти к взвешенному решению',
            'en': 'Discuss all pros and cons in detail, helping the teenager reach a balanced decision themselves',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '41',
      text: {
        'ru': 'Вам предложили повышение, но оно требует переезда в другой город. Вы:',
        'en': 'You\'ve been offered a promotion, but it requires moving to another city. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Откладываете решение, не обсуждая с семьёй',
            'en': 'Postpone the decision without discussing with family',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Отказываетесь ради комфорта семьи, не обсуждая варианты',
            'en': 'Refuse for family comfort without discussing options',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Принимаете предложение, настаивая на переезде всей семьи',
            'en': 'Accept the offer, insisting the whole family move',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Просите работодателя об удалённом формате или частичном присутствии',
            'en': 'Ask the employer for remote work or partial presence',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Вместе с семьёй взвешиваете все последствия и ищете оптимальное решение для всех',
            'en': 'Together with family weigh all consequences and look for optimal solution for everyone',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '42',
      text: {
        'ru': 'Друг постоянно жалуется, но не принимает советов. Вы:',
        'en': 'A friend constantly complains but doesn\'t take advice. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Начинаете избегать встреч с этим другом',
            'en': 'Start avoiding meetings with this friend',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Продолжаете слушать, жертвуя своим временем и энергией',
            'en': 'Continue listening, sacrificing your time and energy',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Резко говорите, что устали слушать одно и то же',
            'en': 'Bluntly say you\'re tired of hearing the same thing',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Устанавливаете лимит времени на жалобы во время встреч',
            'en': 'Set a time limit for complaints during meetings',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Честно говорите о своих чувствах и вместе ищете, как вы можете помочь',
            'en': 'Honestly share your feelings and look together for how you can help',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '43',
      text: {
        'ru': 'Вы случайно повредили чужую припаркованную машину. Вы:',
        'en': 'You accidentally damaged someone\'s parked car. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Уезжаете, надеясь, что никто не видел',
            'en': 'Drive away, hoping no one saw',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Оставляете записку с извинениями, но без контактов',
            'en': 'Leave a note with apologies but without contact info',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Думаете, что повреждение было мелким, и не оставляете контакты',
            'en': 'Think the damage was minor and don\'t leave contact info',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Оставляете контакты с предложением оплатить половину ремонта',
            'en': 'Leave contact info offering to pay half the repair',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Оставляете полные контакты и берёте на себя ответственность за ущерб',
            'en': 'Leave full contact info and take responsibility for the damage',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '44',
      text: {
        'ru': 'Коллега постоянно просит вас подменить его/её, но сам/а не отвечает взаимностью. Вы:',
        'en': 'A colleague constantly asks you to cover for them but never reciprocates. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Начинаете придумывать отговорки, чтобы избежать просьб',
            'en': 'Start making excuses to avoid the requests',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Продолжаете помогать, не ожидая ничего взамен',
            'en': 'Continue helping without expecting anything in return',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Отказываете категорически, перечисляя все случаи невзаимности',
            'en': 'Refuse categorically, listing all cases of non-reciprocation',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Соглашаетесь подменить при условии, что в следующий раз подменят вас',
            'en': 'Agree to cover on the condition they\'ll cover for you next time',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Откровенно говорите о чувстве несправедливости и предлагаете систему взаимопомощи',
            'en': 'Openly talk about feeling unfairness and suggest a mutual help system',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
    QuestionModel(
      id: '45',
      text: {
        'ru': 'В семье возник финансовый вопрос с разными мнениями о приоритетах. Вы:',
        'en': 'A financial issue arose in the family with different opinions on priorities. You:',
      },
      answers: [
        AnswerModel(
          id: 'a',
          text: {
            'ru': 'Избегаете обсуждения денежных вопросов',
            'en': 'Avoid discussing financial matters',
          },
          score: 0,
        ),
        AnswerModel(
          id: 'b',
          text: {
            'ru': 'Соглашаетесь с финансовым решением других членов семьи',
            'en': 'Agree with other family members\' financial decision',
          },
          score: 1,
        ),
        AnswerModel(
          id: 'c',
          text: {
            'ru': 'Настаиваете на своём видении распределения бюджета',
            'en': 'Insist on your vision of budget allocation',
          },
          score: 2,
        ),
        AnswerModel(
          id: 'd',
          text: {
            'ru': 'Предлагаете разделить бюджет на личные и общие расходы',
            'en': 'Suggest dividing the budget into personal and shared expenses',
          },
          score: 3,
        ),
        AnswerModel(
          id: 'e',
          text: {
            'ru': 'Организуете семейное обсуждение с анализом финансов и совместным планированием',
            'en': 'Organize a family discussion with financial analysis and joint planning',
          },
          score: 4,
        ),
      ],
      factorId: 'multi_choice',
    ),
  ];

  /// Factor order for multi-choice scoring (maps answer ID to factor)
  /// a=0(avoiding), b=1(accommodating), c=2(competing), d=3(compromising), e=4(collaborating)
  static const List<String> factorOrder = [
    'avoiding',
    'accommodating',
    'competing',
    'compromising',
    'collaborating',
  ];


  static Map<String, String> getFactorName(String factorId) {
    return _factorNames[factorId] ?? {'ru': factorId, 'en': factorId};
  }

  static final Map<String, Map<String, String>> _factorNames = {
    'avoiding': {'ru': 'Избегание', 'en': 'Avoiding'},
    'accommodating': {'ru': 'Приспособление', 'en': 'Accommodating'},
    'competing': {'ru': 'Соперничество', 'en': 'Competing'},
    'compromising': {'ru': 'Компромисс', 'en': 'Compromising'},
    'collaborating': {'ru': 'Сотрудничество', 'en': 'Collaborating'},
  };

  static String getFactorDescription(String factorId, String languageCode) {
    final descriptions = {
      'avoiding': {
        'ru': 'Избегание — это стиль поведения в конфликте, при котором человек предпочитает уходить от противостояния, откладывать обсуждение проблемы или вовсе игнорировать её существование. Люди с высоким уровнем избегания не проявляют ни напористости, ни кооперативности: они не стремятся ни удовлетворить свои интересы, ни помочь другой стороне. Этот стиль может быть эффективен в тривиальных ситуациях или когда нужно время для обдумывания, но при частом использовании ведёт к накоплению нерешённых проблем и росту напряжения в отношениях.',
        'en': 'Avoiding is a conflict behavior style where a person prefers to withdraw from confrontation, postpone discussing the problem, or ignore its existence altogether. People with high avoiding show neither assertiveness nor cooperativeness: they don\'t strive to satisfy their own interests or help the other party. This style can be effective in trivial situations or when time is needed for reflection, but frequent use leads to accumulation of unresolved problems and increased tension in relationships.',
      },
      'accommodating': {
        'ru': 'Приспособление — это стиль поведения в конфликте, при котором человек жертвует собственными интересами ради интересов другой стороны. Люди с высоким уровнем приспособления демонстрируют низкую напористость, но высокую кооперативность: они ценят гармонию в отношениях и готовы уступить для сохранения мира. Этот стиль полезен, когда вопрос для вас незначителен, но важен для другого, или когда отношения важнее конкретного исхода. Однако частое приспособление может привести к подавлению собственных потребностей, накоплению обиды и потере уважения к себе.',
        'en': 'Accommodating is a conflict behavior style where a person sacrifices their own interests for the sake of the other party. People with high accommodating show low assertiveness but high cooperativeness: they value harmony in relationships and are willing to yield to maintain peace. This style is useful when the issue is insignificant to you but important to the other, or when the relationship is more important than the specific outcome. However, frequent accommodating can lead to suppression of one\'s own needs, accumulation of resentment, and loss of self-respect.',
      },
      'competing': {
        'ru': 'Соперничество — это стиль поведения в конфликте, при котором человек стремится отстоять свою позицию любой ценой, даже если это идёт в ущерб интересам другой стороны. Люди с высоким уровнем соперничества демонстрируют высокую напористость, но низкую кооперативность: они ориентированы на победу в споре и готовы использовать власть, аргументы или давление для достижения своих целей. Этот стиль эффективен в критических ситуациях, требующих быстрых решений, или когда нужно защитить важные интересы. Однако частое соперничество разрушает отношения, создаёт атмосферу враждебности и лишает другую сторону мотивации к сотрудничеству.',
        'en': 'Competing is a conflict behavior style where a person strives to defend their position at any cost, even if it harms the other party\'s interests. People with high competing show high assertiveness but low cooperativeness: they are focused on winning the argument and willing to use power, arguments, or pressure to achieve their goals. This style is effective in critical situations requiring quick decisions, or when important interests need protection. However, frequent competing destroys relationships, creates a hostile atmosphere, and deprives the other party of motivation to cooperate.',
      },
      'compromising': {
        'ru': 'Компромисс — это стиль поведения в конфликте, при котором обе стороны частично жертвуют своими интересами ради достижения взаимоприемлемого решения. Люди с высоким уровнем компромисса демонстрируют умеренную напористость и умеренную кооперативность: они готовы уступить часть своих требований, ожидая того же от другой стороны. Этот стиль эффективен, когда нужно быстро решить проблему, стороны имеют равную силу, или полное удовлетворение интересов невозможно. Компромисс позволяет сохранить отношения и двигаться вперёд, но не всегда приводит к оптимальному решению, так как обе стороны получают меньше желаемого.',
        'en': 'Compromising is a conflict behavior style where both parties partially sacrifice their interests to reach a mutually acceptable solution. People with high compromising show moderate assertiveness and moderate cooperativeness: they are willing to concede part of their demands, expecting the same from the other party. This style is effective when a problem needs to be solved quickly, parties have equal power, or full satisfaction of interests is impossible. Compromise allows maintaining relationships and moving forward, but doesn\'t always lead to an optimal solution, as both parties get less than desired.',
      },
      'collaborating': {
        'ru': 'Сотрудничество — это стиль поведения в конфликте, при котором обе стороны стремятся найти решение, полностью удовлетворяющее интересы всех участников (win-win). Люди с высоким уровнем сотрудничества демонстрируют высокую напористость и высокую кооперативность: они открыто выражают свои потребности, внимательно слушают другую сторону и ищут творческие решения, которые учитывают все важные интересы. Этот стиль требует времени, доверия и готовности к диалогу, но приводит к наиболее прочным и удовлетворительным результатам. Сотрудничество укрепляет отношения, повышает взаимное уважение и создаёт основу для будущих совместных решений.',
        'en': 'Collaborating is a conflict behavior style where both parties strive to find a solution that fully satisfies the interests of all participants (win-win). People with high collaborating show high assertiveness and high cooperativeness: they openly express their needs, carefully listen to the other party, and seek creative solutions that consider all important interests. This style requires time, trust, and willingness to dialogue, but leads to the most sustainable and satisfying results. Collaboration strengthens relationships, increases mutual respect, and creates a foundation for future joint decisions.',
      },
    };

    return descriptions[factorId]?[languageCode] ?? '';
  }

  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    final level = percentage < 30 ? 'low' : (percentage < 70 ? 'medium' : 'high');
    final interpretation = _interpretations[factorId]?[level] ?? {'ru': '', 'en': ''};

    // Подставляем процент в интерпретацию
    final percentStr = percentage.toStringAsFixed(0);
    return {
      'ru': interpretation['ru']!.replaceAll('{percent}', percentStr),
      'en': interpretation['en']!.replaceAll('{percent}', percentStr),
    };
  }

  static final Map<String, Map<String, Map<String, String>>> _interpretations = {
    'avoiding': {
      'low': {
        'ru': 'Низкий уровень избегания ({percent}%): Вы редко уходите от конфликтов и готовы к открытому обсуждению проблем. Вы не боитесь противостояния и предпочитаете решать вопросы сразу, а не откладывать их. Это говорит о вашей готовности брать ответственность за отношения и не позволять проблемам накапливаться.',
        'en': 'Low avoiding level ({percent}%): You rarely withdraw from conflicts and are ready for open discussion of problems. You\'re not afraid of confrontation and prefer to resolve issues immediately rather than postpone them. This indicates your willingness to take responsibility for relationships and not let problems accumulate.',
      },
      'medium': {
        'ru': 'Средний уровень избегания ({percent}%): Вы избегаете конфликтов избирательно, когда это стратегически целесообразно. Вы понимаете, что не каждая битва стоит того, чтобы её вести, и умеете выбирать моменты для обсуждения. Это говорит о вашей гибкости и способности оценивать ситуацию.',
        'en': 'Medium avoiding level ({percent}%): You avoid conflicts selectively when it\'s strategically appropriate. You understand that not every battle is worth fighting and can choose moments for discussion. This indicates your flexibility and ability to assess situations.',
      },
      'high': {
        'ru': 'Высокий уровень избегания ({percent}%): Вы склонны уходить от конфликтов и предпочитаете не обострять ситуацию. Возможно, вы надеетесь, что проблемы решатся сами, или боитесь негативных последствий противостояния. Важно помнить, что невысказанные проблемы накапливаются и могут привести к более серьёзным конфликтам в будущем.',
        'en': 'High avoiding level ({percent}%): You tend to withdraw from conflicts and prefer not to escalate situations. You may hope that problems will resolve themselves or fear negative consequences of confrontation. It\'s important to remember that unspoken problems accumulate and can lead to more serious conflicts in the future.',
      },
    },
    'accommodating': {
      'low': {
        'ru': 'Низкий уровень приспособления ({percent}%): Вы склонны отстаивать свои интересы и не готовы легко уступать другим. Вы цените свои потребности и не позволяете им быть проигнорированными ради сохранения мира. Это говорит о здоровых границах и уважении к себе.',
        'en': 'Low accommodating level ({percent}%): You tend to defend your interests and are not willing to easily yield to others. You value your needs and don\'t let them be ignored for the sake of peace. This indicates healthy boundaries and self-respect.',
      },
      'medium': {
        'ru': 'Средний уровень приспособления ({percent}%): Вы балансируете между своими и чужими интересами, умея уступать, когда это уместно. Вы понимаете ценность гармонии, но не жертвуете собой без оснований. Это говорит о вашей способности находить равновесие между самоуважением и заботой об отношениях.',
        'en': 'Medium accommodating level ({percent}%): You balance between your own and others\' interests, able to yield when appropriate. You understand the value of harmony but don\'t sacrifice yourself without reason. This indicates your ability to find balance between self-respect and relationship care.',
      },
      'high': {
        'ru': 'Высокий уровень приспособления ({percent}%): Вы часто ставите потребности других выше своих и готовы уступить ради сохранения гармонии. Вы цените мир в отношениях и готовы жертвовать своими интересами. Важно следить, чтобы забота о других не превращалась в пренебрежение собственными потребностями.',
        'en': 'High accommodating level ({percent}%): You often prioritize others\' needs over your own and are willing to yield to maintain harmony. You value peace in relationships and are ready to sacrifice your interests. It\'s important to ensure that caring for others doesn\'t turn into neglecting your own needs.',
      },
    },
    'competing': {
      'low': {
        'ru': 'Низкий уровень соперничества ({percent}%): Вы редко настаиваете на своём и избегаете силового давления в конфликтах. Вы предпочитаете мягкие подходы к решению проблем и не стремитесь доминировать. Это может быть как сильной стороной (дипломатичность), так и зоной развития (способность отстаивать важное).',
        'en': 'Low competing level ({percent}%): You rarely insist on your way and avoid forceful pressure in conflicts. You prefer soft approaches to problem-solving and don\'t strive to dominate. This can be both a strength (diplomacy) and a development area (ability to defend what\'s important).',
      },
      'medium': {
        'ru': 'Средний уровень соперничества ({percent}%): Вы можете быть напористым, когда это необходимо, но не злоупотребляете этим стилем. Вы умеете отстаивать свои принципы в важных вопросах, при этом оставаясь гибким в менее значимых. Это говорит о вашей способности выбирать подходящую стратегию.',
        'en': 'Medium competing level ({percent}%): You can be assertive when necessary but don\'t overuse this style. You can defend your principles on important issues while remaining flexible on less significant ones. This indicates your ability to choose appropriate strategies.',
      },
      'high': {
        'ru': 'Высокий уровень соперничества ({percent}%): Вы активно отстаиваете свою позицию и стремитесь к победе в спорах. Вы уверены в себе и готовы использовать аргументы и напор для достижения целей. Важно помнить, что частые победы в спорах могут приводить к проигрышу в отношениях.',
        'en': 'High competing level ({percent}%): You actively defend your position and strive to win arguments. You\'re confident and ready to use arguments and pressure to achieve goals. It\'s important to remember that frequent wins in arguments can lead to losses in relationships.',
      },
    },
    'compromising': {
      'low': {
        'ru': 'Низкий уровень компромисса ({percent}%): Вы ищете оптимальные решения, которые удовлетворяют все стороны, а не просто делите разницу пополам. Вы не готовы соглашаться на "половинчатые" решения и предпочитаете либо сотрудничество, либо отстаивание позиции. Это может быть признаком высоких стандартов к качеству решений.',
        'en': 'Low compromising level ({percent}%): You seek optimal solutions that satisfy all parties rather than simply splitting the difference. You\'re not ready to settle for "half-measures" and prefer either collaboration or position defense. This may be a sign of high standards for solution quality.',
      },
      'medium': {
        'ru': 'Средний уровень компромисса ({percent}%): Вы готовы к компромиссам для быстрого решения проблем, когда это уместно. Вы понимаете, что иногда "достаточно хорошее" решение лучше, чем бесконечные споры. Это говорит о вашем прагматизме и умении ценить время.',
        'en': 'Medium compromising level ({percent}%): You\'re willing to compromise for quick problem resolution when appropriate. You understand that sometimes a "good enough" solution is better than endless arguments. This indicates your pragmatism and ability to value time.',
      },
      'high': {
        'ru': 'Высокий уровень компромисса ({percent}%): Вы часто ищете компромиссные решения и готовы уступить часть своих требований ради достижения договорённости. Вы цените справедливость и взаимные уступки. Важно следить, чтобы стремление к быстрому компромиссу не мешало поиску действительно оптимальных решений.',
        'en': 'High compromising level ({percent}%): You often seek compromise solutions and are willing to concede part of your demands to reach agreement. You value fairness and mutual concessions. It\'s important to ensure that seeking quick compromise doesn\'t prevent finding truly optimal solutions.',
      },
    },
    'collaborating': {
      'low': {
        'ru': 'Низкий уровень сотрудничества ({percent}%): Вы редко ищете взаимовыгодные решения, которые удовлетворяют обе стороны полностью. Возможно, вам не хватает времени или доверия для глубокого диалога, или вы не видите в этом необходимости. Развитие этого стиля может значительно улучшить качество ваших отношений.',
        'en': 'Low collaborating level ({percent}%): You rarely seek mutually beneficial solutions that fully satisfy both parties. You may lack time or trust for deep dialogue, or don\'t see the necessity. Developing this style can significantly improve your relationship quality.',
      },
      'medium': {
        'ru': 'Средний уровень сотрудничества ({percent}%): Вы открыты к сотрудничеству в важных вопросах и готовы искать win-win решения, когда это имеет смысл. Вы понимаете ценность взаимовыгодных решений, но не используете этот стиль постоянно. Это говорит о вашей избирательности и умении оценивать ситуацию.',
        'en': 'Medium collaborating level ({percent}%): You\'re open to collaboration on important issues and willing to seek win-win solutions when it makes sense. You understand the value of mutually beneficial solutions but don\'t use this style constantly. This indicates your selectivity and ability to assess situations.',
      },
      'high': {
        'ru': 'Высокий уровень сотрудничества ({percent}%): Вы активно стремитесь к win-win решениям и готовы вкладывать время и усилия в поиск решений, удовлетворяющих всех. Вы цените глубокий диалог, творческий подход и долгосрочные отношения. Это наиболее зрелый и эффективный стиль разрешения конфликтов.',
        'en': 'High collaborating level ({percent}%): You actively strive for win-win solutions and are willing to invest time and effort in finding solutions that satisfy everyone. You value deep dialogue, creative approach, and long-term relationships. This is the most mature and effective conflict resolution style.',
      },
    },
  };

  static String determineProfile(Map<String, double> percentages) {
    String? dominant;
    double maxScore = 0;

    percentages.forEach((factorId, percentage) {
      if (percentage > maxScore) {
        maxScore = percentage;
        dominant = factorId;
      }
    });

    int highScores = 0;
    percentages.forEach((_, percentage) {
      if (percentage > 60) highScores++;
    });

    if (highScores > 1) return 'profile_mixed';
    return 'profile_$dominant';
  }

  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static final Map<String, TestProfile> _profiles = {
    'profile_avoiding': TestProfile(
      id: 'profile_avoiding',
      name: {
        'ru': 'Избегающий',
        'en': 'Avoiding',
      },
      description: {
        'ru': 'Вы предпочитаете уходить от конфликтов и отложить решение проблем на потом',
        'en': 'You prefer to withdraw from conflicts and postpone problem-solving',
      },
      whyThisProfile: {
        'ru': 'Вы склонны избегать конфликтных ситуаций, надеясь, что проблемы решатся сами собой или со временем потеряют актуальность. Вы часто уходите от прямого обсуждения разногласий, предпочитая сохранять внешнее спокойствие. Этот стиль может быть полезен, когда вопрос действительно несущественен, когда вам нужно время на обдумывание или когда ситуация слишком эмоционально заряжена для продуктивного диалога.  Однако постоянное избегание конфликтов может привести к накоплению нерешённых проблем, росту внутреннего напряжения и недопониманию с окружающими. Важные вопросы могут оставаться без решения, что в долгосрочной перспективе ухудшает отношения и снижает вашу способность влиять на ситуацию. Люди могут воспринимать вас как уклончивого или безразличного к общим проблемам.  Для развития более эффективного стиля коммуникации вам может помочь осознание того, что многие конфликты не исчезают сами по себе и требуют вашего активного участия. Практикуйте выражение своих потребностей и границ в безопасной обстановке, начиная с малозначимых ситуаций.',
        'en': 'You tend to avoid conflict situations, hoping problems will resolve themselves or become irrelevant over time. You often retreat from direct discussion of disagreements, preferring to maintain an outward calm. This style can be useful when the issue is truly insignificant, when you need time to think, or when the situation is too emotionally charged for productive dialogue.  However, constant conflict avoidance can lead to accumulation of unresolved problems, increased internal tension, and misunderstanding with others. Important issues may remain unaddressed, which in the long run worsens relationships and reduces your ability to influence situations. People may perceive you as evasive or indifferent to common problems.  To develop a more effective communication style, it may help to recognize that many conflicts don\'t disappear on their own and require your active participation. Practice expressing your needs and boundaries in safe settings, starting with minor situations.',
      },
      strengths: {
        'ru': [
          'Умение сохранять спокойствие в напряжённых ситуациях',
          'Предотвращение эскалации мелких конфликтов',
          'Способность дать время на «остывание» эмоций',
          'Дипломатичность в деликатных вопросах',
        ],
        'en': [
          'Ability to remain calm in tense situations',
          'Prevention of minor conflict escalation',
          'Ability to allow time for emotions to \'cool down\'',
          'Diplomacy in delicate matters',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Накопление нерешённых проблем',
          'Упущенные возможности влиять на ситуацию',
          'Внутренний стресс от невысказанного',
          'Риск потери уважения со стороны окружающих',
        ],
        'en': [
          'Accumulation of unresolved problems',
          'Missed opportunities to influence situations',
          'Internal stress from unexpressed feelings',
          'Risk of losing respect from others',
        ],
      },
      recommendations: {
        'ru': [
          'Начните с малозначимых конфликтов, чтобы практиковать прямое обсуждение',
          'Осознайте, что краткосрочный дискомфорт лучше долгосрочных проблем',
          'Установите для себя правило: если проблема беспокоит вас более трёх раз, её нужно обсудить',
          'Используйте письменную форму (email, сообщения), если устное общение пока сложно',
          'Изучите техники ассертивной коммуникации',
        ],
        'en': [
          'Start with minor conflicts to practice direct discussion',
          'Recognize that short-term discomfort is better than long-term problems',
          'Set a rule for yourself: if a problem bothers you more than three times, it needs to be discussed',
          'Use written form (email, messages) if verbal communication is difficult for now',
          'Study assertive communication techniques',
        ],
      },
      tryToday: {
        'ru': 'Начните с малозначимых конфликтов, чтобы практиковать прямое обсуждение',
        'en': 'Start with minor conflicts to practice direct discussion',
      },
      inspiringConclusion: {
        'ru': 'Понимание вашего стиля — первый шаг к эффективному общению.',
        'en': 'Understanding your style is the first step to effective communication.',
      },
    ),
    'profile_accommodating': TestProfile(
      id: 'profile_accommodating',
      name: {
        'ru': 'Приспосабливающийся',
        'en': 'Accommodating',
      },
      description: {
        'ru': 'Вы ставите потребности других выше своих, стремясь сохранить гармонию в отношениях',
        'en': 'You prioritize others\' needs above your own, striving to maintain harmony in relationships',
      },
      whyThisProfile: {
        'ru': 'Вы часто жертвуете своими интересами ради благополучия других и мира в отношениях. Вам важно, чтобы окружающие были довольны, даже если это означает отказ от собственных потребностей. Вы цените гармонию и готовы уступить в спорных вопросах. Этот стиль эффективен, когда вопрос действительно важнее для другой стороны, когда вы хотите показать великодушие или когда отношения ценнее конкретного результата.  Однако чрезмерное приспособление может привести к тому, что ваши собственные потребности останутся неудовлетворёнными, а ваше мнение — неуслышанным. Это может вызвать накопление обиды, снижение самооценки и ощущение, что вас используют. Окружающие могут начать воспринимать ваше мнение как маловажное и привыкнуть к тому, что вы всегда уступаете.  Для более сбалансированного подхода важно научиться различать ситуации, где уступка уместна, от тех, где необходимо отстаивать свои интересы. Ваша способность к эмпатии — это сила, но она должна распространяться и на вас самих.',
        'en': 'You often sacrifice your interests for the well-being of others and peace in relationships. It\'s important to you that those around you are satisfied, even if it means abandoning your own needs. You value harmony and are ready to yield in disputed matters. This style is effective when the issue is truly more important to the other party, when you want to show magnanimity, or when the relationship is more valuable than the specific outcome.  However, excessive accommodation can lead to your own needs remaining unmet and your opinion unheard. This can cause accumulation of resentment, decreased self-esteem, and a feeling of being used. Others may begin to perceive your opinion as unimportant and get used to you always yielding.  For a more balanced approach, it\'s important to learn to distinguish situations where yielding is appropriate from those where defending your interests is necessary. Your capacity for empathy is a strength, but it should extend to yourself as well.',
      },
      strengths: {
        'ru': [
          'Умение поддерживать гармоничные отношения',
          'Высокая эмпатия и чуткость к нуждам других',
          'Способность проявлять великодушие',
          'Гибкость и готовность к компромиссам',
        ],
        'en': [
          'Ability to maintain harmonious relationships',
          'High empathy and sensitivity to others\' needs',
          'Ability to show magnanimity',
          'Flexibility and willingness to compromise',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Игнорирование собственных потребностей',
          'Накопление невысказанной обиды',
          'Риск быть использованным другими',
          'Снижение влияния и авторитета',
        ],
        'en': [
          'Ignoring one\'s own needs',
          'Accumulation of unexpressed resentment',
          'Risk of being used by others',
          'Decreased influence and authority',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте говорить «нет» в ситуациях низкой важности для начала',
          'Осознайте, что забота о себе не эгоистична — это необходимость',
          'Определите свои «красные линии» — вопросы, в которых вы не готовы уступать',
          'Используйте фразу: «Это важно для меня, потому что...»',
          'Помните: здоровые отношения допускают выражение разных потребностей',
        ],
        'en': [
          'Practice saying \'no\' in low-importance situations to start',
          'Recognize that self-care isn\'t selfish — it\'s necessary',
          'Define your \'red lines\' — issues where you\'re not willing to yield',
          'Use the phrase: \'This is important to me because...\'',
          'Remember: healthy relationships allow expression of different needs',
        ],
      },
      tryToday: {
        'ru': 'Практикуйте говорить «нет» в ситуациях низкой важности для начала',
        'en': 'Practice saying \'no\' in low-importance situations to start',
      },
      inspiringConclusion: {
        'ru': 'Понимание вашего стиля — первый шаг к эффективному общению.',
        'en': 'Understanding your style is the first step to effective communication.',
      },
    ),
    'profile_competing': TestProfile(
      id: 'profile_competing',
      name: {
        'ru': 'Соперничающий',
        'en': 'Competing',
      },
      description: {
        'ru': 'Вы настойчиво отстаиваете свою позицию и стремитесь добиться своего',
        'en': 'You persistently defend your position and strive to get your way',
      },
      whyThisProfile: {
        'ru': 'Вы уверены в своей правоте и готовы активно отстаивать свою точку зрения, даже если это создаёт напряжение в отношениях. Для вас важен результат, и вы не боитесь конфронтации для его достижения. Вы цените решительность и эффективность. Этот стиль полезен в ситуациях, требующих быстрых решений, когда на кону стоят важные принципы или когда необходимо защитить свои права и интересы.  Однако излишняя конкурентность может повредить отношениям, создать атмосферу враждебности и заставить других чувствовать себя подавленными или игнорируемыми. Постоянное «продавливание» своей позиции может привести к тому, что люди будут избегать сотрудничества с вами или начнут сопротивляться вашим идеям просто из принципа. В долгосрочной перспективе это может изолировать вас и снизить общую эффективность команды.  Для более сбалансированного подхода важно научиться различать ситуации, где твёрдость необходима, от тех, где более эффективным будет сотрудничество. Ваша решительность — это ценное качество, но её нужно сочетать с умением слушать и учитывать интересы других.',
        'en': 'You\'re confident in your rightness and ready to actively defend your viewpoint, even if it creates tension in relationships. Results matter to you, and you\'re not afraid of confrontation to achieve them. You value decisiveness and efficiency. This style is useful in situations requiring quick decisions, when important principles are at stake, or when it\'s necessary to protect your rights and interests.  However, excessive competitiveness can damage relationships, create an atmosphere of hostility, and make others feel suppressed or ignored. Constantly \'pushing through\' your position can lead to people avoiding cooperation with you or starting to resist your ideas simply on principle. In the long run, this can isolate you and reduce overall team effectiveness.  For a more balanced approach, it\'s important to learn to distinguish situations where firmness is necessary from those where collaboration would be more effective. Your decisiveness is a valuable quality, but it needs to be combined with the ability to listen and consider others\' interests.',
      },
      strengths: {
        'ru': [
          'Способность принимать решительные действия в критических ситуациях',
          'Умение защищать свои интересы и права',
          'Эффективность в условиях ограниченного времени',
          'Готовность брать на себя ответственность',
        ],
        'en': [
          'Ability to take decisive action in critical situations',
          'Skill in protecting one\'s interests and rights',
          'Effectiveness under time constraints',
          'Willingness to take responsibility',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Повреждение отношений из-за жёсткости',
          'Создание атмосферы враждебности',
          'Игнорирование ценных идей других',
          'Риск изоляции и снижения влияния в долгосрочной перспективе',
        ],
        'en': [
          'Relationship damage due to rigidity',
          'Creating an atmosphere of hostility',
          'Ignoring valuable ideas from others',
          'Risk of isolation and decreased long-term influence',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте активное слушание перед тем, как отстаивать свою позицию',
          'Задавайте себе вопрос: «Насколько это действительно важно?»',
          'Ищите области, где можно проявить гибкость без ущерба для главной цели',
          'Объясняйте свою позицию через общие интересы, а не только через личную выгоду',
          'Замечайте моменты, когда другие могут быть правы',
        ],
        'en': [
          'Practice active listening before defending your position',
          'Ask yourself: \'How important is this really?\'',
          'Look for areas where flexibility is possible without compromising the main goal',
          'Explain your position through common interests, not just personal benefit',
          'Notice moments when others might be right',
        ],
      },
      tryToday: {
        'ru': 'Практикуйте активное слушание перед тем, как отстаивать свою позицию',
        'en': 'Practice active listening before defending your position',
      },
      inspiringConclusion: {
        'ru': 'Понимание вашего стиля — первый шаг к эффективному общению.',
        'en': 'Understanding your style is the first step to effective communication.',
      },
    ),
    'profile_compromising': TestProfile(
      id: 'profile_compromising',
      name: {
        'ru': 'Компромиссный',
        'en': 'Compromising',
      },
      description: {
        'ru': 'Вы ищете средние решения, где каждая сторона получает и отдаёт что-то',
        'en': 'You seek middle-ground solutions where each party gets and gives something',
      },
      whyThisProfile: {
        'ru': 'Вы стремитесь найти решение, которое частично удовлетворит обе стороны конфликта. Для вас важна справедливость и баланс интересов. Вы готовы отказаться от части своих требований, если другая сторона также пойдёт на уступки. Этот подход эффективен, когда обе стороны имеют равную власть, когда времени на поиск идеального решения нет, или когда сохранение отношений важнее, чем получение всего желаемого.  Однако компромисс не всегда является оптимальным решением. Иногда он приводит к ситуации, когда обе стороны остаются частично неудовлетворёнными. В некоторых случаях существуют более творческие решения, которые могли бы полностью удовлетворить обе стороны, но компромиссный подход не даёт их обнаружить. Кроме того, привычка всегда искать середину может восприниматься как отсутствие твёрдых принципов.  Для более эффективной коммуникации полезно сначала исследовать возможность сотрудничества и поиска взаимовыгодных решений, прежде чем быстро переходить к компромиссу. Ваша способность находить баланс — это ценный навык, который можно дополнить творческим подходом к решению проблем.',
        'en': 'You strive to find a solution that partially satisfies both parties in a conflict. Fairness and balance of interests are important to you. You\'re willing to give up part of your demands if the other party also makes concessions. This approach is effective when both parties have equal power, when there\'s no time to find the perfect solution, or when preserving the relationship is more important than getting everything you want.  However, compromise isn\'t always the optimal solution. Sometimes it leads to a situation where both parties remain partially unsatisfied. In some cases, more creative solutions exist that could fully satisfy both parties, but a compromising approach prevents discovering them. Additionally, a habit of always seeking the middle ground can be perceived as lacking firm principles.  For more effective communication, it\'s useful to first explore the possibility of collaboration and seeking mutually beneficial solutions before quickly moving to compromise. Your ability to find balance is a valuable skill that can be complemented with a creative approach to problem-solving.',
      },
      strengths: {
        'ru': [
          'Способность быстро находить приемлемые решения',
          'Умение балансировать разные интересы',
          'Практичность и реалистичность подхода',
          'Сохранение рабочих отношений',
        ],
        'en': [
          'Ability to quickly find acceptable solutions',
          'Skill in balancing different interests',
          'Practicality and realism of approach',
          'Maintaining working relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск упустить более качественные win-win решения',
          'Частичная неудовлетворённость обеих сторон',
          'Возможное восприятие как отсутствие принципов',
          'Иногда компромисс невозможен в принципиальных вопросах',
        ],
        'en': [
          'Risk of missing higher-quality win-win solutions',
          'Partial dissatisfaction of both parties',
          'Possible perception as lacking principles',
          'Sometimes compromise is impossible on principled issues',
        ],
      },
      recommendations: {
        'ru': [
          'Перед тем как предлагать компромисс, исследуйте возможности сотрудничества',
          'Задайте вопрос: «Есть ли способ удовлетворить обе стороны полностью?»',
          'Определите, какие вопросы являются принципиальными и не подлежат компромиссу',
          'Убедитесь, что компромисс действительно справедлив, а не просто удобен',
          'Используйте компромисс как промежуточное решение, а не конечную цель',
        ],
        'en': [
          'Before suggesting a compromise, explore collaboration possibilities',
          'Ask: \'Is there a way to fully satisfy both parties?\'',
          'Identify which issues are principled and not subject to compromise',
          'Ensure the compromise is truly fair, not just convenient',
          'Use compromise as an intermediate solution, not the end goal',
        ],
      },
      tryToday: {
        'ru': 'Перед тем как предлагать компромисс, исследуйте возможности сотрудничества',
        'en': 'Before suggesting a compromise, explore collaboration possibilities',
      },
      inspiringConclusion: {
        'ru': 'Понимание вашего стиля — первый шаг к эффективному общению.',
        'en': 'Understanding your style is the first step to effective communication.',
      },
    ),
    'profile_collaborating': TestProfile(
      id: 'profile_collaborating',
      name: {
        'ru': 'Сотрудничающий',
        'en': 'Collaborating',
      },
      description: {
        'ru': 'Вы ищете решения, которые полностью удовлетворяют обе стороны через открытый диалог',
        'en': 'You seek solutions that fully satisfy both parties through open dialogue',
      },
      whyThisProfile: {
        'ru': 'Вы стремитесь найти решения, которые максимально удовлетворяют интересы всех участников конфликта. Для вас важен открытый диалог, взаимопонимание и творческий подход к решению проблем. Вы готовы инвестировать время и усилия, чтобы найти наилучший вариант для всех. Вы верите, что часто возможно найти решение, где никто не должен жертвовать своими важными интересами.  Этот стиль наиболее эффективен для долгосрочного решения сложных проблем, укрепления отношений и достижения инновационных решений. Он способствует взаимному доверию, уважению и созданию атмосферы, где все стороны чувствуют себя услышанными и ценными. Сотрудничество приводит к более устойчивым решениям, так как все участники вовлечены в их создание.  Однако этот подход требует значительных временных и эмоциональных ресурсов, готовности к открытости и доверия между сторонами. В ситуациях кризиса или при жёстких временных рамках сотрудничество может быть неприменимым. Также важно понимать, что не все конфликты требуют такого глубокого подхода — иногда более простое решение будет более уместным.',
        'en': 'You strive to find solutions that maximally satisfy the interests of all conflict participants. Open dialogue, mutual understanding, and creative problem-solving are important to you. You\'re willing to invest time and effort to find the best option for everyone. You believe it\'s often possible to find a solution where no one has to sacrifice their important interests.  This style is most effective for long-term resolution of complex problems, strengthening relationships, and achieving innovative solutions. It promotes mutual trust, respect, and creates an atmosphere where all parties feel heard and valued. Collaboration leads to more sustainable solutions because all participants are involved in creating them.  However, this approach requires significant time and emotional resources, willingness to be open, and trust between parties. In crisis situations or with tight time frames, collaboration may be inapplicable. It\'s also important to understand that not all conflicts require such a deep approach — sometimes a simpler solution will be more appropriate.',
      },
      strengths: {
        'ru': [
          'Достижение максимального удовлетворения всех сторон',
          'Укрепление отношений через совместное решение проблем',
          'Создание инновационных решений',
          'Формирование атмосферы доверия и уважения',
        ],
        'en': [
          'Achieving maximum satisfaction for all parties',
          'Strengthening relationships through joint problem-solving',
          'Creating innovative solutions',
          'Building an atmosphere of trust and respect',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Требует значительных временных затрат',
          'Неприменим в кризисных ситуациях',
          'Требует готовности всех сторон к открытости',
          'Может быть избыточным для простых конфликтов',
        ],
        'en': [
          'Requires significant time investment',
          'Inapplicable in crisis situations',
          'Requires all parties\' willingness to be open',
          'May be excessive for simple conflicts',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте развивать навыки активного слушания и эмпатии',
          'Учитесь задавать вопросы, раскрывающие истинные потребности сторон',
          'Создавайте безопасное пространство для открытого диалога',
          'Будьте готовы к тому, что не все люди готовы к сотрудничеству',
          'Развивайте навыки креативного мышления для поиска нестандартных решений',
          'Оценивайте ситуацию: иногда более простой подход будет эффективнее',
        ],
        'en': [
          'Continue developing active listening and empathy skills',
          'Learn to ask questions that reveal the true needs of parties',
          'Create a safe space for open dialogue',
          'Be prepared that not everyone is ready for collaboration',
          'Develop creative thinking skills to find non-standard solutions',
          'Assess the situation: sometimes a simpler approach will be more effective',
        ],
      },
      tryToday: {
        'ru': 'Продолжайте развивать навыки активного слушания и эмпатии',
        'en': 'Continue developing active listening and empathy skills',
      },
      inspiringConclusion: {
        'ru': 'Понимание вашего стиля — первый шаг к эффективному общению.',
        'en': 'Understanding your style is the first step to effective communication.',
      },
    ),
    'profile_mixed': TestProfile(
      id: 'profile_mixed',
      name: {
        'ru': 'Гибкий/Смешанный',
        'en': 'Flexible/Mixed',
      },
      description: {
        'ru': 'Вы демонстрируете сбалансированное использование нескольких стилей поведения в конфликтах. Это говорит о вашей гибкости и способности адаптироваться к различным ситуациям.',
        'en': 'You demonstrate balanced use of multiple conflict styles. This indicates your flexibility and ability to adapt to different situations.',
      },
      whyThisProfile: {
        'ru': 'Ваши оценки по нескольким стилям превышают 60%, что указывает на отсутствие единственного доминирующего стиля.',
        'en': 'Your scores on multiple styles exceed 60%, indicating no single dominant style.',
      },
      strengths: {
        'ru': [
          'Гибкость в выборе стратегии поведения',
          'Способность адаптироваться к разным ситуациям',
          'Широкий репертуар конфликтных стратегий',
          'Понимание нюансов межличностного общения',
        ],
        'en': [
          'Flexibility in choosing behavioral strategies',
          'Ability to adapt to different situations',
          'Wide repertoire of conflict strategies',
          'Understanding nuances of interpersonal communication',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможная непоследовательность в поведении',
          'Риск потери четкой позиции',
          'Сложность в формировании стабильного стиля',
        ],
        'en': [
          'Possible inconsistency in behavior',
          'Risk of losing clear position',
          'Difficulty forming a stable style',
        ],
      },
      recommendations: {
        'ru': [
          'Осознавайте, какой стиль вы используете в каждой ситуации',
          'Развивайте способность к рефлексии после конфликтов',
          'Учитесь выбирать наиболее эффективный стиль для конкретной ситуации',
          'Не бойтесь оставаться последовательными, когда это необходимо',
        ],
        'en': [
          'Be aware of which style you use in each situation',
          'Develop ability to reflect after conflicts',
          'Learn to choose the most effective style for specific situations',
          'Don\'t be afraid to remain consistent when necessary',
        ],
      },
      tryToday: {
        'ru': 'В следующем конфликте осознанно выберите один стиль и придерживайтесь его',
        'en': 'In the next conflict, consciously choose one style and stick to it',
      },
      inspiringConclusion: {
        'ru': 'Ваша гибкость — это сила, если вы используете её осознанно.',
        'en': 'Your flexibility is a strength when you use it consciously.',
      },
    ),
  };
}
