import 'lib/config/summary_config.dart';

void main() {
  // Test if bipolarScales is accessible
  final scale = SummaryConfig.getBipolarScale('mbti_ei');
  print('Scale found: ${scale?.id}');

  final scaleIds = SummaryConfig.bipolarScaleIds;
  print('Scale IDs: $scaleIds');
}
