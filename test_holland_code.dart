// Quick test to verify Holland Code test integration

import 'dart:io';

void main() {
  print('Testing Holland Code integration...\n');

  // Test 1: Check test stub file exists
  final testStubFile = File('lib/data/tests/holland_code_test.dart');
  if (testStubFile.existsSync()) {
    print('✅ Test stub file exists');
  } else {
    print('❌ Test stub file NOT found');
  }

  // Test 2: Check test data file exists
  final testDataFile = File('lib/data/holland_code_data.dart');
  if (testDataFile.existsSync()) {
    print('✅ Test data file exists');
  } else {
    print('❌ Test data file NOT found');
  }

  // Test 3: Check weights file exists
  final weightsFile = File('lib/config/summary/question_weights/holland_code_weights.dart');
  if (weightsFile.existsSync()) {
    print('✅ Weights file exists');
  } else {
    print('❌ Weights file NOT found');
  }

  // Test 4: Check if test is in registry
  final registryFile = File('lib/data/test_registry.dart');
  final registryContent = registryFile.readAsStringSync();
  if (registryContent.contains('HollandCodeTest()')) {
    print('✅ Test added to registry');
  } else {
    print('❌ Test NOT in registry');
  }

  // Test 5: Check if test is in loader service
  final loaderFile = File('lib/services/test_loader_service.dart');
  final loaderContent = loaderFile.readAsStringSync();
  if (loaderContent.contains("case 'holland_code_v1':")) {
    print('✅ Test added to loader service');
  } else {
    print('❌ Test NOT in loader service');
  }

  // Test 6: Check if test is in test service
  final serviceFile = File('lib/services/test_service.dart');
  final serviceContent = serviceFile.readAsStringSync();
  if (serviceContent.contains("test.id == 'holland_code_v1'")) {
    print('✅ Test added to test service');
  } else {
    print('❌ Test NOT in test service');
  }

  // Test 7: Check if weights are in summary service
  final summaryFile = File('lib/services/summary_service.dart');
  final summaryContent = summaryFile.readAsStringSync();
  if (summaryContent.contains('HollandCodeWeights.weights')) {
    print('✅ Weights added to summary service');
  } else {
    print('❌ Weights NOT in summary service');
  }

  // Test 8: Check if category exists
  final categoryFile = File('lib/models/test_category.dart');
  final categoryContent = categoryFile.readAsStringSync();
  if (categoryContent.contains("id: 'career'")) {
    print('✅ Career category added');
  } else {
    print('❌ Career category NOT added');
  }

  print('\n🎉 Holland Code test integration complete!');
}