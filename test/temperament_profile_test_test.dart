import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/data/test_registry.dart';
import 'package:psycho_app/services/test_loader_service.dart';
import 'package:psycho_app/models/test_model.dart';

void main() {
  group('Temperament Profile Test', () {
    test('should be registered in TestRegistry', () {
      final test = TestRegistry.getTest('temperament_profile_test');
      expect(test, isNotNull);
      expect(test!.id, 'temperament_profile_test');
      expect(test.category, 'temperament');
      expect(test.questionCount, 60);
      expect(test.type, 'multi_factor');
    });

    test('should have correct metadata', () {
      final test = TestRegistry.getTest('temperament_profile_test')!;

      // Check names
      expect(test.name['ru'], 'Профиль темперамента');
      expect(test.name['en'], 'Temperament Profile');

      // Check metadata
      expect(test.metadata['version'], '1.0.0');
      expect(test.metadata['factors'], isNotNull);
      expect(test.metadata['factors'], isA<List>());

      final factors = test.metadata['factors'] as List;
      expect(factors.length, 6);
      expect(factors, containsAll(['ea', 'eu', 'is', 'so', 'tr', 'ga']));
    });

    test('should have correct estimated time', () {
      final test = TestRegistry.getTest('temperament_profile_test')!;
      expect(test.estimatedMinutes, 12);
    });

    test('should have appropriate tags', () {
      final test = TestRegistry.getTest('temperament_profile_test')!;
      expect(test.tags, isNotNull);
      expect(test.tags, contains('temperament'));
      expect(test.tags, contains('personality'));
      expect(test.tags, contains('detailed'));
    });

    test('should load from JSON successfully', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      expect(testModel.id, 'temperament_profile_test');
      expect(testModel.questions.length, 60);
      expect(testModel.type, TestType.multiFactor);
      expect(testModel.factorIds, isNotNull);
      expect(testModel.factorIds!.length, 6);
    });

    test('all questions should have valid factors', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      final expectedFactors = ['ea', 'eu', 'is', 'so', 'tr', 'ga'];

      for (var question in testModel.questions) {
        expect(question.factorId, isNotNull);
        expect(expectedFactors, contains(question.factorId));
        expect(question.answers.length, 5); // Likert scale 1-5
      }
    });

    test('should have exactly 10 questions per factor', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      final factorCounts = <String, int>{};

      for (var question in testModel.questions) {
        final factor = question.factorId!;
        factorCounts[factor] = (factorCounts[factor] ?? 0) + 1;
      }

      // Each factor should have exactly 10 questions
      expect(factorCounts['ea'], 10);
      expect(factorCounts['eu'], 10);
      expect(factorCounts['is'], 10);
      expect(factorCounts['so'], 10);
      expect(factorCounts['tr'], 10);
      expect(factorCounts['ga'], 10);
    });

    test('all questions should have Russian and English text', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      for (var question in testModel.questions) {
        expect(question.text['ru'], isNotNull);
        expect(question.text['en'], isNotNull);
        expect(question.text['ru']!.isNotEmpty, true);
        expect(question.text['en']!.isNotEmpty, true);

        // Check answers are also localized
        for (var answer in question.answers) {
          expect(answer.text['ru'], isNotNull);
          expect(answer.text['en'], isNotNull);
          expect(answer.text['ru']!.isNotEmpty, true);
          expect(answer.text['en']!.isNotEmpty, true);
        }
      }
    });

    test('all answers should have scores 1-5', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      for (var question in testModel.questions) {
        expect(question.answers.length, 5);

        final scores = question.answers.map((a) => a.score).toList();
        scores.sort();

        expect(scores, [1, 2, 3, 4, 5]);
      }
    });

    test('should have reversed questions', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      final reversedQuestions = testModel.questions
          .where((q) => q.isReversed)
          .toList();

      // Should have some reversed questions (approximately 30% of 60 = ~18)
      expect(reversedQuestions.length, greaterThan(15));
      expect(reversedQuestions.length, lessThan(25));
    });

    test('should have disclaimer', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      expect(testModel.disclaimer, isNotNull);
      expect(testModel.disclaimer!['ru'], isNotNull);
      expect(testModel.disclaimer!['en'], isNotNull);
      expect(testModel.disclaimer!['ru']!.length, greaterThan(50));
      expect(testModel.disclaimer!['en']!.length, greaterThan(50));
    });

    test('questions should be in correct order (q1-q60)', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      for (int i = 0; i < 60; i++) {
        final expectedId = 'q${i + 1}';
        expect(testModel.questions[i].id, expectedId);
      }
    });

    test('should be found in category filters', () {
      final temperamentTests = TestRegistry.getByCategory('temperament');
      final testIds = temperamentTests.map((t) => t.id).toList();

      expect(testIds, contains('temperament_profile_test'));
    });

    test('should be found in multi-factor tests', () {
      final multiFactorTests = TestRegistry.getMultiFactorTests();
      final testIds = multiFactorTests.map((t) => t.id).toList();

      expect(testIds, contains('temperament_profile_test'));
    });

    test('should be found in detailed tests (>10 min)', () {
      final detailedTests = TestRegistry.getDetailedTests();
      final testIds = detailedTests.map((t) => t.id).toList();

      expect(testIds, contains('temperament_profile_test'));
    });

    test('factor distribution should be even (EA: q1-q10, EU: q11-q20, etc.)', () async {
      final loader = TestLoaderService();
      final stub = TestRegistry.getTest('temperament_profile_test')!;
      final testModel = await loader.loadTest(stub);

      // EA: q1-q10
      for (int i = 0; i < 10; i++) {
        expect(testModel.questions[i].factorId, 'ea');
      }

      // EU: q11-q20
      for (int i = 10; i < 20; i++) {
        expect(testModel.questions[i].factorId, 'eu');
      }

      // IS: q21-q30
      for (int i = 20; i < 30; i++) {
        expect(testModel.questions[i].factorId, 'is');
      }

      // SO: q31-q40
      for (int i = 30; i < 40; i++) {
        expect(testModel.questions[i].factorId, 'so');
      }

      // TR: q41-q50
      for (int i = 40; i < 50; i++) {
        expect(testModel.questions[i].factorId, 'tr');
      }

      // GA: q51-q60
      for (int i = 50; i < 60; i++) {
        expect(testModel.questions[i].factorId, 'ga');
      }
    });
  });
}
