/// Adapter to provide backward compatibility with old TestData.getTests() API
///
/// This allows existing code to continue working while we migrate to the new
/// TestRegistry + TestLoaderService architecture.

import '../models/test_model.dart';
import '../services/test_loader_service.dart';
import 'test_registry.dart';
import '../utils/app_logger.dart';

class TestData {
  static final _loader = TestLoaderService();

  /// Get all tests (async version)
  ///
  /// Note: This loads all tests into memory. For better performance,
  /// consider using TestRegistry + TestLoaderService directly.
  static Future<List<TestModel>> getTests() async {
    appLogger.i('Loading all tests via adapter');

    final tests = <TestModel>[];

    for (final stub in TestRegistry.allTests) {
      // Skip special tests that use custom screens (don't use TestModel)
      if (stub.type == 'special') {
        appLogger.d('Skipping special test ${stub.id} (uses custom screen)');
        continue;
      }

      try {
        final test = await _loader.loadTest(stub);
        tests.add(test);
      } catch (e) {
        appLogger.e('Failed to load test ${stub.id} in adapter: $e');
        // Continue loading other tests
      }
    }

    appLogger.i('Loaded ${tests.length}/${TestRegistry.allTests.length} tests');
    return tests;
  }

  /// Get single test by ID
  static Future<TestModel?> getTestById(String id) async {
    final stub = TestRegistry.getTest(id);
    if (stub == null) {
      appLogger.w('Test not found: $id');
      return null;
    }

    try {
      return await _loader.loadTest(stub);
    } catch (e) {
      appLogger.e('Failed to load test $id: $e');
      return null;
    }
  }

  /// Clear test cache
  static void clearCache() {
    _loader.clearCache();
  }

  /// Get interpretation for stress test
  static String getStressInterpretation(int score) {
    if (score <= 5) {
      return 'Низкий уровень стресса. Вы хорошо справляетесь со стрессовыми ситуациями.';
    } else if (score <= 10) {
      return 'Умеренный уровень стресса. Рекомендуется больше отдыхать и расслабляться.';
    } else if (score <= 15) {
      return 'Высокий уровень стресса. Стоит обратиться к специалисту или изменить образ жизни.';
    } else {
      return 'Очень высокий уровень стресса. Настоятельно рекомендуется обратиться к психологу.';
    }
  }

  /// Get interpretation for self-esteem test
  static String getSelfEsteemInterpretation(int score) {
    if (score >= 16) {
      return 'Высокая самооценка. Вы уверены в себе и своих способностях.';
    } else if (score >= 12) {
      return 'Умеренная самооценка. Есть потенциал для роста уверенности в себе.';
    } else if (score >= 8) {
      return 'Низкая самооценка. Рекомендуется работа над самопринятием и развитием уверенности.';
    } else {
      return 'Очень низкая самооценка. Настоятельно рекомендуется обратиться к психологу.';
    }
  }
}
