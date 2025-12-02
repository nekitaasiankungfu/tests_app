/// Tool to convert legacy Dart test files to JSON format.
///
/// Run with: dart run tools/convert_legacy_tests.dart
///
/// This script loads tests from Dart files and exports them as JSON.

import 'dart:io';
import 'dart:convert';
import '../lib/data/ipip_big_five_data.dart';
import '../lib/data/fisher_temperament_data.dart';
import '../lib/data/love_profile_data.dart';
import '../lib/data/sixteen_types_data.dart';

void main() async {
  print('🔄 Converting legacy tests to JSON format...\n');

  // Create output directory
  final outputDir = Directory('assets/tests');
  if (!await outputDir.exists()) {
    await outputDir.create(recursive: true);
    print('✅ Created directory: assets/tests/\n');
  }

  int successCount = 0;
  int failCount = 0;

  // Convert each test
  successCount += await convertTest(
        'IPIP Big Five',
        'ipip_big_five.json',
        IPIPBigFiveData.getIPIPBigFiveTest(),
      )
      ? 1
      : 0;

  successCount += await convertTest(
        'Fisher Temperament',
        'fisher_temperament.json',
        FisherTemperamentData.getFisherTemperamentTest(),
      )
      ? 1
      : 0;

  successCount += await convertTest(
        'Love Profile',
        'love_profile.json',
        LoveProfileData.getLoveProfileTest(),
      )
      ? 1
      : 0;

  successCount += await convertTest(
        'Sixteen Types',
        'sixteen_types.json',
        SixteenTypesData.getSixteenTypesTest(),
      )
      ? 1
      : 0;

  print('\n' + '=' * 60);
  print('✅ Conversion complete!');
  print('   Success: $successCount tests');
  if (failCount > 0) {
    print('   Failed: $failCount tests');
  }
  print('📁 JSON files saved to: assets/tests/');
  print('=' * 60);
}

Future<bool> convertTest(
  String testName,
  String filename,
  dynamic testModel,
) async {
  try {
    print('📝 Converting: $testName');

    // Convert TestModel to JSON
    final json = testModel.toJson();

    // Format JSON with indentation
    final encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(json);

    // Write to file
    final file = File('assets/tests/$filename');
    await file.writeAsString(jsonString);

    // Get file stats
    final fileSize = (await file.length() / 1024).toStringAsFixed(1);
    final questionCount = (json['questions'] as List).length;

    print('   ✅ Saved: $filename ($fileSize KB)');
    print('   📊 Questions: $questionCount');
    print('');

    return true;
  } catch (e, stackTrace) {
    print('   ❌ Error: $e');
    print('   Stack trace: $stackTrace');
    print('');
    return false;
  }
}
