/// Tool to convert existing Dart test files to JSON format.
///
/// Run with: dart run tools/convert_tests_to_json.dart
///
/// This script reads the existing test data from Dart files and generates
/// corresponding JSON files in assets/tests/ directory.

import 'dart:io';
import 'dart:convert';
import '../lib/data/ipip_big_five_data.dart';
import '../lib/data/fisher_temperament_data.dart';
import '../lib/data/love_profile_data.dart';
import '../lib/data/sixteen_types_data.dart';

void main() async {
  print('🔄 Converting tests to JSON format...\n');

  // Create output directory if it doesn't exist
  final outputDir = Directory('assets/tests');
  if (!await outputDir.exists()) {
    await outputDir.create(recursive: true);
    print('✅ Created directory: assets/tests/\n');
  }

  // Convert each test
  await convertTest(
    'IPIP Big Five',
    'ipip_big_five.json',
    IPIPBigFiveData.getIPIPBigFiveTest(),
  );

  await convertTest(
    'Fisher Temperament',
    'fisher_temperament.json',
    FisherTemperamentData.getFisherTemperamentTest(),
  );

  await convertTest(
    'Love Profile',
    'love_profile.json',
    LoveProfileData.getLoveProfileTest(),
  );

  await convertTest(
    'Sixteen Types',
    'sixteen_types.json',
    SixteenTypesData.getSixteenTypesTest(),
  );

  print('\n✅ All tests converted successfully!');
  print('📁 JSON files saved to: assets/tests/');
}

Future<void> convertTest(
  String testName,
  String filename,
  dynamic testModel,
) async {
  print('Converting: $testName');

  // Convert TestModel to JSON
  final json = testModel.toJson();

  // Format JSON with indentation
  final encoder = JsonEncoder.withIndent('  ');
  final jsonString = encoder.convert(json);

  // Write to file
  final file = File('assets/tests/$filename');
  await file.writeAsString(jsonString);

  final fileSize = (await file.length() / 1024).toStringAsFixed(1);
  print('  ✅ Saved: $filename ($fileSize KB)');
  print('  📊 Questions: ${json['questions'].length}');
  print('');
}
