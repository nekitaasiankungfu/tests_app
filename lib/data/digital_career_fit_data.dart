import '../models/test_model.dart';

/// Данные теста «Какая цифровая профессия вам подходит?»
///
/// 18 вопросов, 6 направлений цифровых профессий.
/// Каждый вопрос имеет 6 вариантов ответа, каждый соответствует одному направлению.
/// При выборе варианта 2 балла добавляются к соответствующей шкале.
///
/// Шкалы:
/// - product_thinking: Продуктовое мышление и бизнес-ориентация
/// - data_analytics: Аналитика и работа с данными
/// - design_ux: Дизайн и пользовательский опыт
/// - content_marketing: Контент и цифровой маркетинг
/// - management_communication: Коммуникация и управление
/// - tech_development: Технологии и разработка
class DigitalCareerFitData {
  /// Список ID факторов в порядке вариантов ответа
  static const List<String> factorOrder = [
    'product_thinking',
    'data_analytics',
    'design_ux',
    'content_marketing',
    'management_communication',
    'tech_development',
  ];

  /// Получить тест как TestModel
  static TestModel getDigitalCareerFitTest() {
    return TestModel(
      id: 'digital_career_fit_v1',
      title: {
        'ru': 'Какая цифровая профессия вам подходит?',
        'en': 'Digital Career Fit Test',
      },
      description: {
        'ru': 'Определите, к каким направлениям в сфере цифровых профессий вы наиболее предрасположены.',
        'en': 'Discover which digital career paths suit you best.',
      },
      category: {'ru': 'Карьера', 'en': 'Career'},
      categoryId: 'career',
      estimatedTime: 8,
      factorIds: factorOrder,
      questions: _getQuestions(),
      type: TestType.multiFactor,
    );
  }

  /// Список всех вопросов
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Что из этого кажется вам наиболее интересной задачей?',
          'en': 'What seems like the most interesting task to you?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Придумать, каким должен быть новый цифровой сервис и какие в нём функции.', 'en': 'Come up with what a new digital service should be and what features it should have.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Собрать и проанализировать данные, чтобы понять, почему упали продажи.', 'en': 'Collect and analyze data to understand why sales dropped.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Нарисовать прототип экрана приложения, чтобы им было удобно пользоваться.', 'en': 'Draw a prototype of an app screen to make it user-friendly.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Придумать и запустить рекламную кампанию в соцсетях.', 'en': 'Create and launch an advertising campaign on social media.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Согласовать работу команды и расставить приоритеты задач.', 'en': 'Coordinate teamwork and prioritize tasks.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Настроить или запрограммировать модуль, без которого сервис не будет работать.', 'en': 'Configure or program a module without which the service won\'t work.'}, score: 5),
        ],
        factorId: 'multi_choice', // Special marker for multi-factor scoring
      ),

      // Q2
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Какой формат рабочего дня вам ближе всего?',
          'en': 'What work day format suits you best?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Чередовать обсуждения с командой и самостоятельную работу над концепцией продукта.', 'en': 'Alternate between team discussions and independent work on product concept.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Глубоко погружаться в таблицы, отчёты и дашборды.', 'en': 'Deep dive into spreadsheets, reports and dashboards.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Много времени проводить в Figma или других графических инструментах.', 'en': 'Spend a lot of time in Figma or other graphic tools.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Писать тексты, посты, сценарии и общаться с аудиторией.', 'en': 'Write texts, posts, scripts and communicate with the audience.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Проводить созвоны, планёрки и решать организационные вопросы.', 'en': 'Hold calls, meetings and solve organizational issues.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Долго и сосредоточенно разбираться в коде или технических настройках.', 'en': 'Spend long focused time understanding code or technical settings.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q3
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Когда вы сталкиваетесь с новой идеей, вам прежде всего хочется…',
          'en': 'When you encounter a new idea, you first want to…',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Понять, насколько эта идея решает реальные задачи пользователей и бизнеса.', 'en': 'Understand how well this idea solves real user and business problems.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Посмотреть цифры и факты, подтверждающие или опровергающие идею.', 'en': 'Look at numbers and facts that confirm or refute the idea.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Представить, как это будет выглядеть и ощущаться для пользователя.', 'en': 'Imagine how it will look and feel for the user.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Продумать, как рассказать об этом людям так, чтобы их заинтересовать.', 'en': 'Think about how to tell people about it to interest them.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Распланировать шаги внедрения и распределить ответственность.', 'en': 'Plan implementation steps and distribute responsibility.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Разобраться, какие технологии нужны, чтобы реализовать эту идею.', 'en': 'Figure out what technologies are needed to implement this idea.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q4
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Что вас больше мотивирует в работе?',
          'en': 'What motivates you most at work?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Видеть, как продукт растёт по ключевым метрикам.', 'en': 'Seeing the product grow on key metrics.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Находить неожиданные инсайты в данных.', 'en': 'Finding unexpected insights in data.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Получать отзывы пользователей о том, что стало удобнее и красивее.', 'en': 'Getting user feedback that things became more convenient and beautiful.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Видеть отклик аудитории на ваши кампании и контент.', 'en': 'Seeing audience response to your campaigns and content.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Наблюдать, как команда слаженно работает и успевает в сроки.', 'en': 'Watching the team work smoothly and meet deadlines.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Запускать стабильный и быстрый функционал без багов.', 'en': 'Launching stable and fast functionality without bugs.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q5
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Как вы обычно принимаете решение в сложной ситуации?',
          'en': 'How do you usually make decisions in difficult situations?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Сравниваю влияние вариантов на продукт и бизнес в целом.', 'en': 'I compare the impact of options on the product and business as a whole.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Собираю максимум информации и анализирую плюсы и минусы.', 'en': 'I gather maximum information and analyze pros and cons.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Представляю путь пользователя и выбираю самый удобный для него вариант.', 'en': 'I imagine the user journey and choose the most convenient option for them.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Смотрю, как лучше всего донести решение до людей и что они воспримут.', 'en': 'I look at how best to communicate the decision to people and what they will accept.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Обсуждаю с участниками, кто что может взять на себя и как организовать процесс.', 'en': 'I discuss with participants who can take on what and how to organize the process.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Оцениваю техническую сложность и риски реализации каждого варианта.', 'en': 'I assess the technical complexity and implementation risks of each option.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q6
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Какой учебный курс вам было бы интереснее всего пройти?',
          'en': 'What course would you find most interesting to take?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'По управлению цифровым продуктом и работе с метриками.', 'en': 'Digital product management and metrics.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'По SQL, аналитике данных или BI-инструментам.', 'en': 'SQL, data analytics or BI tools.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'По UX-исследованиям и интерфейсному дизайну.', 'en': 'UX research and interface design.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'По таргетированной рекламе, SMM или контент-стратегиям.', 'en': 'Targeted advertising, SMM or content strategies.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'По управлению проектами, Agile и коммуникации в командах.', 'en': 'Project management, Agile and team communication.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'По программированию, архитектуре приложений или DevOps.', 'en': 'Programming, application architecture or DevOps.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q7
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Как вы относитесь к рутине?',
          'en': 'How do you feel about routine?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Если это помогает развивать продукт, могу терпеть, но стремлюсь автоматизировать.', 'en': 'If it helps develop the product, I can tolerate it but strive to automate.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Рутина приемлема, если она связана с аккуратной обработкой данных.', 'en': 'Routine is acceptable if it involves careful data processing.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Стараюсь разнообразить даже рутинные задачи визуальными и UX-улучшениями.', 'en': 'I try to diversify even routine tasks with visual and UX improvements.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Рутина быстро надоедает, предпочитаю творческие задачи.', 'en': 'Routine gets boring quickly, I prefer creative tasks.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Могу долго заниматься рутиной, если она помогает команде двигаться вперёд.', 'en': 'I can do routine work for a long time if it helps the team move forward.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Готов(а) к рутине, если она связана с настройкой систем или написанием кода.', 'en': 'Ready for routine if it involves system configuration or coding.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q8
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'С каким высказыванием вы больше всего согласны?',
          'en': 'Which statement do you agree with most?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': '«Главное — понять, что действительно ценно для пользователя и бизнеса.»', 'en': '"The main thing is to understand what is truly valuable for the user and business."'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': '«Без данных это всего лишь мнение.»', 'en': '"Without data, it\'s just an opinion."'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': '«Интерфейс должен быть интуитивно понятным без лишних объяснений.»', 'en': '"The interface should be intuitive without extra explanations."'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': '«История, рассказанная правильно, способна изменить поведение людей.»', 'en': '"A story told right can change people\'s behavior."'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': '«Хорошо организованный процесс решает половину проблем.»', 'en': '"A well-organized process solves half the problems."'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': '«Код — это язык, на котором разговаривают технологии.»', 'en': '"Code is the language technologies speak."'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q9
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Как вы предпочитаете учиться новому?',
          'en': 'How do you prefer to learn new things?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Разбирая кейсы успешных цифровых продуктов.', 'en': 'By analyzing cases of successful digital products.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Экспериментируя с набором данных и проверяя гипотезы.', 'en': 'By experimenting with datasets and testing hypotheses.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Перерисовывая интерфейсы и разбирая чужие дизайн-решения.', 'en': 'By redrawing interfaces and analyzing others\' design solutions.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Анализируя удачные кампании брендов и форматы контента.', 'en': 'By analyzing successful brand campaigns and content formats.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Наблюдая за работой команд и внедряя новые подходы в управлении.', 'en': 'By observing team work and implementing new management approaches.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Собирая pet-проекты, пробуя новые языки и технологии.', 'en': 'By building pet projects, trying new languages and technologies.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q10
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Как вы реагируете на ошибку в проекте?',
          'en': 'How do you react to an error in a project?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Смотрю, как ошибка повлияла на продуктовые показатели и что нужно изменить в стратегии.', 'en': 'I look at how the error affected product metrics and what needs to change in strategy.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Разбираю, на каком этапе анализа или расчётов произошёл сбой.', 'en': 'I analyze at what stage of analysis or calculations the failure occurred.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Проверяю, не запутывает ли пользователя интерфейс или визуальное решение.', 'en': 'I check if the interface or visual solution confuses the user.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Анализирую, где коммуникация с аудиторией могла сработать не так.', 'en': 'I analyze where communication with the audience might have gone wrong.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Выясняю, на каком этапе процесса произошёл сбой и как его предотвратить.', 'en': 'I find out at what stage of the process the failure occurred and how to prevent it.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Ищу техническую причину и продумываю более надёжное решение.', 'en': 'I look for the technical cause and think of a more reliable solution.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q11
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Какой результат работы приносит вам больше всего удовлетворения?',
          'en': 'What work result brings you the most satisfaction?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Чёткая продуктовая гипотеза, подтверждённая метриками.', 'en': 'A clear product hypothesis confirmed by metrics.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Отчёт или дашборд, в котором всё логично и понятно.', 'en': 'A report or dashboard where everything is logical and clear.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Новый интерфейс, который людям реально удобнее использовать.', 'en': 'A new interface that people actually find more convenient to use.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Контент или кампания, которая заметно повышает вовлечённость.', 'en': 'Content or campaign that noticeably increases engagement.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Проект, который команда завершила вовремя и без хаоса.', 'en': 'A project the team completed on time and without chaos.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Стабильно работающий сервис после релиза сложного функционала.', 'en': 'A stably working service after releasing complex functionality.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q12
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Как вы чувствуете себя, когда нужно выступить с идеей перед командой?',
          'en': 'How do you feel when you need to present an idea to the team?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Мне важно показать, как идея повлияет на продукт и рынок.', 'en': 'It\'s important for me to show how the idea will affect the product and market.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Подготовлю цифры и графики, которые подкрепят мои аргументы.', 'en': 'I\'ll prepare numbers and graphs to support my arguments.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Сделаю визуальную презентацию, чтобы идея была наглядной.', 'en': 'I\'ll make a visual presentation so the idea is clear.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Сфокусируюсь на том, как рассказать идею живо и увлекательно.', 'en': 'I\'ll focus on telling the idea in a lively and engaging way.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Подготовлю структуру встречи, чтобы обсуждение прошло эффективно.', 'en': 'I\'ll prepare the meeting structure so the discussion goes efficiently.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Буду готов(а) ответить на технические вопросы по реализации.', 'en': 'I\'ll be ready to answer technical questions about implementation.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q13
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Какой тип задач вы чаще всего берёте в командных проектах?',
          'en': 'What type of tasks do you most often take on in team projects?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Формулировать, какую проблему мы решаем и что будет результатом.', 'en': 'Formulating what problem we\'re solving and what the result will be.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Считать, измерять, делать выводы и предложения на основе данных.', 'en': 'Counting, measuring, making conclusions and suggestions based on data.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Делать прототипы, макеты, продумывать сценарии пользователя.', 'en': 'Making prototypes, layouts, thinking through user scenarios.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Писать тексты, слоганы, придумывать концепцию коммуникации.', 'en': 'Writing texts, slogans, coming up with communication concepts.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Координировать людей, следить за сроками и договорённостями.', 'en': 'Coordinating people, monitoring deadlines and agreements.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Настраивать сервис, писать код, подключать инструменты.', 'en': 'Setting up services, writing code, connecting tools.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q14
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Что для вас важнее всего в цифровом продукте?',
          'en': 'What is most important to you in a digital product?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Чтобы продукт решал важную задачу и приносил ценность.', 'en': 'That the product solves an important task and delivers value.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Чтобы можно было измерить результат и понять эффективность.', 'en': 'That you can measure results and understand effectiveness.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Чтобы им было приятно и удобно пользоваться.', 'en': 'That it\'s pleasant and convenient to use.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Чтобы про него хотелось рассказывать и делиться.', 'en': 'That you want to talk about it and share it.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Чтобы команда могла его развивать без постоянного стресса.', 'en': 'That the team can develop it without constant stress.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Чтобы он был надёжным, быстрым и технически устойчивым.', 'en': 'That it\'s reliable, fast and technically stable.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q15
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Какая рабочая среда вам комфортнее?',
          'en': 'What work environment is more comfortable for you?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Стык бизнеса, пользователей и команды, много обсуждений и решений.', 'en': 'At the intersection of business, users and team, many discussions and decisions.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Среда, где ценят аккуратность, логичность и доказательства.', 'en': 'Environment where accuracy, logic and evidence are valued.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Креативная среда с обсуждением визуала и пользовательских сценариев.', 'en': 'Creative environment discussing visuals and user scenarios.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Динамичная среда с сильной коммуникацией и фокусом на бренде.', 'en': 'Dynamic environment with strong communication and brand focus.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Командная среда, где важны договорённости и координация.', 'en': 'Team environment where agreements and coordination matter.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Техническая среда с разработчиками, системами и задачами в трекере.', 'en': 'Technical environment with developers, systems and tasks in tracker.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q16
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Что вам проще всего придумать экспромтом?',
          'en': 'What is easiest for you to come up with on the spot?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Как улучшить текущий продукт для какой-то аудитории.', 'en': 'How to improve the current product for some audience.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Какую метрику можно ввести, чтобы точнее измерить результат.', 'en': 'What metric to introduce to more accurately measure results.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Как сделать интерфейс более понятным без лишних подсказок.', 'en': 'How to make the interface clearer without extra hints.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Идею поста, рекламного сообщения или рубрики.', 'en': 'An idea for a post, ad message or content section.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Как организовать процесс, чтобы все знали, кто что делает.', 'en': 'How to organize a process so everyone knows who does what.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Техническое решение, как реализовать фичу с меньшими затратами.', 'en': 'A technical solution to implement a feature with less cost.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q17
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Если бы вы запустили свой собственный проект, то вы бы в нём…',
          'en': 'If you launched your own project, you would…',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': 'Определяли продуктовую стратегию и приоритизировали фичи.', 'en': 'Define product strategy and prioritize features.'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': 'Отвечали за аналитику и эксперименты.', 'en': 'Be responsible for analytics and experiments.'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': 'Проектировали пользовательский опыт и визуальную часть.', 'en': 'Design user experience and visual part.'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': 'Занимались продвижением, контентом и рекламой.', 'en': 'Handle promotion, content and advertising.'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': 'Руководили командой и процессами.', 'en': 'Lead the team and processes.'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': 'Разрабатывали и поддерживали техническую часть.', 'en': 'Develop and maintain the technical part.'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),

      // Q18
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Какой комплимент о работе вам особенно приятен?',
          'en': 'What work compliment is especially pleasant to you?',
        },
        answers: [
          AnswerModel(id: 'a1', text: {'ru': '«Благодаря тебе стало понятно, куда развивается продукт.»', 'en': '"Thanks to you, it became clear where the product is heading."'}, score: 0),
          AnswerModel(id: 'a2', text: {'ru': '«С тобой мы наконец начали понимать, что происходит в цифрах.»', 'en': '"With you we finally started understanding what\'s happening in the numbers."'}, score: 1),
          AnswerModel(id: 'a3', text: {'ru': '«Благодаря тебе продукт стал намного понятнее и приятнее.»', 'en': '"Thanks to you the product became much clearer and more pleasant."'}, score: 2),
          AnswerModel(id: 'a4', text: {'ru': '«Твой контент реально вовлекает людей.»', 'en': '"Your content really engages people."'}, score: 3),
          AnswerModel(id: 'a5', text: {'ru': '«С тобой проект идёт структурно и без хаоса.»', 'en': '"With you the project goes structured and without chaos."'}, score: 4),
          AnswerModel(id: 'a6', text: {'ru': '«Без твоих технических решений всё бы развалилось.»', 'en': '"Without your technical solutions everything would fall apart."'}, score: 5),
        ],
        factorId: 'multi_choice',
      ),
    ];
  }

  /// Названия факторов
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'product_thinking': {
        'ru': 'Продуктовое мышление',
        'en': 'Product Thinking',
      },
      'data_analytics': {
        'ru': 'Аналитика данных',
        'en': 'Data Analytics',
      },
      'design_ux': {
        'ru': 'Дизайн и UX',
        'en': 'Design & UX',
      },
      'content_marketing': {
        'ru': 'Контент и маркетинг',
        'en': 'Content & Marketing',
      },
      'management_communication': {
        'ru': 'Управление и коммуникация',
        'en': 'Management & Communication',
      },
      'tech_development': {
        'ru': 'Технологии и разработка',
        'en': 'Tech & Development',
      },
    };
  }

  /// Интерпретация результатов по фактору
  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    // Защита от NaN
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    // Определяем уровень (3 уровня)
    String level;
    if (percentage < 34) {
      level = 'low';
    } else if (percentage < 67) {
      level = 'medium';
    } else {
      level = 'high';
    }

    // Интерпретации по факторам
    final interpretations = {
      'product_thinking': {
        'low': {
          'ru': 'Низкий уровень продуктового мышления. Вам комфортнее сосредотачиваться на своей части работы, не отвечая за всю картину.',
          'en': 'Low product thinking level. You\'re more comfortable focusing on your part of the work without being responsible for the whole picture.',
        },
        'medium': {
          'ru': 'Умеренный уровень продуктового мышления. Вы понимаете связь между пользователем, продуктом и результатом.',
          'en': 'Moderate product thinking level. You understand the connection between user, product and result.',
        },
        'high': {
          'ru': 'Высокий уровень продуктового мышления. Вы мыслите как создатель продукта и вам интересна общая картина. Отличная база для продакт-менеджмента!',
          'en': 'High product thinking level. You think like a product creator and are interested in the big picture. Great foundation for product management!',
        },
      },
      'data_analytics': {
        'low': {
          'ru': 'Низкий интерес к аналитике. Цифры и таблицы не вызывают у вас особого энтузиазма.',
          'en': 'Low interest in analytics. Numbers and spreadsheets don\'t particularly excite you.',
        },
        'medium': {
          'ru': 'Умеренный интерес к аналитике. Вы готовы пользоваться данными как полезным инструментом.',
          'en': 'Moderate interest in analytics. You\'re ready to use data as a useful tool.',
        },
        'high': {
          'ru': 'Высокий интерес к аналитике. Вам по-настоящему интересно разбираться в цифрах и закономерностях. Отличная база для аналитика данных!',
          'en': 'High interest in analytics. You\'re genuinely interested in understanding numbers and patterns. Great foundation for data analyst!',
        },
      },
      'design_ux': {
        'low': {
          'ru': 'Низкий интерес к дизайну и UX. Интерфейсы для вас скорее фон, чем объект интереса.',
          'en': 'Low interest in design and UX. Interfaces are more background than an object of interest for you.',
        },
        'medium': {
          'ru': 'Умеренный интерес к дизайну и UX. Вам важно, чтобы продукт был удобным, но не обязательно самим всё рисовать.',
          'en': 'Moderate interest in design and UX. It\'s important to you that the product is convenient, but you don\'t necessarily want to draw everything yourself.',
        },
        'high': {
          'ru': 'Высокий интерес к дизайну и UX. Вам по-настоящему важно, как выглядит и ощущается цифровой продукт. Отличная база для UX/UI-дизайнера!',
          'en': 'High interest in design and UX. You genuinely care how a digital product looks and feels. Great foundation for UX/UI designer!',
        },
      },
      'content_marketing': {
        'low': {
          'ru': 'Низкий интерес к контенту и маркетингу. Создание постов и кампаний не приносит вам особого удовольствия.',
          'en': 'Low interest in content and marketing. Creating posts and campaigns doesn\'t bring you much pleasure.',
        },
        'medium': {
          'ru': 'Умеренный интерес к контенту и маркетингу. Вы можете придумывать идеи и тексты, но не хотите делать это постоянно.',
          'en': 'Moderate interest in content and marketing. You can come up with ideas and texts, but don\'t want to do it constantly.',
        },
        'high': {
          'ru': 'Высокий интерес к контенту и маркетингу. Вам реально нравится придумывать, как и о чём говорить с аудиторией. Отличная база для SMM и digital-маркетинга!',
          'en': 'High interest in content and marketing. You really enjoy figuring out how and what to tell the audience. Great foundation for SMM and digital marketing!',
        },
      },
      'management_communication': {
        'low': {
          'ru': 'Низкий интерес к управлению. Вам комфортнее отвечать за свою часть работы, а не за процесс в целом.',
          'en': 'Low interest in management. You\'re more comfortable being responsible for your part of the work, not the process as a whole.',
        },
        'medium': {
          'ru': 'Умеренный интерес к управлению. Вы можете брать на себя координацию, но не хотите делать это всегда.',
          'en': 'Moderate interest in management. You can take on coordination, but don\'t want to do it all the time.',
        },
        'high': {
          'ru': 'Высокий интерес к управлению. Вам близко организовывать людей, процессы и общие договорённости. Отличная база для проджект-менеджмента!',
          'en': 'High interest in management. You enjoy organizing people, processes and common agreements. Great foundation for project management!',
        },
      },
      'tech_development': {
        'low': {
          'ru': 'Низкий интерес к технологиям. Код и технические детали не вызывают у вас восторга.',
          'en': 'Low interest in technology. Code and technical details don\'t excite you.',
        },
        'medium': {
          'ru': 'Умеренный интерес к технологиям. Вы не боитесь технических тем, но не всегда хотите глубоко в них уходить.',
          'en': 'Moderate interest in technology. You\'re not afraid of technical topics, but don\'t always want to dive deep into them.',
        },
        'high': {
          'ru': 'Высокий интерес к технологиям. Вам по-настоящему нравится разбираться, как всё устроено «под капотом». Отличная база для разработчика!',
          'en': 'High interest in technology. You genuinely enjoy understanding how everything works "under the hood." Great foundation for developer!',
        },
      },
    };

    final factorInterpretations = interpretations[factorId];
    if (factorInterpretations == null) {
      return {
        'ru': 'Интерпретация недоступна',
        'en': 'Interpretation not available',
      };
    }

    return factorInterpretations[level] ?? {
      'ru': 'Интерпретация недоступна',
      'en': 'Interpretation not available',
    };
  }

  /// Получить factor ID по индексу ответа (0-5)
  static String getFactorIdByAnswerIndex(int index) {
    if (index >= 0 && index < factorOrder.length) {
      return factorOrder[index];
    }
    return factorOrder[0]; // Default to product_thinking
  }

  // ============================================================================
  // ПРОФИЛИ КАРЬЕРЫ
  // ============================================================================

  /// Данные профилей карьеры
  static const Map<String, CareerProfile> profiles = {
    'profile_product_manager': CareerProfile(
      id: 'profile_product_manager',
      name: {
        'ru': 'Продуктовый менеджер / продакт-ориентированные роли',
        'en': 'Product Manager / Product-oriented roles',
      },
      description: {
        'ru': 'Сильное продуктовое мышление в сочетании с интересом к данным и готовностью взаимодействовать с людьми. Вам могут подойти роли, где нужно отвечать за развитие цифрового продукта: понимать пользователей, работать с метриками, ставить задачи команде и принимать решения о том, что развивать в первую очередь.',
        'en': 'Strong product thinking combined with interest in data and willingness to interact with people. You may be suited for roles where you need to be responsible for digital product development: understand users, work with metrics, set tasks for the team and make decisions about what to develop first.',
      },
      characteristics: {
        'ru': [
          'Вы думаете о продукте целиком: от потребностей пользователей до бизнес-результатов.',
          'Вам интересно видеть влияние изменений на ключевые метрики и результаты.',
          'Вы готовы брать на себя ответственность и принимать решения в условиях неопределённости.',
          'Вы умеете (или готовы учиться) договариваться с разными ролями: разработчиками, дизайнерами, маркетологами.',
          'Вам комфортно переключаться между «картиной в целом» и деталями задач.',
        ],
        'en': [
          'You think about the product as a whole: from user needs to business results.',
          'You are interested in seeing the impact of changes on key metrics and results.',
          'You are ready to take responsibility and make decisions under uncertainty.',
          'You know how (or are willing to learn) to negotiate with different roles: developers, designers, marketers.',
          'You are comfortable switching between "the big picture" and task details.',
        ],
      },
      recommendations: {
        'ru': [
          'Изучите основы продуктового менеджмента: постановка гипотез, работа с метриками, юнит-экономика, CJM.',
          'Потренируйтесь формулировать продуктовые решения через гипотезы: «если мы сделаем X, то метрика Y изменится, потому что Z».',
          'Соберите небольшой учебный продуктовый кейс: разбор существующего приложения или придуманный вами сервис.',
          'Освойте базовую аналитику: чтение дашбордов, ключевые показатели роста и удержания.',
          'Развивайте навыки коммуникации: умение объяснять идеи простым языком и слушать возражения.',
        ],
        'en': [
          'Learn the basics of product management: hypothesis setting, metrics work, unit economics, CJM.',
          'Practice formulating product decisions through hypotheses: "if we do X, then metric Y will change because Z".',
          'Create a small educational product case: analysis of an existing app or a service you invented.',
          'Master basic analytics: reading dashboards, key growth and retention metrics.',
          'Develop communication skills: ability to explain ideas in simple language and listen to objections.',
        ],
      },
      suitableRoles: {
        'ru': [
          'Product Manager / продакт-менеджер',
          'Ассистент продакт-менеджера',
          'Продуктовый аналитик',
          'Owner/координатор небольшого цифрового продукта',
        ],
        'en': [
          'Product Manager',
          'Product Manager Assistant',
          'Product Analyst',
          'Owner/coordinator of a small digital product',
        ],
      },
      criteria: {
        'product_thinking': CriteriaBounds(min: 67, max: 100),
        'data_analytics': CriteriaBounds(min: 34, max: 100),
        'management_communication': CriteriaBounds(min: 34, max: 100),
      },
    ),

    'profile_data_analyst': CareerProfile(
      id: 'profile_data_analyst',
      name: {
        'ru': 'Аналитик данных / продуктовый аналитик',
        'en': 'Data Analyst / Product Analyst',
      },
      description: {
        'ru': 'У вас выраженный интерес к данным, структуре и закономерностям. Вы любите опираться на факты, а не только на интуицию. В сочетании с продуктовым взглядом это создаёт сильный профиль для аналитических профессий.',
        'en': 'You have a pronounced interest in data, structure and patterns. You prefer to rely on facts, not just intuition. Combined with product vision, this creates a strong profile for analytical professions.',
      },
      characteristics: {
        'ru': [
          'Вам нравится работать с таблицами, отчётами и графиками и находить в них закономерности.',
          'Вы предпочитаете проверять гипотезы, а не полагаться на ощущение «кажется, так лучше».',
          'Умеете или хотите научиться понятно объяснять сложные вещи простым языком.',
          'Вам комфортно проводить много времени за самостоятельной, сосредоточенной работой.',
          'Вы видите ценность в том, чтобы помогать бизнесу и продукту через точные измерения.',
        ],
        'en': [
          'You enjoy working with spreadsheets, reports and charts and finding patterns in them.',
          'You prefer to test hypotheses rather than rely on feeling "it seems better".',
          'You know or want to learn how to explain complex things in simple language.',
          'You are comfortable spending a lot of time on independent, focused work.',
          'You see value in helping business and product through accurate measurements.',
        ],
      },
      recommendations: {
        'ru': [
          'Освойте SQL — это базовый инструмент для работы с данными в большинстве digital-команд.',
          'Изучите основы статистики: средние значения, распределения, A/B-тесты, доверительные интервалы.',
          'Попробуйте один из инструментов визуализации данных (Power BI, Tableau, Looker Studio).',
          'Практикуйтесь на реальных датасетах: маркетинг, продуктовые метрики, поведение пользователей.',
          'Тренируйтесь формулировать выводы: «на графике видно, что…, это может означать…, поэтому имеет смысл сделать…».',
        ],
        'en': [
          'Master SQL - this is a basic tool for working with data in most digital teams.',
          'Learn the basics of statistics: averages, distributions, A/B tests, confidence intervals.',
          'Try one of the data visualization tools (Power BI, Tableau, Looker Studio).',
          'Practice on real datasets: marketing, product metrics, user behavior.',
          'Practice formulating conclusions: "the graph shows that..., this may mean..., so it makes sense to do...".',
        ],
      },
      suitableRoles: {
        'ru': [
          'Data Analyst / аналитик данных',
          'Продуктовый аналитик',
          'Маркетинговый аналитик',
          'BI-аналитик',
        ],
        'en': [
          'Data Analyst',
          'Product Analyst',
          'Marketing Analyst',
          'BI Analyst',
        ],
      },
      criteria: {
        'data_analytics': CriteriaBounds(min: 67, max: 100),
        'product_thinking': CriteriaBounds(min: 30, max: 100),
      },
    ),

    'profile_ux_designer': CareerProfile(
      id: 'profile_ux_designer',
      name: {
        'ru': 'UX/UI-дизайнер / продуктовый дизайнер',
        'en': 'UX/UI Designer / Product Designer',
      },
      description: {
        'ru': 'Вы сочетаете интерес к визуалу и пользовательскому опыту с пониманием задач продукта. Вам важно, чтобы цифровые сервисы были не только красивыми, но и понятными, удобными и логичными.',
        'en': 'You combine interest in visuals and user experience with understanding of product tasks. It is important to you that digital services are not only beautiful, but also understandable, convenient and logical.',
      },
      characteristics: {
        'ru': [
          'Вы замечаете, где интерфейсы неудобны или перегружены, и мысленно предлагаете варианты лучше.',
          'Вам интересно продумывать путь пользователя: что он увидит, куда нажмёт, что почувствует.',
          'Вы цените визуальную структуру, иерархию, аккуратность и цельность интерфейса.',
          'Готовы много тестировать и переделывать, чтобы найти по-настоящему удобное решение.',
          'Вам нравится сочетать креативность с логикой и здравым смыслом.',
        ],
        'en': [
          'You notice where interfaces are inconvenient or overloaded, and mentally suggest better options.',
          'You are interested in thinking through the user journey: what they will see, where they will click, what they will feel.',
          'You value visual structure, hierarchy, neatness and interface integrity.',
          'You are ready to test and redo a lot to find a truly convenient solution.',
          'You enjoy combining creativity with logic and common sense.',
        ],
      },
      recommendations: {
        'ru': [
          'Освойте профессиональный инструмент для интерфейсного дизайна (например, Figma).',
          'Начните собирать портфолио: переделка существующих интерфейсов, учебные кейсы, концепты.',
          'Изучите основы UX-исследований: интервью, опросы, юзабилити-тесты, карты пути пользователя.',
          'Разберитесь в базовых принципах визуального дизайна: композиция, типографика, цвет, сетки.',
          'Практикуйтесь объяснять свои решения через «так пользователю проще/быстрее/понятнее».',
        ],
        'en': [
          'Master a professional interface design tool (e.g., Figma).',
          'Start building a portfolio: redesigning existing interfaces, educational cases, concepts.',
          'Learn the basics of UX research: interviews, surveys, usability tests, user journey maps.',
          'Understand the basic principles of visual design: composition, typography, color, grids.',
          'Practice explaining your decisions through "this makes it easier/faster/clearer for the user".',
        ],
      },
      suitableRoles: {
        'ru': [
          'UX/UI-дизайнер',
          'Продуктовый дизайнер',
          'Дизайнер мобильных и веб-интерфейсов',
          'UX-исследователь',
        ],
        'en': [
          'UX/UI Designer',
          'Product Designer',
          'Mobile and Web Interface Designer',
          'UX Researcher',
        ],
      },
      criteria: {
        'design_ux': CriteriaBounds(min: 67, max: 100),
        'product_thinking': CriteriaBounds(min: 30, max: 100),
      },
    ),

    'profile_content_marketer': CareerProfile(
      id: 'profile_content_marketer',
      name: {
        'ru': 'Контент-мейкер / SMM / digital-маркетолог',
        'en': 'Content Creator / SMM / Digital Marketer',
      },
      description: {
        'ru': 'Вы ярко выраженно интересуетесь тем, как бренды и проекты общаются с аудиторией: через тексты, визуал, соцсети и кампании. Вам нравится создавать истории, вовлекать людей и видеть живой отклик на свою работу.',
        'en': 'You are clearly interested in how brands and projects communicate with audiences: through texts, visuals, social media and campaigns. You enjoy creating stories, engaging people and seeing live response to your work.',
      },
      characteristics: {
        'ru': [
          'Вам легко придумывать идеи для постов, рубрик, кампаний, акций.',
          'Вы обращаете внимание на формулировки, тон общения и визуальный стиль брендов.',
          'Вам интересно, почему одни публикации «выстреливают», а другие остаются незамеченными.',
          'Вы любите играть с форматами: тексты, видео, сторис, рассылки, креативные механики.',
          'Вам важно видеть реакцию людей и чувствовать, что вы на них влияете.',
        ],
        'en': [
          'It is easy for you to come up with ideas for posts, categories, campaigns, promotions.',
          'You pay attention to wording, tone of communication and visual style of brands.',
          'You are interested in why some posts "go viral" while others go unnoticed.',
          'You like to play with formats: texts, videos, stories, newsletters, creative mechanics.',
          'It is important for you to see people\'s reactions and feel that you influence them.',
        ],
      },
      recommendations: {
        'ru': [
          'Начните или продолжайте вести личный/тематический блог, чтобы набивать руку и собирать портфолио.',
          'Изучите основы воронок и позиционирования: зачем бренды делают тот или иной контент.',
          'Освойте базовые инструменты: рекламные кабинеты, аналитику соцсетей, UTM-метки.',
          'Наблюдайте за удачными кейсами и анализируйте: как построено сообщение, кому оно адресовано.',
          'Планируйте контент не только как «классную идею», но и как часть общей стратегии продвижения.',
        ],
        'en': [
          'Start or continue running a personal/themed blog to practice and build a portfolio.',
          'Learn the basics of funnels and positioning: why brands create certain content.',
          'Master basic tools: ad accounts, social media analytics, UTM tags.',
          'Watch successful cases and analyze: how the message is built, who it is addressed to.',
          'Plan content not just as a "cool idea", but as part of an overall promotion strategy.',
        ],
      },
      suitableRoles: {
        'ru': [
          'SMM-специалист',
          'Контент-мейкер / копирайтер',
          'Digital-маркетолог',
          'Контент-стратег',
        ],
        'en': [
          'SMM Specialist',
          'Content Creator / Copywriter',
          'Digital Marketer',
          'Content Strategist',
        ],
      },
      criteria: {
        'content_marketing': CriteriaBounds(min: 67, max: 100),
      },
    ),

    'profile_project_manager': CareerProfile(
      id: 'profile_project_manager',
      name: {
        'ru': 'Проектный менеджер / координатор команд',
        'en': 'Project Manager / Team Coordinator',
      },
      description: {
        'ru': 'У вас сильная склонность к организации процессов и людей. Вам важно, чтобы работа шла структурно, задачи были понятны, а команда двигалась к результату без хаоса.',
        'en': 'You have a strong inclination for organizing processes and people. It is important to you that work proceeds structurally, tasks are clear, and the team moves towards results without chaos.',
      },
      characteristics: {
        'ru': [
          'Вы часто естественным образом берёте на себя координацию в групповых задачах.',
          'Следите за сроками, договорённостями и тем, чтобы все были в курсе, что происходит.',
          'Любите, когда процесс понятен и прозрачен: кто за что отвечает, какие этапы.',
          'Готовы много общаться, уточнять, согласовывать и разруливать небольшие конфликты.',
          'Вам приятно видеть, как благодаря вам проект движется вперёд без лишней суеты.',
        ],
        'en': [
          'You often naturally take on coordination in group tasks.',
          'You track deadlines, agreements and make sure everyone knows what is happening.',
          'You like when the process is clear and transparent: who is responsible for what, what stages.',
          'Ready to communicate a lot, clarify, coordinate and resolve small conflicts.',
          'You enjoy seeing the project move forward thanks to you without unnecessary fuss.',
        ],
      },
      recommendations: {
        'ru': [
          'Изучите базовые подходы к управлению проектами: Agile, Scrum, Kanban, классический PM.',
          'Потренируйтесь вести небольшие учебные или волонтёрские проекты.',
          'Развивайте навыки обратной связи и экологичной коммуникации.',
          'Освойте инструменты управления задачами (Jira, Trello, Notion).',
          'Учитесь балансировать между интересами команды, бизнеса и пользователей.',
        ],
        'en': [
          'Learn basic project management approaches: Agile, Scrum, Kanban, classical PM.',
          'Practice leading small educational or volunteer projects.',
          'Develop feedback and healthy communication skills.',
          'Master task management tools (Jira, Trello, Notion).',
          'Learn to balance between team, business and user interests.',
        ],
      },
      suitableRoles: {
        'ru': [
          'Project Manager / проджект-менеджер',
          'Координатор digital-проектов',
          'Scrum-мастер',
          'Account-менеджер в digital-агентстве',
        ],
        'en': [
          'Project Manager',
          'Digital Project Coordinator',
          'Scrum Master',
          'Account Manager in digital agency',
        ],
      },
      criteria: {
        'management_communication': CriteriaBounds(min: 67, max: 100),
        'product_thinking': CriteriaBounds(min: 20, max: 100),
      },
    ),

    'profile_developer': CareerProfile(
      id: 'profile_developer',
      name: {
        'ru': 'Разработчик / технический специалист',
        'en': 'Developer / Technical Specialist',
      },
      description: {
        'ru': 'Вы явно тяготеете к технической стороне digital. Вам интересно разбираться, как именно всё работает внутри: код, архитектура, настройки, интеграции. Вы готовы долго и сосредоточенно решать сложные задачи.',
        'en': 'You clearly gravitate towards the technical side of digital. You are interested in understanding how everything works inside: code, architecture, settings, integrations. You are ready to solve complex problems for a long time and with concentration.',
      },
      characteristics: {
        'ru': [
          'Вам нравится логика, структурность и предсказуемость технических систем.',
          'Вы готовы тратить время на то, чтобы «докопаться до сути» и найти причину проблемы.',
          'Получаете удовлетворение от того, что что-то наконец заработало стабильно.',
          'Вас не пугает объём информации — вы готовы учиться новым технологиям.',
          'Вам комфортно значительную часть времени проводить за фокусной, индивидуальной работой.',
        ],
        'en': [
          'You like the logic, structure and predictability of technical systems.',
          'You are willing to spend time "getting to the bottom" and finding the cause of the problem.',
          'You get satisfaction from something finally working stably.',
          'You are not afraid of the amount of information - you are ready to learn new technologies.',
          'You are comfortable spending a significant part of your time on focused, individual work.',
        ],
      },
      recommendations: {
        'ru': [
          'Определите направление: frontend, backend, мобильная разработка, DevOps, тестирование.',
          'Составьте план обучения: базовый язык, фреймворк, инструменты, pet-проекты.',
          'Участвуйте в небольших совместных проектах для освоения командной разработки.',
          'Читайте код других разработчиков и учитесь у open-source проектов.',
          'Параллельно развивайте навыки коммуникации — это помогает техническим специалистам расти.',
        ],
        'en': [
          'Determine your direction: frontend, backend, mobile development, DevOps, testing.',
          'Create a learning plan: basic language, framework, tools, pet projects.',
          'Participate in small joint projects to master team development.',
          'Read other developers\' code and learn from open-source projects.',
          'In parallel, develop communication skills - it helps technical specialists grow.',
        ],
      },
      suitableRoles: {
        'ru': [
          'Frontend / backend / full-stack разработчик',
          'Мобильный разработчик',
          'Инженер по интеграциям или автоматизации',
          'Инженер по тестированию (QA)',
        ],
        'en': [
          'Frontend / backend / full-stack developer',
          'Mobile developer',
          'Integration or automation engineer',
          'QA Engineer',
        ],
      },
      criteria: {
        'tech_development': CriteriaBounds(min: 67, max: 100),
      },
    ),

    'profile_mixed': CareerProfile(
      id: 'profile_mixed',
      name: {
        'ru': 'Смешанный профиль',
        'en': 'Mixed Profile',
      },
      description: {
        'ru': 'У вас нет одной ярко выраженной доминирующей области — зато есть сразу несколько сильных направлений. Это нормально для людей, которым подходят гибридные роли: вы можете соединять в себе продуктовый взгляд, креатив, управление и/или дизайн.',
        'en': 'You don\'t have one clearly dominant area - but you have several strong directions at once. This is normal for people who are suited for hybrid roles: you can combine product vision, creativity, management and/or design.',
      },
      characteristics: {
        'ru': [
          'Вам сложно выбрать одну «единственную» профессию — интересны сразу несколько направлений.',
          'Вы любите видеть картину целиком и участвовать в разных частях процесса.',
          'Легко переключаетесь между задачами: придумать идею, продумать UX, согласовать с командой.',
          'Часто выступаете «мостиком» между разными специалистами.',
          'Вам важно ощущать разнообразие задач и возможность развиваться в нескольких плоскостях.',
        ],
        'en': [
          'It is difficult for you to choose one "single" profession - several directions are interesting at once.',
          'You like to see the whole picture and participate in different parts of the process.',
          'You easily switch between tasks: come up with an idea, think through UX, coordinate with the team.',
          'You often act as a "bridge" between different specialists.',
          'It is important for you to feel the variety of tasks and the opportunity to develop in several planes.',
        ],
      },
      recommendations: {
        'ru': [
          'Попробуйте разные роли в формате учебных, стажёрских или волонтёрских проектов.',
          'Отслеживайте, какие конкретно задачи дают вам больше всего энергии и удовлетворения.',
          'Рассмотрите гибридные роли в небольших командах.',
          'Учитесь проговаривать свои сильные стороны так, чтобы показать ценность «широкого профиля».',
          'Важно не распыляться: выберите 1–2 направления в качестве опорных.',
        ],
        'en': [
          'Try different roles in educational, internship or volunteer projects.',
          'Track which specific tasks give you the most energy and satisfaction.',
          'Consider hybrid roles in small teams.',
          'Learn to articulate your strengths to show the value of a "broad profile".',
          'It is important not to scatter: choose 1-2 directions as your core.',
        ],
      },
      suitableRoles: {
        'ru': [
          'Гибридные позиции (продакт + аналитика, продакт + маркетинг)',
          'Роли в небольших командах и стартапах',
          'Кросс-функциональные роли в проектных командах',
        ],
        'en': [
          'Hybrid positions (product + analytics, product + marketing)',
          'Roles in small teams and startups',
          'Cross-functional roles in project teams',
        ],
      },
      criteria: {
        'product_thinking': CriteriaBounds(min: 40, max: 100),
        'management_communication': CriteriaBounds(min: 40, max: 100),
        'design_ux': CriteriaBounds(min: 40, max: 100),
        'content_marketing': CriteriaBounds(min: 40, max: 100),
      },
    ),
  };

  /// Определить профиль на основе процентов по шкалам
  /// Возвращает ID профиля
  static String determineProfile(Map<String, double> percentages) {
    // Находим доминирующую шкалу (с максимальным процентом)
    String? dominantScale;
    double maxPercentage = 0;

    for (final entry in percentages.entries) {
      if (entry.value > maxPercentage) {
        maxPercentage = entry.value;
        dominantScale = entry.key;
      }
    }

    // Маппинг шкалы на профиль
    final scaleToProfile = {
      'product_thinking': 'profile_product_manager',
      'data_analytics': 'profile_data_analyst',
      'design_ux': 'profile_ux_designer',
      'content_marketing': 'profile_content_marketer',
      'management_communication': 'profile_project_manager',
      'tech_development': 'profile_developer',
    };

    // Проверяем, есть ли явный лидер (разница с вторым местом >= 10%)
    final sortedPercentages = percentages.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedPercentages.length >= 2) {
      final first = sortedPercentages[0].value;
      final second = sortedPercentages[1].value;

      // Если разница меньше 10% - смешанный профиль
      if (first - second < 10) {
        return 'profile_mixed';
      }
    }

    // Возвращаем профиль по доминирующей шкале
    if (dominantScale != null && scaleToProfile.containsKey(dominantScale)) {
      return scaleToProfile[dominantScale]!;
    }

    return 'profile_mixed';
  }

  /// Получить профиль по ID
  static CareerProfile? getProfile(String profileId) {
    return profiles[profileId];
  }
}

/// Модель профиля карьеры
class CareerProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, List<String>> characteristics;
  final Map<String, List<String>> recommendations;
  final Map<String, List<String>> suitableRoles;
  final Map<String, CriteriaBounds> criteria;

  const CareerProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.characteristics,
    required this.recommendations,
    required this.suitableRoles,
    required this.criteria,
  });

  String getName(String languageCode) => name[languageCode] ?? name['ru'] ?? '';
  String getDescription(String languageCode) => description[languageCode] ?? description['ru'] ?? '';
  List<String> getCharacteristics(String languageCode) => characteristics[languageCode] ?? characteristics['ru'] ?? [];
  List<String> getRecommendations(String languageCode) => recommendations[languageCode] ?? recommendations['ru'] ?? [];
  List<String> getSuitableRoles(String languageCode) => suitableRoles[languageCode] ?? suitableRoles['ru'] ?? [];
}

/// Границы критериев для профиля
class CriteriaBounds {
  final double min;
  final double max;

  const CriteriaBounds({required this.min, required this.max});
}
