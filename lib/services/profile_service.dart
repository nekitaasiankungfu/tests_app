import 'package:flutter/material.dart';
import '../models/test_model.dart';
import '../models/test_profile_model.dart';

// Импорт данных тестов с профилями (только те, которые уже реализованы)
import '../data/digital_career_fit_data.dart';
import '../data/romantic_potential_data.dart';
import '../data/relationship_compatibility_data.dart';
import '../data/friendship_psychology_data.dart';
import '../data/adhd_attention_profile_data.dart';
import '../data/anxiety_symptoms_inventory_data.dart';
import '../data/burnout_diagnostic_data.dart';
import '../data/depression_symptoms_inventory_data.dart';
import '../data/digital_detox_data.dart';
import '../data/social_battery_data.dart';
import '../data/disc_personality_data.dart';
import '../data/holland_code_data.dart';
import '../data/love_languages_data.dart';
import '../data/self_confidence_multiscale_data.dart';
import '../data/ipip_big_five_data.dart';
import '../data/fisher_temperament_data.dart';
import '../data/temperament_profile_test_data.dart';
import '../data/stress_test_data.dart';
import '../data/self_esteem_test_data.dart';
import '../data/love_profile_data.dart';
import '../data/wellbeing_happiness_inventory_data.dart';
import '../data/values_priorities_data.dart';
import '../data/attachment_style_data.dart';
import '../data/motivational_strategies_data.dart';
import '../data/conflict_communication_style_data.dart';
import '../data/emotional_intelligence_data.dart';
import '../data/imposter_syndrome_data.dart';
import '../data/sleep_recovery_data.dart';
import '../data/procrastination_productivity_data.dart';
import '../data/boundaries_people_pleasing_data.dart';
import '../data/dark_personality_traits_data.dart';
import '../data/toxic_patterns_data.dart';
import '../data/attention_style_data.dart';
import '../data/mental_age_lifespan_styles_data.dart';
import '../data/self_sabotage_data.dart';
import '../data/money_mindset_habits_data.dart';
import '../data/gaming_balance_check_data.dart';

/// Сервис для работы с профилями результатов тестов
///
/// Централизованно управляет определением и получением профилей
/// для всех тестов в приложении
class ProfileService {
  /// Проверить, поддерживает ли тест систему профилей
  static bool supportsProfiles(String testId) {
    return _supportedTests.contains(testId);
  }

  /// Список тестов, которые поддерживают профили
  /// (добавляются по мере реализации)
  static const Set<String> _supportedTests = {
    'digital_career_fit_v1',
    'romantic_potential_v1',
    'relationship_compatibility_v1',
    'friendship_psychology_v1',
    'adhd_attention_profile_v2',
    'anxiety_symptoms_inventory_v1',
    'burnout_diagnostic_v1',
    'depression_symptoms_inventory_v1',
    'digital_detox_test',
    'social_battery_v1',
    'disc_personality_v1',
    'holland_code_v1',
    'love_languages_v1',
    'self_confidence_multiscale_v1',
    'ipip_big_five',
    'fisher_temperament',
    'temperament_profile_test',
    'stress_test',
    'self_esteem_test',
    'love_profile',
    'wellbeing_happiness_inventory_v1',
    'values_priorities_v1',
    'attachment_styles_v1',
    'motivational_strategies_v1',
    'conflict_communication_style_v1',
    'emotional_intelligence',
    'imposter_syndrome',
    'sleep_recovery_v1',
    'procrastination_productivity_style_v1',
    'boundaries_people_pleasing',
    'dark_personality_traits',
    'toxic_patterns',
    'attention_style',
    'mental_age_lifespan_styles_v1',
    'self_sabotage_how_you_block_yourself_v1',
    'money_mindset_habits_v1',
    'gaming_balance_check_v1',
    // TODO: Добавить остальные тесты по мере реализации профилей
    // 'cognitive_ability_v1',
  };

  /// Вычислить проценты по шкалам из результата теста
  static Map<String, double> calculatePercentages(TestResult result) {
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }
    return percentages;
  }

  /// Определить ID профиля для результата теста
  static String? determineProfileId(TestResult result) {
    if (!supportsProfiles(result.testId)) {
      return null;
    }

    final percentages = calculatePercentages(result);
    if (percentages.isEmpty) {
      return null;
    }

    switch (result.testId) {
      case 'digital_career_fit_v1':
        return DigitalCareerFitData.determineProfile(percentages);
      case 'romantic_potential_v1':
        return RomanticPotentialData.determineProfile(percentages);
      case 'relationship_compatibility_v1':
        return RelationshipCompatibilityData.determineProfile(percentages);
      case 'friendship_psychology_v1':
        return FriendshipPsychologyData.determineProfile(percentages);
      case 'adhd_attention_profile_v2':
        return ADHDAttentionProfileData.determineProfile(percentages);
      case 'anxiety_symptoms_inventory_v1':
        return AnxietySymptomsInventoryData.determineProfile(percentages);
      case 'burnout_diagnostic_v1':
        return BurnoutDiagnosticData.determineProfile(percentages);
      case 'depression_symptoms_inventory_v1':
        return DepressionSymptomsInventoryData.determineProfile(percentages);
      case 'digital_detox_test':
        return DigitalDetoxTestData.determineProfile(percentages);
      case 'social_battery_v1':
        return SocialBatteryData.determineProfile(percentages);
      case 'disc_personality_v1':
        return DISCPersonalityData.determineProfile(percentages);
      case 'holland_code_v1':
        return HollandCodeData.determineProfile(percentages);
      case 'love_languages_v1':
        return LoveLanguagesData.determineProfile(percentages);
      case 'self_confidence_multiscale_v1':
        return SelfConfidenceMultiscaleData.determineProfile(percentages);
      case 'ipip_big_five':
        return IPIPBigFiveData.determineProfile(percentages);
      case 'fisher_temperament':
        return FisherTemperamentData.determineProfile(percentages);
      case 'temperament_profile_test':
        return TemperamentProfileTestData.determineProfile(percentages);
      case 'stress_test':
        return StressTestData.determineProfile(percentages);
      case 'self_esteem_test':
        return SelfEsteemTestData.determineProfile(percentages);
      case 'love_profile':
        return LoveProfileData.determineProfile(percentages);
      case 'wellbeing_happiness_inventory_v1':
        return WellbeingHappinessInventoryData.determineProfile(percentages);
      case 'values_priorities_v1':
        return ValuesPrioritiesData.determineProfile(percentages);
      case 'attachment_styles_v1':
        return AttachmentStyleData.determineProfile(percentages);
      case 'motivational_strategies_v1':
        return MotivationalStrategiesData.determineProfile(percentages);
      case 'conflict_communication_style_v1':
        return ConflictCommunicationStyleData.determineProfile(percentages);
      case 'emotional_intelligence':
        return EmotionalIntelligenceData.determineProfile(percentages);
      case 'imposter_syndrome':
        return ImposterSyndromeData.determineProfile(percentages);
      case 'sleep_recovery_v1':
        return SleepRecoveryData.determineProfile(percentages);
      case 'procrastination_productivity_style_v1':
        return ProcrastinationProductivityData.determineProfile(percentages);
      case 'boundaries_people_pleasing':
        return BoundariesPeoplePleasingData.determineProfile(percentages);
      case 'dark_personality_traits':
        return DarkPersonalityTraitsData.determineProfile(percentages);
      case 'toxic_patterns':
        return ToxicPatternsData.determineProfile(percentages);
      case 'attention_style':
        return AttentionStyleData.determineProfile(percentages);
      case 'mental_age_lifespan_styles_v1':
        return MentalAgeLifespanStylesData.determineProfile(percentages);
      case 'self_sabotage_how_you_block_yourself_v1':
        return SelfSabotageData.determineProfile(percentages);
      case 'money_mindset_habits_v1':
        return MoneyMindsetHabitsData.determineProfile(percentages);
      case 'gaming_balance_check_v1':
        return GamingBalanceCheckData.determineProfile(percentages);
      // TODO: Добавить остальные тесты по мере реализации
      default:
        return null;
    }
  }

  /// Получить профиль по ID для конкретного теста
  static TestProfile? getProfile(String testId, String profileId) {
    switch (testId) {
      case 'digital_career_fit_v1':
        return _convertCareerProfile(DigitalCareerFitData.getProfile(profileId));
      case 'romantic_potential_v1':
        return _convertRomanticProfile(RomanticPotentialData.getProfile(profileId));
      case 'relationship_compatibility_v1':
        return _convertRelationshipProfile(RelationshipCompatibilityData.getProfile(profileId));
      case 'friendship_psychology_v1':
        return _convertFriendshipProfile(FriendshipPsychologyData.getProfile(profileId));
      case 'adhd_attention_profile_v2':
        return _convertADHDProfile(ADHDAttentionProfileData.getProfile(profileId));
      case 'anxiety_symptoms_inventory_v1':
        return AnxietySymptomsInventoryData.getProfile(profileId);
      case 'burnout_diagnostic_v1':
        return BurnoutDiagnosticData.getProfile(profileId);
      case 'depression_symptoms_inventory_v1':
        return DepressionSymptomsInventoryData.getProfile(profileId);
      case 'digital_detox_test':
        return DigitalDetoxTestData.getProfile(profileId);
      case 'social_battery_v1':
        return SocialBatteryData.getProfile(profileId);
      case 'disc_personality_v1':
        return DISCPersonalityData.getProfile(profileId);
      case 'holland_code_v1':
        return HollandCodeData.getProfile(profileId);
      case 'love_languages_v1':
        return LoveLanguagesData.getProfile(profileId);
      case 'self_confidence_multiscale_v1':
        return SelfConfidenceMultiscaleData.getProfile(profileId);
      case 'ipip_big_five':
        return IPIPBigFiveData.getProfile(profileId);
      case 'fisher_temperament':
        return FisherTemperamentData.getProfile(profileId);
      case 'temperament_profile_test':
        return TemperamentProfileTestData.getProfile(profileId);
      case 'stress_test':
        return StressTestData.getProfile(profileId);
      case 'self_esteem_test':
        return SelfEsteemTestData.getProfile(profileId);
      case 'love_profile':
        return LoveProfileData.getProfile(profileId);
      case 'wellbeing_happiness_inventory_v1':
        return WellbeingHappinessInventoryData.getProfile(profileId);
      case 'values_priorities_v1':
        return ValuesPrioritiesData.getProfile(profileId);
      case 'attachment_styles_v1':
        return AttachmentStyleData.getProfile(profileId);
      case 'motivational_strategies_v1':
        return MotivationalStrategiesData.getProfile(profileId);
      case 'conflict_communication_style_v1':
        return ConflictCommunicationStyleData.getProfile(profileId);
      case 'emotional_intelligence':
        return EmotionalIntelligenceData.getProfile(profileId);
      case 'imposter_syndrome':
        return ImposterSyndromeData.getProfile(profileId);
      case 'sleep_recovery_v1':
        return SleepRecoveryData.getProfile(profileId);
      case 'procrastination_productivity_style_v1':
        return ProcrastinationProductivityData.getProfile(profileId);
      case 'boundaries_people_pleasing':
        return BoundariesPeoplePleasingData.getProfile(profileId);
      case 'dark_personality_traits':
        return DarkPersonalityTraitsData.getProfile(profileId);
      case 'toxic_patterns':
        return ToxicPatternsData.getProfile(profileId);
      case 'attention_style':
        return AttentionStyleData.getProfile(profileId);
      case 'mental_age_lifespan_styles_v1':
        return MentalAgeLifespanStylesData.getProfile(profileId);
      case 'self_sabotage_how_you_block_yourself_v1':
        return SelfSabotageData.getProfile(profileId);
      case 'money_mindset_habits_v1':
        return MoneyMindsetHabitsData.getProfile(profileId);
      case 'gaming_balance_check_v1':
        return GamingBalanceCheckData.getProfile(profileId);
      // TODO: Добавить остальные тесты по мере реализации
      default:
        return null;
    }
  }

  /// Получить иконку для профиля
  static IconData getProfileIcon(String testId, String profileId) {
    // Универсальные иконки по типу теста
    switch (testId) {
      case 'digital_career_fit_v1':
        return _getCareerIcon(profileId);
      case 'romantic_potential_v1':
      case 'relationship_compatibility_v1':
      case 'love_profile':
        return Icons.favorite_outline;
      case 'friendship_psychology_v1':
        return Icons.people_outline;
      case 'adhd_attention_profile_v2':
        return Icons.psychology_outlined;
      case 'anxiety_symptoms_inventory_v1':
      case 'depression_symptoms_inventory_v1':
        return Icons.healing_outlined;
      case 'burnout_diagnostic_v1':
        return Icons.local_fire_department_outlined;
      case 'digital_detox_test':
        return Icons.phone_android_outlined;
      case 'social_battery_v1':
        return Icons.battery_charging_full_outlined;
      case 'disc_personality_v1':
        return Icons.pie_chart_outline;
      case 'holland_code_v1':
        return Icons.work_outline;
      case 'love_languages_v1':
        return Icons.favorite_border;
      case 'self_confidence_multiscale_v1':
        return Icons.star_outline;
      case 'wellbeing_happiness_inventory_v1':
        return Icons.emoji_emotions_outlined;
      case 'values_priorities_v1':
        return Icons.compass_calibration_outlined;
      case 'attachment_styles_v1':
        return Icons.favorite_border;
      case 'emotional_intelligence':
        return Icons.psychology_outlined;
      case 'imposter_syndrome':
        return Icons.person_search_outlined;
      case 'cognitive_ability_v1':
        return Icons.lightbulb_outline;
      case 'ipip_big_five':
      case 'fisher_temperament':
      case 'temperament_profile_test':
        return Icons.psychology;
      case 'stress_test':
        return Icons.spa_outlined;
      case 'self_esteem_test':
        return Icons.self_improvement;
      case 'sleep_recovery_v1':
        return Icons.bedtime_outlined;
      case 'procrastination_productivity_style_v1':
        return Icons.timer_outlined;
      case 'boundaries_people_pleasing':
        return Icons.shield_outlined;
      default:
        return Icons.analytics_outlined;
    }
  }

  static IconData _getCareerIcon(String profileId) {
    switch (profileId) {
      case 'profile_product_manager':
        return Icons.lightbulb_outline;
      case 'profile_data_analyst':
        return Icons.analytics_outlined;
      case 'profile_ux_designer':
        return Icons.brush_outlined;
      case 'profile_content_marketer':
        return Icons.campaign_outlined;
      case 'profile_project_manager':
        return Icons.people_outline;
      case 'profile_developer':
        return Icons.code;
      default:
        return Icons.hub_outlined;
    }
  }

  /// Конвертация CareerProfile в универсальный TestProfile
  static TestProfile? _convertCareerProfile(CareerProfile? profile) {
    if (profile == null) return null;
    return TestProfile(
      id: profile.id,
      name: profile.name,
      description: profile.description,
      whyThisProfile: {
        'ru': 'Ваши ответы показывают склонность к этому направлению',
        'en': 'Your answers show an inclination towards this direction',
      },
      strengths: profile.characteristics,
      vulnerabilities: {'ru': [], 'en': []},
      recommendations: profile.recommendations,
      tryToday: {
        'ru': 'Изучите вакансии по этому направлению',
        'en': 'Explore job openings in this direction',
      },
      inspiringConclusion: {
        'ru': 'Ваш потенциал в цифровой сфере огромен!',
        'en': 'Your potential in the digital field is huge!',
      },
    );
  }

  /// Конвертация RomanticProfile в универсальный TestProfile
  static TestProfile? _convertRomanticProfile(dynamic profile) {
    if (profile == null) return null;
    return TestProfile(
      id: profile.id,
      name: profile.name,
      description: profile.description,
      whyThisProfile: {
        'ru': 'На основе ваших ответов о романтических убеждениях',
        'en': 'Based on your answers about romantic beliefs',
      },
      strengths: profile.characteristics,
      vulnerabilities: profile.vulnerabilities ?? {'ru': [], 'en': []},
      recommendations: profile.recommendations,
      tryToday: profile.tryToday ?? {
        'ru': 'Поразмышляйте о своих романтических ожиданиях',
        'en': 'Reflect on your romantic expectations',
      },
      inspiringConclusion: profile.inspiringMessage ?? {
        'ru': 'Любовь начинается с понимания себя',
        'en': 'Love begins with understanding yourself',
      },
    );
  }

  /// Конвертация RelationshipProfile в универсальный TestProfile
  static TestProfile? _convertRelationshipProfile(dynamic profile) {
    if (profile == null) return null;
    return TestProfile(
      id: profile.id,
      name: profile.name,
      description: profile.description,
      whyThisProfile: {
        'ru': 'Анализ ваших предпочтений в отношениях',
        'en': 'Analysis of your relationship preferences',
      },
      strengths: profile.characteristics,
      vulnerabilities: profile.vulnerabilities ?? {'ru': [], 'en': []},
      recommendations: profile.recommendations,
      tryToday: profile.tryToday ?? {
        'ru': 'Обсудите ожидания с партнёром',
        'en': 'Discuss expectations with your partner',
      },
      inspiringConclusion: profile.inspiringMessage ?? {
        'ru': 'Крепкие отношения строятся на взаимопонимании',
        'en': 'Strong relationships are built on mutual understanding',
      },
    );
  }

  /// Конвертация ADHD Profile (Map) в универсальный TestProfile
  static TestProfile? _convertADHDProfile(Map<String, dynamic>? profile) {
    if (profile == null) return null;
    return TestProfile(
      id: profile['name']?['en']?.toString().toLowerCase().replaceAll(' ', '_') ?? 'unknown',
      name: Map<String, String>.from(profile['name'] ?? {'ru': '', 'en': ''}),
      description: Map<String, String>.from(profile['description'] ?? {'ru': '', 'en': ''}),
      whyThisProfile: {
        'ru': 'На основе ваших ответов о внимании и саморегуляции',
        'en': 'Based on your answers about attention and self-regulation',
      },
      strengths: {
        'ru': List<String>.from(profile['characteristics']?['ru'] ?? []),
        'en': List<String>.from(profile['characteristics']?['en'] ?? []),
      },
      vulnerabilities: {'ru': [], 'en': []},
      recommendations: {
        'ru': List<String>.from(profile['recommendations']?['ru'] ?? []),
        'en': List<String>.from(profile['recommendations']?['en'] ?? []),
      },
      tryToday: Map<String, String>.from(profile['tryToday'] ?? {'ru': '', 'en': ''}),
      inspiringConclusion: Map<String, String>.from(profile['inspiringMessage'] ?? {'ru': '', 'en': ''}),
    );
  }

  /// Конвертация FriendshipProfile в универсальный TestProfile
  static TestProfile? _convertFriendshipProfile(FriendshipProfile? profile) {
    if (profile == null) return null;
    return TestProfile(
      id: profile.id,
      name: profile.name,
      description: profile.description,
      whyThisProfile: {
        'ru': 'Основано на вашем стиле дружбы',
        'en': 'Based on your friendship style',
      },
      strengths: profile.characteristics,
      vulnerabilities: profile.vulnerabilities,
      recommendations: profile.recommendations,
      tryToday: profile.tryToday,
      inspiringConclusion: profile.inspiringMessage,
    );
  }
}
