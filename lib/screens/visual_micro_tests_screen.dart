import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/visual_micro_tests_model.dart';
import '../models/test_model.dart';
import '../data/visual_micro_tests_data.dart';
import '../services/visual_micro_tests_service.dart';
import '../widgets/visual_micro_test_widget.dart';
import '../providers/locale_provider.dart';
import '../providers/test_provider.dart';
import '../utils/app_logger.dart';
import 'visual_micro_tests_result_screen.dart';

/// Main screen for Visual Micro Tests
///
/// Manages navigation between 10 micro-tests and tracks progress
///
/// @version: 1.0.0
class VisualMicroTestsScreen extends StatefulWidget {
  const VisualMicroTestsScreen({super.key});

  @override
  State<VisualMicroTestsScreen> createState() => _VisualMicroTestsScreenState();
}

class _VisualMicroTestsScreenState extends State<VisualMicroTestsScreen> {
  final VisualMicroTestsService _service = VisualMicroTestsService();
  List<MicroTest>? _microTests;
  int _currentIndex = 0;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadMicroTests();
  }

  Future<void> _loadMicroTests() async {
    try {
      final tests = await VisualMicroTestsData.loadMicroTests();
      if (mounted) {
        setState(() {
          _microTests = tests;
          _isLoading = false;
        });
      }
    } catch (e, stackTrace) {
      appLogger.e('Failed to load Visual Micro Tests', error: e, stackTrace: stackTrace);
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to load tests. Please try again.';
          _isLoading = false;
        });
      }
    }
  }

  void _handleOptionSelected(MicroTestOption option) {
    if (_microTests == null) return;

    final currentTest = _microTests![_currentIndex];
    _service.processAnswer(currentTest.id, option);

    // Move to next test or show results
    if (_currentIndex < _microTests!.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // All tests completed
      _navigateToResults();
    }
  }

  Future<void> _navigateToResults() async {
    try {
      final result = _service.generateResult();

      // Auto-save results immediately
      await _saveResults(result);

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => VisualMicroTestsResultScreen(result: result),
          ),
        );
      }
    } catch (e, stackTrace) {
      appLogger.e('Failed to generate results', error: e, stackTrace: stackTrace);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to generate results. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _saveResults(VisualMicroTestsResult result) async {
    try {
      final testProvider = context.read<TestProvider>();

      // Create user answers map
      final rawAnswers = <String, int>{};
      result.selectedOptions.forEach((microTestId, optionId) {
        rawAnswers[microTestId] = 1; // Mark as answered
      });

      // Save full result as JSON in interpretation field
      final resultJson = jsonEncode(result.toJson());

      // Create TestResult object
      final testResult = TestResult(
        testId: result.testId,
        totalScore: result.topTraits.fold<int>(0, (sum, trait) => sum + trait.score),
        maxScore: result.topTraits.length * 10,
        interpretation: resultJson, // Store full JSON for later restoration
        userAnswers: rawAnswers,
        completedAt: DateTime.now(),
        factorScores: {},
        questionContributions: null,
      );

      // Save the result
      await testProvider.saveTestResult(testResult);
      appLogger.i('Visual Micro Tests result auto-saved: ${result.testId}');
    } catch (e, stackTrace) {
      appLogger.e('Failed to auto-save Visual Micro Tests result', error: e, stackTrace: stackTrace);
      // Don't show error to user - it's auto-save
    }
  }

  void _handleBackPress() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final locale = localeProvider.languageCode;
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        _handleBackPress();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            locale == 'ru' ? 'Визуальные Инсайты' : 'Visual Insights',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _handleBackPress,
          ),
          bottom: _microTests != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(8),
                  child: LinearProgressIndicator(
                    value: (_currentIndex + 1) / _microTests!.length,
                    backgroundColor: theme.colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    ),
                  ),
                )
              : null,
        ),
        body: _buildBody(context, locale),
      ),
    );
  }

  Widget _buildBody(BuildContext context, String locale) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                  _loadMicroTests();
                },
                child: Text(locale == 'ru' ? 'Повторить' : 'Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_microTests == null || _microTests!.isEmpty) {
      return Center(
        child: Text(
          locale == 'ru' ? 'Тесты не найдены' : 'No tests found',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    final currentTest = _microTests![_currentIndex];

    return Column(
      children: [
        // Progress indicator with count
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                locale == 'ru'
                    ? 'Микротест ${_currentIndex + 1} из ${_microTests!.length}'
                    : 'Micro-test ${_currentIndex + 1} of ${_microTests!.length}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),

        // Current micro-test
        Expanded(
          child: VisualMicroTestWidget(
            microTest: currentTest,
            languageCode: locale,
            onOptionSelected: _handleOptionSelected,
            selectedOptionId: _service.getSelectedOption(currentTest.id),
          ),
        ),
      ],
    );
  }
}
