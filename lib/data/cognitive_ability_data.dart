import '../models/test_model.dart';

/// Cognitive Ability Test data with 60 questions
/// 3 sections: Logical Reasoning (20), Numerical Ability (20), Verbal Ability (20)
/// Each question has 4 multiple choice options with one correct answer
class CognitiveAbilityData {
  static TestModel getCognitiveAbilityTest() {
    return TestModel(
      id: 'cognitive_ability_v1',
      title: {
        'ru': 'Cognitive Ability Test',
        'en': 'Cognitive Ability Test',
      },
      description: {
        'ru': 'Тест когнитивных способностей оценивает ваши умственные способности в трёх ключевых областях: логическое мышление, числовые способности и вербальный интеллект. Результаты помогут понять ваши сильные стороны и потенциал в различных профессиях.',
        'en': 'The Cognitive Ability Test assesses your mental capabilities in three key areas: logical reasoning, numerical ability, and verbal intelligence. Results will help you understand your strengths and potential in various careers.',
      },
      category: {
        'ru': '💼 Карьера',
        'en': '💼 Career',
      },
      categoryId: 'career',
      questions: _questions,
      estimatedTime: 30,
      type: TestType.multiFactor,
      factorIds: ['logical_reasoning', 'numerical_ability', 'verbal_ability'],
      disclaimer: {
        'ru': 'Этот тест оценивает когнитивные способности на основе правильных ответов. Время ограничено - 30 минут на весь тест. Результаты не являются окончательной оценкой интеллекта и могут варьироваться в зависимости от условий прохождения.',
        'en': 'This test evaluates cognitive abilities based on correct answers. Time is limited - 30 minutes for the entire test. Results are not a definitive measure of intelligence and may vary depending on testing conditions.',
      },
    );
  }

  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'logical_reasoning': {
        'ru': 'Логическое мышление',
        'en': 'Logical Reasoning',
      },
      'numerical_ability': {
        'ru': 'Числовые способности',
        'en': 'Numerical Ability',
      },
      'verbal_ability': {
        'ru': 'Вербальные способности',
        'en': 'Verbal Ability',
      },
    };
  }

  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    // NaN protection
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    switch (factorId) {
      case 'logical_reasoning':
        if (percentage < 40) {
          return {
            'ru': 'Низкий уровень логического мышления. Рекомендуется практиковать решение логических задач, головоломок и изучать основы критического мышления.',
            'en': 'Low level of logical reasoning. It\'s recommended to practice solving logic problems, puzzles and study critical thinking basics.',
          };
        } else if (percentage < 70) {
          return {
            'ru': 'Средний уровень логического мышления. Вы справляетесь с большинством логических задач, но сложные абстрактные проблемы могут вызывать трудности.',
            'en': 'Average level of logical reasoning. You handle most logical tasks well, but complex abstract problems may be challenging.',
          };
        } else {
          return {
            'ru': 'Высокий уровень логического мышления. Вы отлично находите паттерны, делаете выводы и решаете сложные абстрактные проблемы.',
            'en': 'High level of logical reasoning. You excel at finding patterns, making inferences and solving complex abstract problems.',
          };
        }

      case 'numerical_ability':
        if (percentage < 40) {
          return {
            'ru': 'Низкий уровень числовых способностей. Рекомендуется практиковать базовую математику, работу с процентами и интерпретацию данных.',
            'en': 'Low level of numerical ability. It\'s recommended to practice basic math, percentages and data interpretation.',
          };
        } else if (percentage < 70) {
          return {
            'ru': 'Средний уровень числовых способностей. Вы хорошо справляетесь с базовыми вычислениями, но сложные математические задачи требуют усилий.',
            'en': 'Average level of numerical ability. You handle basic calculations well, but complex mathematical problems require effort.',
          };
        } else {
          return {
            'ru': 'Высокий уровень числовых способностей. Вы легко работаете с числами, быстро вычисляете и хорошо понимаете статистику.',
            'en': 'High level of numerical ability. You work easily with numbers, calculate quickly and understand statistics well.',
          };
        }

      case 'verbal_ability':
        if (percentage < 40) {
          return {
            'ru': 'Низкий уровень вербальных способностей. Рекомендуется больше читать, расширять словарный запас и практиковать письменную речь.',
            'en': 'Low level of verbal ability. It\'s recommended to read more, expand vocabulary and practice written communication.',
          };
        } else if (percentage < 70) {
          return {
            'ru': 'Средний уровень вербальных способностей. Вы хорошо понимаете тексты и владеете языком на достаточном уровне.',
            'en': 'Average level of verbal ability. You understand texts well and have sufficient language skills.',
          };
        } else {
          return {
            'ru': 'Высокий уровень вербальных способностей. У вас богатый словарный запас, отличное понимание языка и сильные навыки аргументации.',
            'en': 'High level of verbal ability. You have a rich vocabulary, excellent language comprehension and strong argumentation skills.',
          };
        }

      default:
        return {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation not available',
        };
    }
  }

  // Questions list - for correct answer tests, we use a special format
  // Score 1 = correct, Score 0 = incorrect
  static final List<QuestionModel> _questions = [
    // SECTION 1: LOGICAL REASONING (Questions 1-20)
    QuestionModel(
      id: 'q1',
      text: {
        'ru': 'Продолжите последовательность: 2, 4, 8, 16, ?',
        'en': 'Continue the sequence: 2, 4, 8, 16, ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '20', 'en': '20'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '24', 'en': '24'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '32', 'en': '32'}, score: 1), // Correct
        AnswerModel(id: 'd', text: {'ru': '64', 'en': '64'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q2',
      text: {
        'ru': 'Если все A — это B, и все B — это C, то:',
        'en': 'If all A are B, and all B are C, then:',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Все A — это C', 'en': 'All A are C'}, score: 1), // Correct
        AnswerModel(id: 'b', text: {'ru': 'Все C — это A', 'en': 'All C are A'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Некоторые A — это C', 'en': 'Some A are C'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Невозможно определить', 'en': 'Cannot determine'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q3',
      text: {
        'ru': 'Найдите лишнее: Собака, Кошка, Корова, Стул',
        'en': 'Find the odd one out: Dog, Cat, Cow, Chair',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Собака', 'en': 'Dog'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Кошка', 'en': 'Cat'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Корова', 'en': 'Cow'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Стул', 'en': 'Chair'}, score: 1), // Correct
      ],
    ),
    QuestionModel(
      id: 'q4',
      text: {
        'ru': 'Продолжите: Z, Y, X, W, ?',
        'en': 'Continue: Z, Y, X, W, ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'U', 'en': 'U'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'V', 'en': 'V'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'T', 'en': 'T'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'S', 'en': 'S'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q5',
      text: {
        'ru': 'Если книга стоит 120 рублей, и цена снизилась на 25%, сколько она стоит?',
        'en': 'If a book costs 120 rubles and the price decreased by 25%, what is the new price?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '85 рублей', 'en': '85 rubles'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '90 рублей', 'en': '90 rubles'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '95 рублей', 'en': '95 rubles'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '100 рублей', 'en': '100 rubles'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q6',
      text: {
        'ru': 'Аналогия: Рука относится к Перчатке, как Нога относится к ?',
        'en': 'Analogy: Hand is to Glove as Foot is to ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Туфля', 'en': 'Shoe'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Носок', 'en': 'Sock'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Ботинок', 'en': 'Boot'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Обувь', 'en': 'Footwear'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q7',
      text: {
        'ru': 'Продолжите последовательность: 1, 1, 2, 3, 5, 8, ?',
        'en': 'Continue the sequence: 1, 1, 2, 3, 5, 8, ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '11', 'en': '11'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '13', 'en': '13'}, score: 1), // Correct (Fibonacci)
        AnswerModel(id: 'c', text: {'ru': '15', 'en': '15'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '16', 'en': '16'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q8',
      text: {
        'ru': 'Какое из утверждений логически эквивалентно: "Если идёт дождь, то улица мокрая"?',
        'en': 'Which statement is logically equivalent to: "If it rains, then the street is wet"?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Если улица мокрая, то идёт дождь', 'en': 'If the street is wet, then it rains'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Если улица не мокрая, то не идёт дождь', 'en': 'If the street is not wet, then it doesn\'t rain'}, score: 1), // Correct (contraposition)
        AnswerModel(id: 'c', text: {'ru': 'Если не идёт дождь, то улица не мокрая', 'en': 'If it doesn\'t rain, then the street is not wet'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Дождь всегда делает улицу мокрой', 'en': 'Rain always makes the street wet'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q9',
      text: {
        'ru': 'Продолжите: O, T, T, F, F, S, S, ?',
        'en': 'Continue: O, T, T, F, F, S, S, ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'N', 'en': 'N'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'E', 'en': 'E'}, score: 1), // Correct (One, Two, Three, Four, Five, Six, Seven, Eight)
        AnswerModel(id: 'c', text: {'ru': 'T', 'en': 'T'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'S', 'en': 'S'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q10',
      text: {
        'ru': 'В коробке 12 красных и 8 синих шаров. Какова вероятность вытащить красный шар?',
        'en': 'A box contains 12 red and 8 blue balls. What is the probability of drawing a red ball?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '0.4', 'en': '0.4'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '0.5', 'en': '0.5'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '0.6', 'en': '0.6'}, score: 1), // Correct (12/20 = 0.6)
        AnswerModel(id: 'd', text: {'ru': '0.8', 'en': '0.8'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q11',
      text: {
        'ru': 'Какая фигура продолжает последовательность: ○ △ ○ △ ○ ?',
        'en': 'Which shape continues the sequence: ○ △ ○ △ ○ ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '○', 'en': '○'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '△', 'en': '△'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '□', 'en': '□'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '◇', 'en': '◇'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q12',
      text: {
        'ru': 'Если код CAT = 3120, то DOG = ?',
        'en': 'If the code for CAT = 3120, then DOG = ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '4157', 'en': '4157'}, score: 1), // Correct (D=4, O=15, G=7)
        AnswerModel(id: 'b', text: {'ru': '3146', 'en': '3146'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '5168', 'en': '5168'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '4158', 'en': '4158'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q13',
      text: {
        'ru': 'Что всегда следует за "Причиной"?',
        'en': 'What always follows a "Cause"?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Проблема', 'en': 'Problem'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Следствие', 'en': 'Effect'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Решение', 'en': 'Solution'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Условие', 'en': 'Condition'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q14',
      text: {
        'ru': 'Продолжите: 100, 96, 88, 72, ?',
        'en': 'Continue: 100, 96, 88, 72, ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '64', 'en': '64'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '56', 'en': '56'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '40', 'en': '40'}, score: 1), // Correct (-4, -8, -16, -32)
        AnswerModel(id: 'd', text: {'ru': '48', 'en': '48'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q15',
      text: {
        'ru': 'Аналогия: Врач относится к Болезни, как Юрист относится к ?',
        'en': 'Analogy: Doctor is to Disease as Lawyer is to ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Закон', 'en': 'Law'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Судья', 'en': 'Judge'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Спор', 'en': 'Dispute'}, score: 1), // Correct
        AnswerModel(id: 'd', text: {'ru': 'Преступление', 'en': 'Crime'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q16',
      text: {
        'ru': 'Какое число НЕ принадлежит группе: 2, 3, 5, 7, 9, 11',
        'en': 'Which number does NOT belong: 2, 3, 5, 7, 9, 11',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '2', 'en': '2'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '5', 'en': '5'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '9', 'en': '9'}, score: 1), // Correct (not prime)
        AnswerModel(id: 'd', text: {'ru': '11', 'en': '11'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q17',
      text: {
        'ru': 'Если A > B и B > C, то:',
        'en': 'If A > B and B > C, then:',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'A = C', 'en': 'A = C'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'A > C', 'en': 'A > C'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'A < C', 'en': 'A < C'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Невозможно определить', 'en': 'Cannot determine'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q18',
      text: {
        'ru': 'Сколько треугольников в фигуре: большой треугольник, разделённый на 4 малых?',
        'en': 'How many triangles in a figure: large triangle divided into 4 small ones?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '4', 'en': '4'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '5', 'en': '5'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '6', 'en': '6'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '7 или более', 'en': '7 or more'}, score: 1), // Correct (actually 8)
      ],
    ),
    QuestionModel(
      id: 'q19',
      text: {
        'ru': 'Продолжите: AZ, BY, CX, ?',
        'en': 'Continue: AZ, BY, CX, ?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'DW', 'en': 'DW'}, score: 1), // Correct
        AnswerModel(id: 'b', text: {'ru': 'DV', 'en': 'DV'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'EW', 'en': 'EW'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'EV', 'en': 'EV'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q20',
      text: {
        'ru': 'Какое утверждение противоречит: "Все студенты сдали экзамен"?',
        'en': 'Which statement contradicts: "All students passed the exam"?',
      },
      factorId: 'logical_reasoning',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Некоторые студенты не сдали экзамен', 'en': 'Some students did not pass the exam'}, score: 1), // Correct
        AnswerModel(id: 'b', text: {'ru': 'Все студенты не сдали экзамен', 'en': 'All students did not pass the exam'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Ни один студент не сдал экзамен', 'en': 'No student passed the exam'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Большинство студентов сдали экзамен', 'en': 'Most students passed the exam'}, score: 0),
      ],
    ),

    // SECTION 2: NUMERICAL ABILITY (Questions 21-40)
    QuestionModel(
      id: 'q21',
      text: {
        'ru': '24 + 37 = ?',
        'en': '24 + 37 = ?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '59', 'en': '59'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '60', 'en': '60'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '61', 'en': '61'}, score: 1), // Correct
        AnswerModel(id: 'd', text: {'ru': '62', 'en': '62'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q22',
      text: {
        'ru': '15% от 200 = ?',
        'en': '15% of 200 = ?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '25', 'en': '25'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '30', 'en': '30'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '35', 'en': '35'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '40', 'en': '40'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q23',
      text: {
        'ru': 'Если товар стоил 500₽ и подорожал на 20%, сколько он стоит?',
        'en': 'If an item cost 500₽ and increased by 20%, what is the new price?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '520₽', 'en': '520₽'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '600₽', 'en': '600₽'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '620₽', 'en': '620₽'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '700₽', 'en': '700₽'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q24',
      text: {
        'ru': '72 ÷ 8 = ?',
        'en': '72 ÷ 8 = ?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '8', 'en': '8'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '9', 'en': '9'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '10', 'en': '10'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '11', 'en': '11'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q25',
      text: {
        'ru': 'Среднее значение чисел 10, 20, 30, 40 = ?',
        'en': 'The average of 10, 20, 30, 40 = ?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '20', 'en': '20'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '25', 'en': '25'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '30', 'en': '30'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '35', 'en': '35'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q26',
      text: {
        'ru': 'Если 3x + 5 = 20, то x = ?',
        'en': 'If 3x + 5 = 20, then x = ?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '3', 'en': '3'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '4', 'en': '4'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '5', 'en': '5'}, score: 1), // Correct
        AnswerModel(id: 'd', text: {'ru': '6', 'en': '6'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q27',
      text: {
        'ru': 'Какое число на 30% больше, чем 50?',
        'en': 'What number is 30% more than 50?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '60', 'en': '60'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '65', 'en': '65'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '70', 'en': '70'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '80', 'en': '80'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q28',
      text: {
        'ru': 'Товар стоил 1000₽, подешевел на 10%, потом подорожал на 10%. Итоговая цена?',
        'en': 'An item cost 1000₽, decreased by 10%, then increased by 10%. Final price?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '1000₽', 'en': '1000₽'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '990₽', 'en': '990₽'}, score: 1), // Correct (1000 → 900 → 990)
        AnswerModel(id: 'c', text: {'ru': '1010₽', 'en': '1010₽'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '1100₽', 'en': '1100₽'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q29',
      text: {
        'ru': 'Площадь прямоугольника 5×12 = ?',
        'en': 'Area of rectangle 5×12 = ?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '17', 'en': '17'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '34', 'en': '34'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '60', 'en': '60'}, score: 1), // Correct
        AnswerModel(id: 'd', text: {'ru': '65', 'en': '65'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q30',
      text: {
        'ru': 'Если 1 доллар = 90 рублей, сколько рублей в 15 долларах?',
        'en': 'If 1 dollar = 90 rubles, how many rubles in 15 dollars?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '1200', 'en': '1200'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '1300', 'en': '1300'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '1350', 'en': '1350'}, score: 1), // Correct
        AnswerModel(id: 'd', text: {'ru': '1400', 'en': '1400'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q31',
      text: {
        'ru': 'Какое число в 4 раза больше 25?',
        'en': 'What number is 4 times 25?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '75', 'en': '75'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '100', 'en': '100'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '125', 'en': '125'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '150', 'en': '150'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q32',
      text: {
        'ru': 'Компания за год выросла с 50 до 75 сотрудников. На сколько % увеличилась численность?',
        'en': 'A company grew from 50 to 75 employees. What is the percentage increase?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '25%', 'en': '25%'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '33%', 'en': '33%'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '50%', 'en': '50%'}, score: 1), // Correct ((75-50)/50 × 100% = 50%)
        AnswerModel(id: 'd', text: {'ru': '75%', 'en': '75%'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q33',
      text: {
        'ru': 'Если 5 яблок стоят 100₽, сколько стоят 8 яблок?',
        'en': 'If 5 apples cost 100₽, how much do 8 apples cost?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '140₽', 'en': '140₽'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '150₽', 'en': '150₽'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '160₽', 'en': '160₽'}, score: 1), // Correct (20₽ per apple × 8)
        AnswerModel(id: 'd', text: {'ru': '180₽', 'en': '180₽'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q34',
      text: {
        'ru': '0.25 × 0.4 = ?',
        'en': '0.25 × 0.4 = ?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '0.01', 'en': '0.01'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '0.1', 'en': '0.1'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '1.0', 'en': '1.0'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '10', 'en': '10'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q35',
      text: {
        'ru': 'Машина проехала 180 км за 3 часа. Средняя скорость?',
        'en': 'A car traveled 180 km in 3 hours. Average speed?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '50 км/ч', 'en': '50 km/h'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '60 км/ч', 'en': '60 km/h'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': '70 км/ч', 'en': '70 km/h'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': '80 км/ч', 'en': '80 km/h'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q36',
      text: {
        'ru': 'В магазине скидка 30% на товар за 2000₽. Сколько платить?',
        'en': 'A store has 30% off on item priced 2000₽. How much to pay?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '1200₽', 'en': '1200₽'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '1300₽', 'en': '1300₽'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '1400₽', 'en': '1400₽'}, score: 1), // Correct (2000 - 600 = 1400)
        AnswerModel(id: 'd', text: {'ru': '1500₽', 'en': '1500₽'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q37',
      text: {
        'ru': 'Если сегодня вторник, какой день будет через 100 дней?',
        'en': 'If today is Tuesday, what day will it be in 100 days?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Понедельник', 'en': 'Monday'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Вторник', 'en': 'Tuesday'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Среда', 'en': 'Wednesday'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Четверг', 'en': 'Thursday'}, score: 1), // Correct (100 = 14×7 + 2)
      ],
    ),
    QuestionModel(
      id: 'q38',
      text: {
        'ru': 'Соотношение мужчин к женщинам 3:5. Если мужчин 60, сколько женщин?',
        'en': 'The ratio of men to women is 3:5. If there are 60 men, how many women?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '80', 'en': '80'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '90', 'en': '90'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '100', 'en': '100'}, score: 1), // Correct (60/3 × 5 = 100)
        AnswerModel(id: 'd', text: {'ru': '120', 'en': '120'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q39',
      text: {
        'ru': 'Какое число является квадратным корнем из 144?',
        'en': 'What is the square root of 144?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '10', 'en': '10'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '11', 'en': '11'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '12', 'en': '12'}, score: 1), // Correct
        AnswerModel(id: 'd', text: {'ru': '13', 'en': '13'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q40',
      text: {
        'ru': 'Инвестиция 10000₽ выросла до 12000₽. Какова доходность в %?',
        'en': 'An investment of 10000₽ grew to 12000₽. What is the return in %?',
      },
      factorId: 'numerical_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': '10%', 'en': '10%'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': '15%', 'en': '15%'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': '20%', 'en': '20%'}, score: 1), // Correct ((12000-10000)/10000 × 100% = 20%)
        AnswerModel(id: 'd', text: {'ru': '25%', 'en': '25%'}, score: 0),
      ],
    ),

    // SECTION 3: VERBAL ABILITY (Questions 41-60)
    QuestionModel(
      id: 'q41',
      text: {
        'ru': 'Антоним слова "Щедрый":',
        'en': 'Antonym of "Generous":',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Добрый', 'en': 'Kind'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Скупой', 'en': 'Stingy'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Богатый', 'en': 'Rich'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Бедный', 'en': 'Poor'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q42',
      text: {
        'ru': 'Синоним слова "Храбрый":',
        'en': 'Synonym of "Brave":',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Сильный', 'en': 'Strong'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Смелый', 'en': 'Courageous'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Умный', 'en': 'Smart'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Быстрый', 'en': 'Fast'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q43',
      text: {
        'ru': 'Завершите аналогию: Врач : Больница = Учитель : ?',
        'en': 'Complete the analogy: Doctor : Hospital = Teacher : ?',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Ученик', 'en': 'Student'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Школа', 'en': 'School'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Урок', 'en': 'Lesson'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Знания', 'en': 'Knowledge'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q44',
      text: {
        'ru': 'Какое слово лишнее: Роза, Тюльпан, Дуб, Лилия',
        'en': 'Which word is odd: Rose, Tulip, Oak, Lily',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Роза', 'en': 'Rose'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Тюльпан', 'en': 'Tulip'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Дуб', 'en': 'Oak'}, score: 1), // Correct (tree, not flower)
        AnswerModel(id: 'd', text: {'ru': 'Лилия', 'en': 'Lily'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q45',
      text: {
        'ru': '"Эфемерный" означает:',
        'en': '"Ephemeral" means:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Вечный', 'en': 'Eternal'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Кратковременный', 'en': 'Short-lived'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Красивый', 'en': 'Beautiful'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Невидимый', 'en': 'Invisible'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q46',
      text: {
        'ru': 'Если "Оптимист" видит стакан наполовину полным, то "Пессимист" видит его:',
        'en': 'If "Optimist" sees the glass half full, then "Pessimist" sees it:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Полным', 'en': 'Full'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Наполовину пустым', 'en': 'Half empty'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Пустым', 'en': 'Empty'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Непонятным', 'en': 'Unclear'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q47',
      text: {
        'ru': 'Закончите пословицу: "Не всё то золото, что..."',
        'en': 'Complete the proverb: "All that glitters is not..."',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'дорогое', 'en': 'expensive'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'блестит', 'en': 'gold'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'желтое', 'en': 'yellow'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'ценное', 'en': 'valuable'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q48',
      text: {
        'ru': '"Амбивалентный" означает:',
        'en': '"Ambivalent" means:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Однозначный', 'en': 'Unambiguous'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Двойственный', 'en': 'Having mixed feelings'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Неопределённый', 'en': 'Uncertain'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Постоянный', 'en': 'Constant'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q49',
      text: {
        'ru': 'Антоним слова "Искренний":',
        'en': 'Antonym of "Sincere":',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Честный', 'en': 'Honest'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Лицемерный', 'en': 'Hypocritical'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Правдивый', 'en': 'Truthful'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Открытый', 'en': 'Open'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q50',
      text: {
        'ru': 'Какое слово НЕ является синонимом "Умный"?',
        'en': 'Which word is NOT a synonym of "Smart"?',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Интеллигентный', 'en': 'Intelligent'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Сообразительный', 'en': 'Quick-witted'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Образованный', 'en': 'Educated'}, score: 1), // Correct (educated ≠ smart)
        AnswerModel(id: 'd', text: {'ru': 'Смышлёный', 'en': 'Clever'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q51',
      text: {
        'ru': 'Дополните: Книга : Страница = Дом : ?',
        'en': 'Complete: Book : Page = House : ?',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Стена', 'en': 'Wall'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Комната', 'en': 'Room'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Крыша', 'en': 'Roof'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Дверь', 'en': 'Door'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q52',
      text: {
        'ru': '"Прагматичный" человек:',
        'en': 'A "Pragmatic" person is:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Мечтательный', 'en': 'Dreamy'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Практичный', 'en': 'Practical'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Идеалистичный', 'en': 'Idealistic'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Романтичный', 'en': 'Romantic'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q53',
      text: {
        'ru': 'Выберите правильное написание:',
        'en': 'Choose the correct spelling:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Агентство', 'en': 'Necessary'}, score: 1), // Correct
        AnswerModel(id: 'b', text: {'ru': 'Агенство', 'en': 'Neccessary'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Агенцтво', 'en': 'Necesary'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Агентсво', 'en': 'Neccesary'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q54',
      text: {
        'ru': '"Альтруизм" — это:',
        'en': '"Altruism" is:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Эгоизм', 'en': 'Selfishness'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Бескорыстная забота о других', 'en': 'Selfless concern for others'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Самолюбие', 'en': 'Self-love'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Безразличие', 'en': 'Indifference'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q55',
      text: {
        'ru': 'Какое слово имеет ДРУГОЕ значение: Смотреть, Глядеть, Созерцать, Слушать',
        'en': 'Which word has a DIFFERENT meaning: Look, Watch, Observe, Listen',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Смотреть', 'en': 'Look'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Глядеть', 'en': 'Watch'}, score: 0),
        AnswerModel(id: 'c', text: {'ru': 'Созерцать', 'en': 'Observe'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Слушать', 'en': 'Listen'}, score: 1), // Correct (audio vs visual)
      ],
    ),
    QuestionModel(
      id: 'q56',
      text: {
        'ru': 'Закончите фразу: "Лучше синица в руках, чем..."',
        'en': 'Complete: "A bird in the hand is worth..."',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'орёл в небе', 'en': 'an eagle in the sky'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'журавль в небе', 'en': 'two in the bush'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'голубь на крыше', 'en': 'a dove on the roof'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'ворон на дереве', 'en': 'a crow in the tree'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q57',
      text: {
        'ru': '"Инновация" означает:',
        'en': '"Innovation" means:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Традиция', 'en': 'Tradition'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Нововведение', 'en': 'New introduction'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Консерватизм', 'en': 'Conservatism'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Повторение', 'en': 'Repetition'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q58',
      text: {
        'ru': 'Антоним слова "Конкретный":',
        'en': 'Antonym of "Concrete":',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Точный', 'en': 'Precise'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Абстрактный', 'en': 'Abstract'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Ясный', 'en': 'Clear'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Определённый', 'en': 'Definite'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q59',
      text: {
        'ru': '"Компромисс" — это:',
        'en': '"Compromise" is:',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Конфликт', 'en': 'Conflict'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Взаимная уступка', 'en': 'Mutual concession'}, score: 1), // Correct
        AnswerModel(id: 'c', text: {'ru': 'Победа', 'en': 'Victory'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Поражение', 'en': 'Defeat'}, score: 0),
      ],
    ),
    QuestionModel(
      id: 'q60',
      text: {
        'ru': 'Какое слово продолжает ряд: Январь, Март, Май, ?',
        'en': 'What word continues: January, March, May, ?',
      },
      factorId: 'verbal_ability',
      answers: [
        AnswerModel(id: 'a', text: {'ru': 'Июнь', 'en': 'June'}, score: 0),
        AnswerModel(id: 'b', text: {'ru': 'Июль', 'en': 'July'}, score: 1), // Correct (odd months)
        AnswerModel(id: 'c', text: {'ru': 'Август', 'en': 'August'}, score: 0),
        AnswerModel(id: 'd', text: {'ru': 'Сентябрь', 'en': 'September'}, score: 0),
      ],
    ),
  ];
}