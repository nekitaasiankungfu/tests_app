// Test file to verify weight files compile correctly
import 'lib/config/summary/question_weights/fisher_temperament_weights.dart';
import 'lib/config/summary/question_weights/love_profile_weights.dart';
import 'lib/config/summary/question_weights/temperament_profile_test_weights.dart';
import 'lib/config/summary/question_weights/digital_detox_weights.dart';
import 'lib/config/summary/question_weights/burnout_diagnostic_weights.dart';

void main() {
  // Test that all weight maps compile without duplicate key errors

  print('Testing Fisher Temperament Weights...');
  final fisherWeights = FisherTemperamentWeights.weights;
  print('  Fisher Q3 weights: ${fisherWeights['fisher_temperament:q3']?.axisWeights.keys.toList()}');

  print('Testing Love Profile Weights...');
  final loveWeights = LoveProfileWeights.weights;
  print('  Love IU_19 weights: ${loveWeights['love_profile:IU_19']?.axisWeights.keys.toList()}');

  print('Testing Temperament Profile Weights...');
  final tempWeights = TemperamentProfileTestWeights.weights;
  print('  Temp Q19 weights: ${tempWeights['temperament_profile_test:q19']?.axisWeights.keys.toList()}');

  print('Testing Digital Detox Weights...');
  final detoxWeights = DigitalDetoxWeights.weights;
  print('  Detox Q24 weights: ${detoxWeights['digital_detox_test:q24']?.axisWeights.keys.toList()}');

  print('Testing Burnout Diagnostic Weights...');
  final burnoutWeights = BurnoutDiagnosticWeights.weights;
  print('  Burnout Q1 weights: ${burnoutWeights['burnout_diagnostic_v1:q1']?.axisWeights.keys.toList()}');

  print('\nAll weight files compiled successfully! No duplicate key errors.');
}
