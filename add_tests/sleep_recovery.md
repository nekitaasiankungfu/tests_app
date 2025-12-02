{
  "test_id": "sleep_recovery_v1",
  "title": {
    "ru": "Качество сна и восстановления",
    "en": "Sleep Quality and Recovery"
  },
  "description": {
    "ru": "Этот опрос помогает оценить, насколько сон действительно восстанавливает вас: насколько стабилен ваш режим, насколько глубок и непрерывный сон, как вы чувствуете себя днём, и насколько на сон влияют стресс и использование гаджетов. Результат показывает сильные стороны вашего режима сна и зоны риска, которые снижают ресурсность и настроение.\n\nТест не является медицинской диагностикой, но помогает заметить привычки, которые поддерживают или, наоборот, подрывают восстановление. Его удобно использовать вместе с тестами на уровень стресса и цифровой детокс, чтобы получить целостную картинку вашего эмоционального состояния и образа жизни.",
    "en": "This questionnaire helps you understand how restorative your sleep really is: how regular your schedule is, how deep and continuous your sleep feels, how you function during the day, and how stress and digital devices affect your rest. The result highlights both strengths and risk zones in your sleep routine.\n\nThis is not a medical diagnostic tool, but it can show which habits support recovery and which undermine it. It works well together with stress and digital detox assessments to give a more complete picture of your emotional well-being and lifestyle."
  },
  "category": "🌟 Эмоциональное состояние / Lifestyle",
  "version": "1.0",
  "author": "4Marketing / Nikita & ChatGPT (draft)",
  "languages": [
    "ru",
    "en"
  ],
  "default_language": "ru",
  "estimated_time_minutes": 6,
  "target_audience": {
    "ru": "Взрослые 18–65 лет, интересующиеся самочувствием, стрессом и гигиеной сна.",
    "en": "Adults 18–65 interested in well-being, stress management and sleep hygiene."
  },
  "context_of_use": {
    "ru": [
      "mental-health и lifestyle приложения",
      "программы по управлению стрессом",
      "цифровой детокс и осознанное использование гаджетов"
    ],
    "en": [
      "mental-health and lifestyle apps",
      "stress–management programs",
      "digital detox and mindful tech-use programs"
    ]
  },
  "theoretical_basis": {
    "ru": "Модель гигиены сна, двухфакторная модель регуляции сна (домашний и циркадный процессы), подходы к оценке субъективного качества сна и дневного функционирования, материалы по связи сна и психического благополучия (включая просветительские ресурсы вроде mind.org.uk).",
    "en": "Sleep hygiene models, the two-process model of sleep regulation (homeostatic and circadian), approaches to subjective sleep quality and daytime functioning, and psychoeducational resources on sleep and mental health (e.g. mind.org.uk)."
  },
  "scales": {
    "sleep_rhythm": {
      "name": {
        "ru": "Режим сна",
        "en": "Sleep rhythm"
      },
      "description": {
        "ru": "Регулярность отхода ко сну и подъёма, длительность сна.",
        "en": "Regularity of bedtimes and wake times, and sleep duration."
      }
    },
    "sleep_quality": {
      "name": {
        "ru": "Субъективное качество сна",
        "en": "Subjective sleep quality"
      },
      "description": {
        "ru": "Глубина сна, непрерывность, ощущение отдыха по утрам.",
        "en": "Sleep depth, continuity, and feeling refreshed in the morning."
      }
    },
    "daytime_functioning": {
      "name": {
        "ru": "Дневная бодрость",
        "en": "Daytime functioning"
      },
      "description": {
        "ru": "Сонливость днём, уровень энергии и концентрации.",
        "en": "Daytime sleepiness, energy, and concentration."
      }
    },
    "screens_and_habits": {
      "name": {
        "ru": "Гаджеты и привычки перед сном",
        "en": "Screens and pre-sleep habits"
      },
      "description": {
        "ru": "Использование экранов, кофеина и условия в спальне, влияющие на засыпание.",
        "en": "Use of screens, caffeine, and bedroom conditions affecting falling asleep."
      }
    },
    "stress_and_recovery": {
      "name": {
        "ru": "Стресс и восстановление",
        "en": "Stress and recovery"
      },
      "description": {
        "ru": "Влияние стресса и тревожных мыслей на сон и ощущение восстановления.",
        "en": "Impact of stress and worrying thoughts on sleep and sense of recovery."
      }
    }
  },
  "response_types": {
    "likert_5_frequency": {
      "description": {
        "ru": "Шкала частоты от «почти никогда» до «почти всегда».",
        "en": "Frequency scale from 'almost never' to 'almost always'."
      },
      "options": {
        "ru": [
          "Почти никогда",
          "Редко",
          "Иногда",
          "Часто",
          "Почти всегда"
        ],
        "en": [
          "Almost never",
          "Rarely",
          "Sometimes",
          "Often",
          "Almost always"
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
        "ru": "Я обычно ложусь спать примерно в одно и то же время (±30 минут).",
        "en": "I usually go to bed at roughly the same time (±30 minutes)."
      },
      "scale": "sleep_rhythm",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 2,
      "text": {
        "ru": "По будням и выходным я просыпаюсь в похожее время.",
        "en": "On weekdays and weekends I wake up at similar times."
      },
      "scale": "sleep_rhythm",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 3,
      "text": {
        "ru": "Большинство ночей я засыпаю в течение 20–30 минут.",
        "en": "On most nights I fall asleep within 20–30 minutes."
      },
      "scale": "sleep_quality",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 4,
      "text": {
        "ru": "Я редко долго лежу ночью без сна или часто просыпаюсь.",
        "en": "I rarely lie awake for long at night or wake up repeatedly."
      },
      "scale": "sleep_quality",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 5,
      "text": {
        "ru": "По утрам я чаще чувствую себя отдохнувшим(ей), чем разбитым(ой).",
        "en": "In the morning I more often feel rested than exhausted."
      },
      "scale": "sleep_quality",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 6,
      "text": {
        "ru": "Днём мне настолько хочется спать, что тянет прилечь или вздремнуть.",
        "en": "During the day I feel so sleepy that I want to lie down or nap."
      },
      "scale": "daytime_functioning",
      "reverse": true,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 7,
      "text": {
        "ru": "В течение дня мне в целом хватает энергии и концентрации.",
        "en": "Overall I have enough energy and concentration during the day."
      },
      "scale": "daytime_functioning",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 8,
      "text": {
        "ru": "За последние пару недель я случайно засыпал(а) днём (за рабочим столом, перед экраном, в транспорте).",
        "en": "In the past couple of weeks I have unintentionally nodded off during the day (at my desk, in front of a screen, in transport)."
      },
      "scale": "daytime_functioning",
      "reverse": true,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 9,
      "text": {
        "ru": "За 30–60 минут до сна я стараюсь отложить телефон, компьютер и другие экраны.",
        "en": "I try to put away my phone, computer and other screens 30–60 minutes before bedtime."
      },
      "scale": "screens_and_habits",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 10,
      "text": {
        "ru": "Лежа в постели, я часто листаю ленту, мессенджеры или смотрю видео.",
        "en": "While in bed I often scroll feeds, check messengers or watch videos."
      },
      "scale": "screens_and_habits",
      "reverse": true,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 11,
      "text": {
        "ru": "В моей спальне достаточно тихо, темно и прохладно, чтобы хорошо спать.",
        "en": "My bedroom is quiet, dark and cool enough for good sleep."
      },
      "scale": "screens_and_habits",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 12,
      "text": {
        "ru": "Когда я ложусь спать, мысли о работе, делах или проблемах мешают мне расслабиться.",
        "en": "When I go to bed, thoughts about work, tasks or problems keep me from relaxing."
      },
      "scale": "stress_and_recovery",
      "reverse": true,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 13,
      "text": {
        "ru": "Если я просыпаюсь среди ночи, мне обычно несложно снова заснуть.",
        "en": "If I wake up during the night, I can usually fall asleep again without much difficulty."
      },
      "scale": "sleep_quality",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 14,
      "text": {
        "ru": "Я регулярно употребляю кофеин или энергетики во второй половине дня (после 16:00).",
        "en": "I regularly consume caffeine or energy drinks in the late afternoon or evening (after 4 p.m.)."
      },
      "scale": "screens_and_habits",
      "reverse": true,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 15,
      "text": {
        "ru": "Ночью я часто смотрю на часы и начинаю нервничать из-за того, что «опять не высплюсь».",
        "en": "At night I often check the time and feel anxious that I 'won’t get enough sleep again'."
      },
      "scale": "stress_and_recovery",
      "reverse": true,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 16,
      "text": {
        "ru": "В среднем я сплю не менее 7 и не более 9 часов в сутки.",
        "en": "On average I sleep at least 7 and no more than 9 hours per night."
      },
      "scale": "sleep_rhythm",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 17,
      "text": {
        "ru": "После напряжённого дня одна-две ночи нормального сна обычно помогают мне восстановиться.",
        "en": "After a demanding day, one or two nights of normal sleep usually help me recover."
      },
      "scale": "stress_and_recovery",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 18,
      "text": {
        "ru": "Если мне удаётся несколько ночей подряд нормально высыпаться, моё настроение заметно улучшается.",
        "en": "If I manage to sleep well for several nights in a row, my mood noticeably improves."
      },
      "scale": "stress_and_recovery",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 19,
      "text": {
        "ru": "У меня есть небольшие вечерние ритуалы (душ, чтение, растяжка и т.п.), которые помогают спокойно перейти ко сну.",
        "en": "I have small evening rituals (shower, reading, stretching, etc.) that help me wind down for sleep."
      },
      "scale": "screens_and_habits",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    },
    {
      "id": 20,
      "text": {
        "ru": "Если я замечаю, что сон ухудшается, я стараюсь быстро корректировать режим или привычки.",
        "en": "If I notice my sleep getting worse, I try to adjust my schedule or habits quickly."
      },
      "scale": "stress_and_recovery",
      "reverse": false,
      "response_type": "likert_5_frequency",
      "response_config": {
        "options_ref": "likert_5_frequency"
      }
    }
  ],
  "scoring": {
    "per_item": {
      "response_type": "likert_5_frequency",
      "max_score_per_item": 4,
      "min_score_per_item": 0
    },
    "scale_calculations": {
      "sleep_rhythm": {
        "method": "mean_then_linear_0_100",
        "items": [
          1,
          2,
          16
        ],
        "reverse_items": [],
        "weights": null,
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл по шкале (0–4) переводится в проценты (0–100).",
            "en": "The mean item score (0–4) is linearly converted to 0–100."
          }
        }
      },
      "sleep_quality": {
        "method": "mean_then_linear_0_100",
        "items": [
          3,
          4,
          5,
          13
        ],
        "reverse_items": [],
        "weights": null,
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл по шкале (0–4) переводится в проценты (0–100).",
            "en": "The mean item score (0–4) is linearly converted to 0–100."
          }
        }
      },
      "daytime_functioning": {
        "method": "mean_then_linear_0_100",
        "items": [
          6,
          7,
          8
        ],
        "reverse_items": [
          6,
          8
        ],
        "weights": null,
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл по шкале (0–4) переводится в проценты (0–100).",
            "en": "The mean item score (0–4) is linearly converted to 0–100."
          }
        }
      },
      "screens_and_habits": {
        "method": "mean_then_linear_0_100",
        "items": [
          9,
          10,
          11,
          14,
          19
        ],
        "reverse_items": [
          10,
          14
        ],
        "weights": null,
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл по шкале (0–4) переводится в проценты (0–100).",
            "en": "The mean item score (0–4) is linearly converted to 0–100."
          }
        }
      },
      "stress_and_recovery": {
        "method": "mean_then_linear_0_100",
        "items": [
          12,
          15,
          17,
          18,
          20
        ],
        "reverse_items": [
          12,
          15
        ],
        "weights": null,
        "raw_score_range_per_item": [
          0,
          4
        ],
        "normalization": {
          "type": "linear",
          "formula": "(mean_raw / 4) * 100",
          "description": {
            "ru": "Средний балл по шкале (0–4) переводится в проценты (0–100).",
            "en": "The mean item score (0–4) is linearly converted to 0–100."
          }
        }
      }
    },
    "global_score": {
      "method": "mean_of_scales",
      "scales": [
        "sleep_rhythm",
        "sleep_quality",
        "daytime_functioning",
        "screens_and_habits",
        "stress_and_recovery"
      ],
      "normalization": {
        "type": "none",
        "description": {
          "ru": "Глобальный индекс — среднее значение нормированных шкал (0–100).",
          "en": "Global index is the mean of normalized scale scores (0–100)."
        }
      }
    }
  },
  "interpretation": {
    "scales": {
      "sleep_rhythm": {
        "levels": [
          {
            "level": "very_low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Низкий уровень восстановления",
              "en": "Low recovery level"
            },
            "short_description": {
              "ru": "Зона риска, выраженные трудности в этой области.",
              "en": "Risk zone with pronounced difficulties in this area."
            }
          },
          {
            "level": "low",
            "range": [
              40,
              59
            ],
            "label": {
              "ru": "Уязвимый уровень",
              "en": "Vulnerable level"
            },
            "short_description": {
              "ru": "Есть слабые места, которые стоит проработать.",
              "en": "Some weak spots that need attention."
            }
          },
          {
            "level": "moderate",
            "range": [
              60,
              79
            ],
            "label": {
              "ru": "Функциональный уровень",
              "en": "Functional level"
            },
            "short_description": {
              "ru": "В целом всё работает, но есть запас для улучшений.",
              "en": "Overall things work, but there is room for improvement."
            }
          },
          {
            "level": "high",
            "range": [
              80,
              100
            ],
            "label": {
              "ru": "Ресурсный уровень",
              "en": "Resourceful level"
            },
            "short_description": {
              "ru": "Зона силы, здоровые привычки хорошо поддерживают сон.",
              "en": "Strength area, habits support healthy sleep."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Сохраняйте как можно более стабильное время отхода ко сну и подъёма, даже в выходные.",
            "Постарайтесь постепенно смещать время сна, если оно очень позднее, на 15–20 минут каждые несколько дней.",
            "Следите, чтобы средняя продолжительность сна была в пределах 7–9 часов."
          ],
          "en": [
            "Keep your bedtimes and wake times as stable as possible, even on weekends.",
            "If your sleep time is very late, shift it gradually by 15–20 minutes every few days.",
            "Aim for an average sleep duration of 7–9 hours."
          ]
        }
      },
      "sleep_quality": {
        "levels": [
          {
            "level": "very_low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Низкий уровень восстановления",
              "en": "Low recovery level"
            },
            "short_description": {
              "ru": "Зона риска, выраженные трудности в этой области.",
              "en": "Risk zone with pronounced difficulties in this area."
            }
          },
          {
            "level": "low",
            "range": [
              40,
              59
            ],
            "label": {
              "ru": "Уязвимый уровень",
              "en": "Vulnerable level"
            },
            "short_description": {
              "ru": "Есть слабые места, которые стоит проработать.",
              "en": "Some weak spots that need attention."
            }
          },
          {
            "level": "moderate",
            "range": [
              60,
              79
            ],
            "label": {
              "ru": "Функциональный уровень",
              "en": "Functional level"
            },
            "short_description": {
              "ru": "В целом всё работает, но есть запас для улучшений.",
              "en": "Overall things work, but there is room for improvement."
            }
          },
          {
            "level": "high",
            "range": [
              80,
              100
            ],
            "label": {
              "ru": "Ресурсный уровень",
              "en": "Resourceful level"
            },
            "short_description": {
              "ru": "Зона силы, здоровые привычки хорошо поддерживают сон.",
              "en": "Strength area, habits support healthy sleep."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Добавьте расслабляющие ритуалы перед сном: тёплый душ, дыхательные упражнения, спокойное чтение.",
            "Минимизируйте яркий свет и громкие звуки в спальне, используйте маску и беруши при необходимости.",
            "Если хронические проблемы со сном сохраняются, обсудите их с врачом или сомнологом."
          ],
          "en": [
            "Add relaxing pre-sleep rituals such as a warm shower, breathing exercises or calm reading.",
            "Minimize bright light and noise in the bedroom; use an eye mask or earplugs if needed.",
            "If chronic sleep problems persist, discuss them with a doctor or sleep specialist."
          ]
        }
      },
      "daytime_functioning": {
        "levels": [
          {
            "level": "very_low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Низкий уровень восстановления",
              "en": "Low recovery level"
            },
            "short_description": {
              "ru": "Зона риска, выраженные трудности в этой области.",
              "en": "Risk zone with pronounced difficulties in this area."
            }
          },
          {
            "level": "low",
            "range": [
              40,
              59
            ],
            "label": {
              "ru": "Уязвимый уровень",
              "en": "Vulnerable level"
            },
            "short_description": {
              "ru": "Есть слабые места, которые стоит проработать.",
              "en": "Some weak spots that need attention."
            }
          },
          {
            "level": "moderate",
            "range": [
              60,
              79
            ],
            "label": {
              "ru": "Функциональный уровень",
              "en": "Functional level"
            },
            "short_description": {
              "ru": "В целом всё работает, но есть запас для улучшений.",
              "en": "Overall things work, but there is room for improvement."
            }
          },
          {
            "level": "high",
            "range": [
              80,
              100
            ],
            "label": {
              "ru": "Ресурсный уровень",
              "en": "Resourceful level"
            },
            "short_description": {
              "ru": "Зона силы, здоровые привычки хорошо поддерживают сон.",
              "en": "Strength area, habits support healthy sleep."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Обратите внимание на моменты, когда вы особенно клоните в сон — это маркеры недосыпа.",
            "Старайтесь не компенсировать недосып большим количеством кофеина; лучше добавьте короткий дневной отдых.",
            "При частых эпизодах засыпания днём обсудите это со специалистом, чтобы исключить медицинские причины."
          ],
          "en": [
            "Notice when you feel especially sleepy — these are signs of sleep debt.",
            "Try not to compensate for lack of sleep with high caffeine intake; add short daytime rest instead.",
            "If you often doze off unintentionally, talk to a professional to rule out medical causes."
          ]
        }
      },
      "screens_and_habits": {
        "levels": [
          {
            "level": "very_low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Низкий уровень восстановления",
              "en": "Low recovery level"
            },
            "short_description": {
              "ru": "Зона риска, выраженные трудности в этой области.",
              "en": "Risk zone with pronounced difficulties in this area."
            }
          },
          {
            "level": "low",
            "range": [
              40,
              59
            ],
            "label": {
              "ru": "Уязвимый уровень",
              "en": "Vulnerable level"
            },
            "short_description": {
              "ru": "Есть слабые места, которые стоит проработать.",
              "en": "Some weak spots that need attention."
            }
          },
          {
            "level": "moderate",
            "range": [
              60,
              79
            ],
            "label": {
              "ru": "Функциональный уровень",
              "en": "Functional level"
            },
            "short_description": {
              "ru": "В целом всё работает, но есть запас для улучшений.",
              "en": "Overall things work, but there is room for improvement."
            }
          },
          {
            "level": "high",
            "range": [
              80,
              100
            ],
            "label": {
              "ru": "Ресурсный уровень",
              "en": "Resourceful level"
            },
            "short_description": {
              "ru": "Зона силы, здоровые привычки хорошо поддерживают сон.",
              "en": "Strength area, habits support healthy sleep."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Выделите «режим полёта для мозга»: 30–60 минут до сна без мессенджеров, соцсетей и рабочих писем.",
            "Уберите яркие экраны из кровати, по возможности перенесите просмотр контента за пределы спальни.",
            "Сократите кофеин во второй половине дня и следите за комфортом в спальне (темнота, тишина, прохлада)."
          ],
          "en": [
            "Create a 'flight mode for the brain': 30–60 minutes before bed without messengers, social media or work emails.",
            "Remove bright screens from the bed and, if possible, keep content consumption outside the bedroom.",
            "Reduce caffeine intake in the second half of the day and optimise bedroom comfort (dark, quiet, cool)."
          ]
        }
      },
      "stress_and_recovery": {
        "levels": [
          {
            "level": "very_low",
            "range": [
              0,
              39
            ],
            "label": {
              "ru": "Низкий уровень восстановления",
              "en": "Low recovery level"
            },
            "short_description": {
              "ru": "Зона риска, выраженные трудности в этой области.",
              "en": "Risk zone with pronounced difficulties in this area."
            }
          },
          {
            "level": "low",
            "range": [
              40,
              59
            ],
            "label": {
              "ru": "Уязвимый уровень",
              "en": "Vulnerable level"
            },
            "short_description": {
              "ru": "Есть слабые места, которые стоит проработать.",
              "en": "Some weak spots that need attention."
            }
          },
          {
            "level": "moderate",
            "range": [
              60,
              79
            ],
            "label": {
              "ru": "Функциональный уровень",
              "en": "Functional level"
            },
            "short_description": {
              "ru": "В целом всё работает, но есть запас для улучшений.",
              "en": "Overall things work, but there is room for improvement."
            }
          },
          {
            "level": "high",
            "range": [
              80,
              100
            ],
            "label": {
              "ru": "Ресурсный уровень",
              "en": "Resourceful level"
            },
            "short_description": {
              "ru": "Зона силы, здоровые привычки хорошо поддерживают сон.",
              "en": "Strength area, habits support healthy sleep."
            }
          }
        ],
        "recommendations": {
          "ru": [
            "Перед сном попробуйте короткие практики разгрузки: выписывание мыслей, дыхательные упражнения, мягкая растяжка.",
            "Отслеживайте связь между стрессом днём и качеством сна; при высоком уровне стресса добавляйте больше восстановительных активностей.",
            "Если тревожные мысли регулярно мешают спать, рассмотрите консультацию психолога или психотерапевта."
          ],
          "en": [
            "Before bed, try short 'unloading' routines: journaling, breathing exercises or gentle stretching.",
            "Track the link between daytime stress and sleep quality; add more recovery activities when stress is high.",
            "If worrying thoughts regularly disrupt your sleep, consider seeing a psychologist or therapist."
          ]
        }
      }
    },
    "global_score": {
      "levels": [
        {
          "level": "fragmented_recovery",
          "range": [
            0,
            49
          ],
          "label": {
            "ru": "Сон слабо восстанавливает",
            "en": "Sleep restores you poorly"
          },
          "short_description": {
            "ru": "Сразу несколько аспектов сна и восстановления проседают; важно обратить внимание на режим и стресс.",
            "en": "Several aspects of sleep and recovery are low; it is important to review schedule and stress."
          }
        },
        {
          "level": "uneven_recovery",
          "range": [
            50,
            69
          ],
          "label": {
            "ru": "Неровное восстановление",
            "en": "Uneven recovery"
          },
          "short_description": {
            "ru": "Часть привычек поддерживает сон, но есть уязвимые места (например, гаджеты, стресс или недосып).",
            "en": "Some habits support sleep, but there are vulnerable areas (e.g. gadgets, stress or lack of sleep)."
          }
        },
        {
          "level": "stable_recovery",
          "range": [
            70,
            84
          ],
          "label": {
            "ru": "Достаточное восстановление",
            "en": "Adequate recovery"
          },
          "short_description": {
            "ru": "В целом сон хорошо восстанавливает, отдельные корректировки могут сделать режим ещё более ресурсным.",
            "en": "Overall sleep restores you well; small adjustments can make it even more restorative."
          }
        },
        {
          "level": "high_recovery",
          "range": [
            85,
            100
          ],
          "label": {
            "ru": "Сон как ключевой ресурс",
            "en": "Sleep as a key resource"
          },
          "short_description": {
            "ru": "Сон устойчиво поддерживает ваше состояние; важно бережно сохранять этот ресурс даже в стрессовые периоды.",
            "en": "Sleep consistently supports your well-being; it is important to protect this resource even during stressful periods."
          }
        }
      ],
      "global_recommendations": {
        "ru": [
          "Используйте результаты как ориентир для маленьких, реалистичных шагов: выберите 1–2 привычки, которые проще всего изменить в ближайшую неделю.",
          "Сравните итог с результатами стресс-теста и цифрового детокса: где сон уже поддерживает вас, а где его «ломают» стресс или гаджеты.",
          "При выраженных трудностях со сном или настроением ориентируйтесь на консультацию специалиста, а не только на самооценку."
        ],
        "en": [
          "Use the results as a guide for small, realistic steps: pick 1–2 habits you can change in the coming week.",
          "Compare your score with stress and digital-detox assessments: where does sleep already support you, and where is it undermined by stress or gadgets?",
          "If you have marked sleep or mood problems, see a professional instead of relying only on self-assessment."
        ]
      }
    }
  }
}
