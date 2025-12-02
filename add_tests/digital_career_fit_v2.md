{
  "summary_template": {
    "description": "Шаблон финального саммари для теста «Какая цифровая профессия вам подходит?»",
    "inputs": {
      "profile_id": "string (например: profile_product_manager, profile_data_analyst, profile_ux_designer, profile_content_marketer, profile_project_manager, profile_developer, profile_mixed)",
      "profile_name": "string (человекочитаемое название профиля)",
      "profile_description": "string (основное описание профиля из блока profiles)",
      "profile_characteristics": "string[] (характерные особенности профиля)",
      "profile_recommendations": "string[] (рекомендации по развитию профиля)",
      "profile_suitable_roles": "string[] (подходящие профессии)",
      "dominant_scales": "string[] (названия шкал с наибольшими значениями)",
      "normalized_scores": "object (ключ = id шкалы, значение = число 0–100)",
      "top_strengths": "string[] (вычисленные сильные стороны пользователя, уже подготовленные кодом)",
      "next_step_suggestion": "string (одно короткое действие «что сделать сегодня»; можно сгенерировать кодом)",
      "inspiring_message": "string (короткое вдохновляющее завершение; можно сгенерировать кодом)"
    },
    "sections": [
      {
        "id": "profile_overview",
        "title": "Ваш цифровой профиль",
        "type": "text",
        "template": "Судя по вашим ответам, вам ближе всего направление «{{profile_name}}». {{profile_description}}"
      },
      {
        "id": "why_this_profile",
        "title": "Почему именно этот профиль",
        "type": "text",
        "template": "Этот результат основан на том, что у вас выделяются шкалы: {{dominant_scales_joined}}. Это означает, что вы особенно тяготеете к задачам, связанным с {{dominant_scales_explained}}."
      },
      {
        "id": "strengths",
        "title": "Ваши сильные стороны",
        "type": "list",
        "template": "{{top_strengths}}",
        "item_prefix": "• "
      },
      {
        "id": "suitable_roles",
        "title": "Подходящие направления и профессии",
        "type": "list",
        "template": "{{profile_suitable_roles}}",
        "item_prefix": "– "
      },
      {
        "id": "development_recommendations",
        "title": "Как развиваться в этом направлении",
        "type": "list",
        "template": "{{profile_recommendations}}",
        "item_prefix": "• "
      },
      {
        "id": "try_today",
        "title": "Что можно сделать уже сегодня",
        "type": "text",
        "template": "{{next_step_suggestion}}"
      },
      {
        "id": "inspiring_conclusion",
        "title": "Итог",
        "type": "text",
        "template": "{{inspiring_message}}"
      }
    ]
  },
  "result_schema": {
    "description": "Структура готового итогового саммари, которое покажется пользователю после теста",
    "type": "object",
    "properties": {
      "profile_id": {
        "type": "string"
      },
      "profile_name": {
        "type": "string"
      },
      "normalized_scores": {
        "type": "object",
        "description": "Ключ — id шкалы (product_thinking, data_analytics и т.д.), значение — число 0–100"
      },
      "summary": {
        "type": "object",
        "properties": {
          "profile_overview": {
            "type": "string"
          },
          "why_this_profile": {
            "type": "string"
          },
          "strengths": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "suitable_roles": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "development_recommendations": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "try_today": {
            "type": "string"
          },
          "inspiring_conclusion": {
            "type": "string"
          }
        },
        "required": [
          "profile_overview",
          "why_this_profile",
          "strengths",
          "suitable_roles",
          "development_recommendations",
          "try_today",
          "inspiring_conclusion"
        ]
      }
    },
    "required": [
      "profile_id",
      "profile_name",
      "normalized_scores",
      "summary"
    ]
  },
  "example_result": {
    "profile_id": "profile_developer",
    "profile_name": "Разработчик / технический специалист",
    "normalized_scores": {
      "product_thinking": 48.6,
      "data_analytics": 38.9,
      "design_ux": 22.2,
      "content_marketing": 16.7,
      "management_communication": 30.0,
      "tech_development": 85.0
    },
    "summary": {
      "profile_overview": "Судя по вашим ответам, вам ближе всего направление «Разработчик / технический специалист». Вы явно тяготеете к технической стороне digital: вам интересно разбираться, как устроены системы, искать оптимальные решения и запускать работающий функционал.",
      "why_this_profile": "Этот результат основан на том, что у вас особенно высока шкала, связанная с технологиями и разработкой, а также присутствует базовый интерес к продуктовой логике и анализу. Это означает, что вы комфортно чувствуете себя в задачах, где важны внимание к деталям, логика и работа с технической стороной продукта.",
      "strengths": [
        "Вы склонны глубоко разбираться в задачах и искать устойчивые решения.",
        "Вам комфортна длительная концентрированная работа.",
        "Вы цените предсказуемость, структуру и понятные критерии качества."
      ],
      "suitable_roles": [
        "Frontend / backend / full-stack разработчик",
        "Мобильный разработчик",
        "Инженер по интеграциям или автоматизации"
      ],
      "development_recommendations": [
        "Выберите направление разработки (например, frontend или backend) и простройте последовательный план обучения.",
        "Создавайте небольшие учебные проекты, чтобы закреплять знания на практике.",
        "Осваивайте инструменты командной разработки: системы контроля версий, код-ревью, базовые принципы архитектуры."
      ],
      "try_today": "Выберите сервис или приложение, которым вы пользуетесь каждый день, и подумайте, как бы вы реализовали одну его функцию «изнутри» — какие модули и запросы могли бы понадобиться.",
      "inspiring_conclusion": "Ваши склонности создают хороший фундамент для технической карьеры в digital. При регулярной практике и обучении вы можете вырасти в востребованного специалиста, который делает продукты реально работающими."
    }
  }
}
