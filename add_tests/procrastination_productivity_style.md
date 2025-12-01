{
  "test_id": "procrastination_productivity_style_v1",
  "title": {
    "ru": "Прокрастинация и стиль продуктивности",
    "en": "Procrastination and Productivity Style"
  },
  "description": {
    "ru": "Тест помогает понять, почему вы откладываете важные дела, и какой стиль работы лучше поддерживает вашу продуктивность. Мы разбираем эмоциональные причины (страх неудачи, скука, избегание неприятных задач), организационные факторы (хаос в делах, отсутствие структуры), перфекционизм и уровень ресурса.\n\nРезультат показывает, какие механизмы прокрастинации у вас ведущие и какие настройки рабочего дня, планирования и заботы о себе помогут легче переходить от «я знаю, что хочу» к «я действительно делаю». Тест не является клинической диагностикой, а инструментом саморефлексии и планирования изменений.",
    "en": "This questionnaire helps you understand why you put off important tasks and which work style best supports your productivity. It covers emotional reasons (fear of failure, boredom, avoiding unpleasant tasks), organizational factors (chaos in tasks, lack of structure), perfectionism, and your energy level.\n\nThe result highlights your main procrastination drivers and suggests workday, planning and self-care adjustments that make it easier to move from “I know what I want” to “I actually do it”. This is not a clinical diagnostic tool but a self-reflection and change-planning instrument."
  },
  "category": "💼 Карьера / 🌟 Эмоциональное состояние",
  "version": "1.0",
  "author": "4Marketing / Nikita & ChatGPT (draft)",
  "languages": [
    "ru",
    "en"
  ],
  "default_language": "ru",
  "question_count": 24,
  "estimated_time_minutes": 8,
  "target_audience": {
    "ru": "Взрослые 18–55 лет, сталкивающиеся с откладыванием задач в учёбе, работе или личных проектах.",
    "en": "Adults 18–55 who struggle with putting off tasks at work, in studies or personal projects."
  },
  "context_of_use": {
    "ru": [
      "карьерные и productivity-треки в приложении",
      "работа с привычками, самоменеджментом и цифровым балансом",
      "психообразование о прокрастинации и эмоциональной регуляции"
    ],
    "en": [
      "career and productivity tracks in apps",
      "habit building, self-management and digital balance programs",
      "psychoeducation about procrastination and emotion regulation"
    ]
  },
  "theoretical_basis": [
    {
      "ru": "Исследования прокрастинации в академической и рабочей среде (P. Steel, F. Sirois и др.).",
      "en": "Research on procrastination in academic and work settings (P. Steel, F. Sirois, etc.)."
    },
    {
      "ru": "Теории саморегуляции и отсроченного вознаграждения (Temporal Motivation Theory).",
      "en": "Self-regulation and delay of gratification theories (Temporal Motivation Theory)."
    },
    {
      "ru": "Модели эмоциональной регуляции и перфекционизма в когнитивно-поведенческом подходе.",
      "en": "Emotion regulation and perfectionism models in cognitive-behavioral approaches."
    },
    {
      "ru": "Подходы к управлению энергией и ресурсом (баланс нагрузки и восстановления).",
      "en": "Energy and resource management approaches (load–recovery balance)."
    }
  ],
  "scales": {
    "emotional_procrastination": {
      "name": {
        "ru": "Эмоциональная прокрастинация",
        "en": "Emotional procrastination"
      },
      "description": {
        "ru": "Откладывание дел из-за тревоги, страха неудачи, скуки и избегания неприятных эмоций.",
        "en": "Putting off tasks because of anxiety, fear of failure, boredom or avoiding unpleasant emotions."
      }
    },
    "organizational_procrastination": {
      "name": {
        "ru": "Организационная прокрастинация",
        "en": "Organizational procrastination"
      },
      "description": {
        "ru": "Откладывание дел из-за хаоса в задачах, отсутствия структуры, планирования и чётких шагов.",
        "en": "Delaying work due to task chaos, lack of structure, planning and clear steps."
      }
    },
    "perfectionistic_procrastination": {
      "name": {
        "ru": "Перфекционистская прокрастинация",
        "en": "Perfectionistic procrastination"
      },
      "description": {
        "ru": "Откладывание старта или завершения задач из-за завышенных стандартов и страха несовершенства.",
        "en": "Postponing start or completion of tasks because of high standards and fear of imperfection."
      }
    },
    "energy_resource": {
      "name": {
        "ru": "Энергия и ресурс",
        "en": "Energy and resource"
      },
      "description": {
        "ru": "Влияние уровня энергии, усталости и восстановления на способность делать дела вовремя.",
        "en": "Impact of energy level, fatigue and recovery on doing things on time."
      }
    }
  },
  "response_types": {
    "frequency": {
      "description": {
        "ru": "Шкала частоты от «никогда» до «всегда».",
        "en": "Frequency scale from 'never' to 'always'."
      },
      "options": {
        "ru": [
          "Никогда",
          "Редко",
          "Иногда",
          "Часто",
          "Всегда"
        ],
        "en": [
          "Never",
          "Rarely",
          "Sometimes",
          "Often",
          "Always"
        ]
      },
      "scores": [
        0,
        1,
        2,
        3,
        4
      ]
    }
  },
  "questions": [
    {
      "id": 1,
      "text": {
        "ru": "Я откладываю важные задачи, если они вызывают у меня тревогу или дискомфорт.",
        "en": "I postpone important tasks when they make me feel anxious or uncomfortable."
      },
      "scale": "emotional_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 2,
      "text": {
        "ru": "Если я в плохом настроении, мне сложно даже начать с простых дел.",
        "en": "When I’m in a bad mood, it is hard for me to start even simple tasks."
      },
      "scale": "emotional_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 3,
      "text": {
        "ru": "Даже если боюсь не справиться, я обычно всё равно берусь за задачу довольно быстро.",
        "en": "Even if I’m afraid I might fail, I usually still start the task fairly quickly."
      },
      "scale": "emotional_procrastination",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 4,
      "text": {
        "ru": "Я тяну с началом дела, пока не почувствую «правильное» вдохновение или настроение.",
        "en": "I delay starting tasks until I feel the “right” inspiration or mood."
      },
      "scale": "emotional_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 5,
      "text": {
        "ru": "Я часто откладываю задачи, потому что не до конца понимаю, с чего начать.",
        "en": "I often put tasks off because I don’t quite understand where to start."
      },
      "scale": "organizational_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 6,
      "text": {
        "ru": "Мой список дел обычно чётко структурирован и помогает двигаться вперёд без откладывания.",
        "en": "My to-do list is usually well structured and helps me move forward without much procrastination."
      },
      "scale": "organizational_procrastination",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 7,
      "text": {
        "ru": "Я часто перепрыгиваю между задачами и в итоге мало что продвигаю достаточно далеко.",
        "en": "I often jump between tasks and end up not moving many of them forward enough."
      },
      "scale": "organizational_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 8,
      "text": {
        "ru": "Большие задачи я разбиваю на маленькие шаги, поэтому реже откладываю их.",
        "en": "I break big tasks into smaller steps, which helps me procrastinate on them less."
      },
      "scale": "organizational_procrastination",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 9,
      "text": {
        "ru": "Я могу долго откладывать задачу, потому что боюсь сделать её недостаточно хорошо.",
        "en": "I can delay a task for a long time because I’m afraid not to do it well enough."
      },
      "scale": "perfectionistic_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 10,
      "text": {
        "ru": "Я часто переделываю уже готовую работу, вместо того чтобы двигаться дальше.",
        "en": "I often rework tasks that are already done instead of moving on."
      },
      "scale": "perfectionistic_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 11,
      "text": {
        "ru": "Даже если результат неидеален, мне проще закончить и перейти к следующему шагу.",
        "en": "Even if the result is not perfect, it is easier for me to finish and move on."
      },
      "scale": "perfectionistic_procrastination",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 12,
      "text": {
        "ru": "Перед началом я трачу слишком много времени на подготовку и сбор информации.",
        "en": "Before starting, I spend too much time preparing and gathering information."
      },
      "scale": "perfectionistic_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 13,
      "text": {
        "ru": "Я часто откладываю дела в надежде, что позже появится больше сил или энергии.",
        "en": "I often delay tasks hoping that I will have more strength or energy later."
      },
      "scale": "energy_resource",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 14,
      "text": {
        "ru": "К концу дня я настолько выжат(а), что даже небольшие задачи кажутся непреодолимыми.",
        "en": "By the end of the day I feel so drained that even small tasks seem overwhelming."
      },
      "scale": "energy_resource",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 15,
      "text": {
        "ru": "Я умею планировать важные задачи на те часы, когда чувствую максимум энергии.",
        "en": "I know how to schedule important tasks for the hours when I have the most energy."
      },
      "scale": "energy_resource",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 16,
      "text": {
        "ru": "После рабочего дня у меня остаётся достаточно ресурса на личные проекты.",
        "en": "After my main workday I still have enough energy left for personal projects."
      },
      "scale": "energy_resource",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 17,
      "text": {
        "ru": "Когда думаю о возможной неудаче, мне проще заняться чем-то более приятным, чем продолжать работать над задачей.",
        "en": "When I think about possible failure, it is easier to switch to something pleasant than to keep working on the task."
      },
      "scale": "emotional_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 18,
      "text": {
        "ru": "Скучные или однообразные задачи почти всегда оказываются в конце моего списка дел.",
        "en": "Boring or repetitive tasks almost always end up at the bottom of my to-do list."
      },
      "scale": "emotional_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 19,
      "text": {
        "ru": "Я часто забываю о задачах, потому что не записал(а) их или не поставил(а) напоминание.",
        "en": "I often forget tasks because I didn’t write them down or set a reminder."
      },
      "scale": "organizational_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 20,
      "text": {
        "ru": "Если у задачи есть чёткий дедлайн и понятный план, я почти не тяну с её выполнением.",
        "en": "If a task has a clear deadline and a clear plan, I almost don’t procrastinate on it."
      },
      "scale": "organizational_procrastination",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 21,
      "text": {
        "ru": "Мне трудно показать промежуточный результат, пока он не выглядит достаточно «завершённым».",
        "en": "It is hard for me to show a draft or intermediate result until it looks “finished enough”."
      },
      "scale": "perfectionistic_procrastination",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 22,
      "text": {
        "ru": "Я спокойно принимаю, что некоторые дела можно сделать «достаточно хорошо», а не идеально.",
        "en": "I’m okay with the idea that some things can be done “good enough” and not perfectly."
      },
      "scale": "perfectionistic_procrastination",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 23,
      "text": {
        "ru": "Я редко делаю паузы и в итоге выгораю, после чего резко падает продуктивность.",
        "en": "I rarely take breaks and eventually burn out, after which my productivity drops sharply."
      },
      "scale": "energy_resource",
      "reverse": false,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    },
    {
      "id": 24,
      "text": {
        "ru": "Регулярный сон, отдых и движение помогают мне сохранять устойчивую работоспособность.",
        "en": "Regular sleep, rest and physical activity help me maintain stable productivity."
      },
      "scale": "energy_resource",
      "reverse": true,
      "response_type": "frequency",
      "response_config": {
        "options_ref": "frequency"
      }
    }
  ],
  "scoring": {
    "reverse_scoring": {
      "frequency": "4 - score"
    },
    "scale_calculations": {
      "emotional_procrastination": {
        "method": "mean_then_linear_0_100",
        "items": [
          1,
          2,
          3,
          4,
          17,
          18
        ],
        "reverse_items": [
          3
        ],
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл по шкале (0–4) переводится в проценты (0–100). Более высокий процент означает более выраженную эмоциональную прокрастинацию.",
            "en": "The mean item score (0–4) is linearly converted to 0–100. Higher percentages indicate stronger emotional procrastination."
          }
        }
      },
      "organizational_procrastination": {
        "method": "mean_then_linear_0_100",
        "items": [
          5,
          6,
          7,
          8,
          19,
          20
        ],
        "reverse_items": [
          6,
          8,
          20
        ],
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл по шкале (0–4) переводится в проценты (0–100). Более высокий процент означает больший вклад организационных факторов в прокрастинацию.",
            "en": "The mean item score (0–4) is linearly converted to 0–100. Higher percentages indicate a stronger organizational contribution to procrastination."
          }
        }
      },
      "perfectionistic_procrastination": {
        "method": "mean_then_linear_0_100",
        "items": [
          9,
          10,
          11,
          12,
          21,
          22
        ],
        "reverse_items": [
          11,
          22
        ],
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл (0–4) переводится в проценты (0–100). Более высокий процент означает, что перфекционизм сильнее мешает действовать.",
            "en": "The mean score (0–4) is converted to 0–100. Higher percentages mean perfectionism interferes more with action."
          }
        }
      },
      "energy_resource": {
        "method": "mean_then_linear_0_100",
        "items": [
          13,
          14,
          15,
          16,
          23,
          24
        ],
        "reverse_items": [
          15,
          16,
          24
        ],
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл (0–4) переводится в проценты (0–100). Более высокий процент означает, что низкий ресурс и усталость сильнее связаны с откладыванием дел.",
            "en": "The mean score (0–4) is converted to 0–100. Higher percentages indicate that low energy and fatigue are more strongly related to procrastination."
          }
        }
      }
    },
    "global_score": {
      "id": "procrastination_index",
      "method": "mean_of_scales",
      "scales": [
        "emotional_procrastination",
        "organizational_procrastination",
        "perfectionistic_procrastination",
        "energy_resource"
      ],
      "normalization": {
        "type": "none",
        "description": {
          "ru": "Глобальный индекс — среднее значение нормированных шкал (0–100). Более высокий показатель = более выраженная прокрастинация в целом.",
          "en": "Global index is the mean of normalized scales (0–100). Higher scores = more pronounced procrastination overall."
        }
      }
    },
    "profile_determination": {
      "method": "highest_score",
      "description": {
        "ru": "Доминирующий стиль прокрастинации определяется по шкале с наибольшим нормированным баллом. Для вторичного стиля можно учитывать вторую по величине шкалу.",
        "en": "The dominant procrastination style is defined by the scale with the highest normalized score. A secondary style can be based on the second highest scale."
      },
      "profiles": [
        {
          "id": "emotional_driver",
          "scale": "emotional_procrastination",
          "name": {
            "ru": "Эмоциональный драйвер прокрастинации",
            "en": "Emotional procrastination driver"
          },
          "short_description": {
            "ru": "Откладывание связано прежде всего с эмоциями: тревога, страх оценки, скука.",
            "en": "Delays are driven mainly by emotions: anxiety, fear of evaluation, boredom."
          }
        },
        {
          "id": "organizational_driver",
          "scale": "organizational_procrastination",
          "name": {
            "ru": "Организационный драйвер прокрастинации",
            "en": "Organizational procrastination driver"
          },
          "short_description": {
            "ru": "Откладывание связано с отсутствием структуры, приоритизации и понятных шагов.",
            "en": "Delays are driven by lack of structure, prioritization and clear steps."
          }
        },
        {
          "id": "perfectionistic_driver",
          "scale": "perfectionistic_procrastination",
          "name": {
            "ru": "Перфекционистский драйвер прокрастинации",
            "en": "Perfectionistic procrastination driver"
          },
          "short_description": {
            "ru": "Откладывание связано с завышенными стандартами и страхом сделать «не идеально».",
            "en": "Delays are driven by high standards and fear of doing things less than perfectly."
          }
        },
        {
          "id": "energy_driver",
          "scale": "energy_resource",
          "name": {
            "ru": "Энергетический драйвер прокрастинации",
            "en": "Energy-related procrastination driver"
          },
          "short_description": {
            "ru": "Откладывание связано с усталостью, нестабильной энергией и недостатком восстановления.",
            "en": "Delays are driven by fatigue, unstable energy and insufficient recovery."
          }
        }
      ]
    }
  },
  "interpretation": {
    "scales": {
      "emotional_procrastination": {
        "levels": [
          {
            "level": "low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Эмоции редко тормозят действия",
              "en": "Emotions rarely block action"
            },
            "short_description": {
              "ru": "Вы в целом можете действовать, даже если чувствуете тревогу или скуку.",
              "en": "You can generally act even when you feel anxious or bored."
            }
          },
          {
            "level": "medium",
            "range": [
              40,
              69
            ],
            "label": {
              "ru": "Эмоции иногда мешают делу",
              "en": "Emotions sometimes get in the way"
            },
            "short_description": {
              "ru": "Иногда настроение и страх оценки заметно тянут время, но вы находите способы двигаться.",
              "en": "Mood and fear of evaluation sometimes slow you down, but you still find ways to move."
            }
          },
          {
            "level": "high",
            "range": [
              70,
              100
            ],
            "label": {
              "ru": "Эмоции — главный тормоз",
              "en": "Emotions are the main brake"
            },
            "short_description": {
              "ru": "Откладывание часто связано с тревогой, стыдом, скукой или неприятием задачи.",
              "en": "Delays are often linked to anxiety, shame, boredom or dislike of the task."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Пробуйте разбивать задачи на самые маленькие шаги, чтобы снизить эмоциональный порог входа.",
            "Используйте техники самоподдержки: мягкий внутренний диалог вместо самокритики.",
            "Ставьте короткие таймеры (5–10 минут), чтобы начать действие до того, как эмоции успеют усилиться."
          ],
          "en": [
            "Break tasks into very small steps to lower the emotional barrier to entry.",
            "Use self-supportive inner dialogue instead of harsh self-criticism.",
            "Use short timers (5–10 minutes) to start acting before emotions ramp up."
          ]
        }
      },
      "organizational_procrastination": {
        "levels": [
          {
            "level": "low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Структура в целом работает",
              "en": "Structure generally works"
            },
            "short_description": {
              "ru": "У вас достаточно систем планирования, чтобы не терять задачи.",
              "en": "Your planning systems are usually enough to keep tasks on track."
            }
          },
          {
            "level": "medium",
            "range": [
              40,
              69
            ],
            "label": {
              "ru": "Нужна более чёткая организация",
              "en": "Needs clearer organization"
            },
            "short_description": {
              "ru": "Часть откладывания связана с тем, что задачи расплывчаты или не приоритизированы.",
              "en": "Some delays happen because tasks are vague or not prioritized."
            }
          },
          {
            "level": "high",
            "range": [
              70,
              100
            ],
            "label": {
              "ru": "Хаос сильно тормозит действия",
              "en": "Chaos strongly blocks action"
            },
            "short_description": {
              "ru": "Основная сложность — не эмоции, а отсутствие понятной системы и маршрута.",
              "en": "The main issue is not emotions but lack of a clear system and roadmap."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Выберите один основной инструмент планирования (трекер, ежедневник, доска задач) и держите все задачи там.",
            "Формулируйте задачи как конкретные действия на 30–60 минут, а не как большие абстрактные цели.",
            "Начинайте день с расстановки приоритетов: 1–3 ключевые задачи, которые точно должны сдвинуться."
          ],
          "en": [
            "Choose one main planning tool (tracker, planner, task board) and keep all tasks there.",
            "Formulate tasks as concrete 30–60 minute actions, not as large abstract goals.",
            "Start the day by setting priorities: 1–3 key tasks that must move forward."
          ]
        }
      },
      "perfectionistic_procrastination": {
        "levels": [
          {
            "level": "low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Перфекционизм почти не мешает",
              "en": "Perfectionism barely interferes"
            },
            "short_description": {
              "ru": "Вы умеете завершать задачи без излишнего шлифования.",
              "en": "You can finish tasks without excessive polishing."
            }
          },
          {
            "level": "medium",
            "range": [
              40,
              69
            ],
            "label": {
              "ru": "Местами завышенные стандарты",
              "en": "Somewhat high standards"
            },
            "short_description": {
              "ru": "Иногда вы застреваете на доработках и откладываете старт новых задач.",
              "en": "At times you get stuck reworking things and delay starting new tasks."
            }
          },
          {
            "level": "high",
            "range": [
              70,
              100
            ],
            "label": {
              "ru": "Перфекционизм — главный тормоз",
              "en": "Perfectionism is the main brake"
            },
            "short_description": {
              "ru": "Страх сделать недостаточно идеально серьёзно мешает начинать и заканчивать дела.",
              "en": "Fear of not doing things perfectly seriously interferes with starting and finishing."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Используйте принцип «черновик сначала»: сначала быстрый рабочий вариант, затем улучшения по необходимости.",
            "Ограничивайте время на задачу таймбоксом: после дедлайна работа считается завершённой.",
            "Отделяйте ценность задачи от собственного достоинства: результат — не оценка вас как человека."
          ],
          "en": [
            "Use a “draft first” principle: create a quick working version, then refine if needed.",
            "Limit time spent on tasks by timeboxing; when the time is up, the work is considered done.",
            "Separate the value of the task from your self-worth: the outcome is not a verdict on you as a person."
          ]
        }
      },
      "energy_resource": {
        "levels": [
          {
            "level": "low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Ресурс в целом стабилен",
              "en": "Energy is mostly stable"
            },
            "short_description": {
              "ru": "Усталость редко становится главной причиной откладывания.",
              "en": "Fatigue rarely becomes the main reason for delay."
            }
          },
          {
            "level": "medium",
            "range": [
              40,
              69
            ],
            "label": {
              "ru": "Энергия влияет на продуктивность",
              "en": "Energy affects productivity"
            },
            "short_description": {
              "ru": "Колебания ресурса заметно влияют на то, что вы успеваете сделать.",
              "en": "Energy swings noticeably affect what you manage to get done."
            }
          },
          {
            "level": "high",
            "range": [
              70,
              100
            ],
            "label": {
              "ru": "Низкий ресурс — ключевой фактор",
              "en": "Low energy is a key factor"
            },
            "short_description": {
              "ru": "Вы часто откладываете дела из-за усталости и недостатка восстановления.",
              "en": "You often delay tasks due to fatigue and lack of recovery."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Выясните свои «пиковые часы» и ставьте на них наиболее важные задачи.",
            "Планируйте короткие перерывы и восстановление, а не работайте до полного истощения.",
            "Следите за базовой гигиеной: сон, питание, движение — это фундамент продуктивности."
          ],
          "en": [
            "Identify your “peak hours” and schedule the most important tasks there.",
            "Plan short breaks and recovery instead of working until full exhaustion.",
            "Take care of basics: sleep, food and movement are the foundation of productivity."
          ]
        }
      }
    },
    "global_score": {
      "levels": [
        {
          "level": "low",
          "range": [
            0,
            24
          ],
          "label": {
            "ru": "Лёгкая прокрастинация",
            "en": "Mild procrastination"
          },
          "short_description": {
            "ru": "Вы иногда откладываете дела, но чаще всё-таки действуете.",
            "en": "You sometimes delay tasks but more often still get things done."
          }
        },
        {
          "level": "medium",
          "range": [
            25,
            49
          ],
          "label": {
            "ru": "Умеренная прокрастинация",
            "en": "Moderate procrastination"
          },
          "short_description": {
            "ru": "Откладывание заметно влияет на скорость движения к целям.",
            "en": "Procrastination noticeably affects how fast you move toward your goals."
          }
        },
        {
          "level": "high",
          "range": [
            50,
            74
          ],
          "label": {
            "ru": "Выраженная прокрастинация",
            "en": "Pronounced procrastination"
          },
          "short_description": {
            "ru": "Прокрастинация часто мешает реализовывать планы и идеи вовремя.",
            "en": "Procrastination often keeps you from implementing plans and ideas on time."
          }
        },
        {
          "level": "very_high",
          "range": [
            75,
            100
          ],
          "label": {
            "ru": "Высокий риск хронической прокрастинации",
            "en": "High risk of chronic procrastination"
          },
          "short_description": {
            "ru": "Откладывание становится устойчивым паттерном; стоит уделить этому особое внимание.",
            "en": "Delays have become a stable pattern and deserve focused attention."
          }
        }
      ],
      "global_recommendations": {
        "ru": [
          "Посмотрите на две самые высокие шкалы — они показывают ваши главные причины «знаю, но не делаю».",
          "Выберите 1–2 маленьких изменения стиля работы (формат планирования, защита ресурса, работа с эмоциями), которые реалистично внедрить в ближайшую неделю.",
          "Используйте результаты вместе с карьерными тестами (Career Compass, Digital Career Fit), чтобы соединить ответы на вопросы «что я хочу» и «как я могу к этому двигаться»."
        ],
        "en": [
          "Look at your two highest scales — they show your main reasons for “I know what I want but don’t do it”.",
          "Choose 1–2 small work-style changes (planning format, energy protection, emotion work) that you can realistically implement this week.",
          "Combine these results with career tests (Career Compass, Digital Career Fit) to connect “what I want” with “how I can move toward it”."
        ]
      }
    }
  },
  "implementation_notes": {
    "question_order": "randomize",
    "scale_order": "fixed",
    "progress_indicator": true,
    "allow_back_navigation": true,
    "required_questions": "all",
    "visualization_type": "radar_chart",
    "export_formats": [
      "json",
      "pdf"
    ]
  }
}
