import 'test_stub.dart';

/// Test stub for Imposter Syndrome Test
///
/// Based on research by Pauline Clance and Suzanne Imes (1978)
/// Measures 6 components of imposter syndrome
class ImposterSyndromeTest extends TestStub {
  @override
  String get id => 'imposter_syndrome';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Синдром самозванца',
        'en': 'Imposter Syndrome',
      };

  @override
  Map<String, String> get description => {
        'ru': 'Синдром самозванца — это психологический феномен, при котором человек '
            'не может приписать свои достижения собственным усилиям и способностям. '
            'Люди с этим синдромом постоянно сомневаются в себе, боятся быть «разоблаченными» '
            'как некомпетентные, несмотря на объективные доказательства их успешности.',
        'en': 'Imposter syndrome is a psychological phenomenon where a person cannot '
            'attribute their achievements to their own efforts and abilities. '
            'People with this syndrome constantly doubt themselves and fear being "exposed" '
            'as incompetent, despite objective evidence of their success.',
      };

  @override
  int get questionCount => 42;

  @override
  int get estimatedMinutes => 10;

  @override
  List<String> get tags => ['self-esteem', 'confidence', 'perfectionism', 'anxiety'];

  @override
  String get type => 'multi_factor';

  @override
  String get assetPath => ''; // Using Legacy Dart data

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Based on Clance & Imes (1978) research',
        'theoretical_basis': [
          'Clance & Imes (1978) - Imposter Phenomenon',
          'Leary et al. (2000) - Self-Presentation Theory',
          'Weiner (1985) - Attribution Theory',
          'Hewitt & Flett (1991) - Perfectionism Theory',
          'Bandura (1997) - Self-Efficacy Theory',
        ],
        'factors': [
          'fear_of_exposure',
          'achievement_devaluation',
          'perfectionism',
          'challenge_avoidance',
          'external_attribution',
          'overcompensation',
        ],
        'reversed_questions': [4, 10, 17, 24, 30, 38],
        'response_type': 'likert_5',
        'scoring': [0, 1, 2, 3, 4],
        'category_display': 'Эмоциональное благополучие',
      };
}
