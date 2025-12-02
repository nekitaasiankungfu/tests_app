import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/test_model.dart';
import '../data/test_data.dart';
import '../utils/app_logger.dart';
import '../constants/app_constants.dart';

class TestProvider with ChangeNotifier {
  List<TestModel> _tests = [];
  List<TestResult> _completedTests = [];
  bool _isLoading = false;
  String? _lastError;

  List<TestModel> get tests => _tests;
  List<TestResult> get completedTests => _completedTests;
  bool get isLoading => _isLoading;
  String? get lastError => _lastError;

  TestProvider() {
    _loadTests();
    _loadCompletedTests();
  }

  Future<void> _loadTests() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tests = await TestData.getTests();
      _lastError = null;
      appLogger.i('Tests loaded: ${_tests.length} tests available');
    } catch (e, stackTrace) {
      appLogger.e('Failed to load tests', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось загрузить тесты';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadCompletedTests() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final String? testsJson = prefs.getString(AppConstants.completedTestsKey);

      if (testsJson != null) {
        final List<dynamic> testsList = json.decode(testsJson);
        _completedTests = testsList
            .map((test) => TestResult.fromJson(test))
            .toList();
        appLogger.i('Completed tests loaded: ${_completedTests.length} results');

        // DEBUG: Check if questionContributions are loaded
        for (final result in _completedTests) {
          appLogger.d('  - ${result.testId}: questionContributions is ${result.questionContributions == null ? "null" : "not null (${result.questionContributions!.length} scales)"}');
        }
      } else {
        appLogger.d('No completed tests found');
      }

      _lastError = null;
    } catch (e, stackTrace) {
      appLogger.e('Failed to load completed tests', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось загрузить завершенные тесты';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> saveTestResult(TestResult result) async {
    try {
      appLogger.d('Добавление результата в список, всего тестов: ${_completedTests.length + 1}');
      _completedTests.add(result);
      notifyListeners();
      appLogger.d('notifyListeners вызван');

      final prefs = await SharedPreferences.getInstance();
      appLogger.d('Начало сериализации ${_completedTests.length} результатов в JSON');
      final String testsJson = json.encode(
        _completedTests.map((test) => test.toJson()).toList(),
      );
      appLogger.d('JSON создан, размер: ${testsJson.length} символов');
      await prefs.setString(AppConstants.completedTestsKey, testsJson);
      appLogger.d('Результат сохранён в SharedPreferences');

      _lastError = null;
      appLogger.i('Test result saved: testId=${result.testId}, score=${result.percentage.toStringAsFixed(1)}%');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to save test result', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось сохранить результат теста';
      // Revert the change
      _completedTests.removeLast();
      notifyListeners();
      return false;
    }
  }

  TestModel? getTestById(String id) {
    try {
      return _tests.firstWhere((test) => test.id == id);
    } catch (e) {
      appLogger.w('Test not found: id=$id');
      return null;
    }
  }

  TestResult? getTestResult(String testId) {
    try {
      // Возвращаем последний результат теста (последний пройденный)
      return _completedTests.lastWhere((result) => result.testId == testId);
    } catch (e) {
      appLogger.d('No result found for test: testId=$testId');
      return null;
    }
  }

  /// Gets all results for a specific test
  List<TestResult> getAllTestResults(String testId) {
    return _completedTests.where((result) => result.testId == testId).toList();
  }

  Future<bool> deleteTestResult(TestResult result) async {
    final index = _completedTests.indexOf(result);
    if (index == -1) {
      appLogger.w('Test result not found for deletion');
      return false;
    }

    try {
      _completedTests.removeAt(index);
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final String testsJson = json.encode(
        _completedTests.map((test) => test.toJson()).toList(),
      );
      await prefs.setString(AppConstants.completedTestsKey, testsJson);

      _lastError = null;
      appLogger.i('Test result deleted: testId=${result.testId}');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to delete test result', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось удалить результат теста';
      // Revert the change
      _completedTests.insert(index, result);
      notifyListeners();
      return false;
    }
  }

  /// Clears all test results
  Future<bool> clearAllTests() async {
    try {
      _completedTests.clear();
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(AppConstants.completedTestsKey);

      _lastError = null;
      appLogger.i('All test results cleared');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to clear all test results', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось очистить результаты тестов';
      return false;
    }
  }

  /// Clears the last error message
  void clearError() {
    _lastError = null;
    notifyListeners();
  }
}
