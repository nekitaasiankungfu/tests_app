# Data Validation Quick Reference Guide

## For Developers Using the Models

### Exception Types

```dart
import 'package:psycho_tests/exceptions/validation_exceptions.dart';

// Catch specific validation errors
try {
  final result = TestResult.fromJson(json);
} on MissingFieldException catch (e) {
  // Handle missing required field
  showError('Required data is missing: ${e.field}');
} on InvalidTypeException catch (e) {
  // Handle wrong data type
  showError('Data format error in field: ${e.field}');
} on RangeValidationException catch (e) {
  // Handle out-of-range values
  showError('Value out of range: ${e.field}');
} on DateTimeParseException catch (e) {
  // Handle date parsing errors
  showError('Invalid date format: ${e.field}');
} on ValidationException catch (e) {
  // Catch-all for any validation error
  showError('Data validation failed: ${e.message}');
} catch (e) {
  // Handle unexpected errors
  showError('Unexpected error: $e');
}
```

### Safe JSON Deserialization

```dart
// BEFORE (unsafe)
final results = (json['completedTests'] as List)
    .map((r) => TestResult.fromJson(r))
    .toList();

// AFTER (safe with error handling)
final results = <TestResult>[];
for (final item in json['completedTests'] as List? ?? []) {
  try {
    results.add(TestResult.fromJson(item));
  } catch (e) {
    appLogger.e('Failed to parse test result', error: e);
    // Optionally skip corrupted results
  }
}
```

### Validation Patterns

#### Pattern 1: Strict Validation (Throw on Error)
```dart
// Use when data integrity is critical
try {
  final result = TestResult.fromJson(json);
  // Proceed only if validation passes
  saveResult(result);
} on ValidationException catch (e) {
  // Show error to user, don't proceed
  showErrorDialog('Data is corrupted: ${e.message}');
}
```

#### Pattern 2: Graceful Degradation
```dart
// Use when you can work with partial data
TestResult? result;
try {
  result = TestResult.fromJson(json);
} catch (e) {
  appLogger.e('Failed to parse result, skipping', error: e);
  result = null; // Continue without this result
}

if (result != null) {
  displayResult(result);
}
```

#### Pattern 3: Batch Processing with Error Recovery
```dart
final results = <TestResult>[];
final errors = <String, dynamic>{};

for (int i = 0; i < jsonList.length; i++) {
  try {
    results.add(TestResult.fromJson(jsonList[i]));
  } catch (e) {
    errors['result_$i'] = e.toString();
    appLogger.w('Skipped corrupted result at index $i', error: e);
  }
}

// Show summary
if (errors.isNotEmpty) {
  showWarning('${errors.length} results were corrupted and skipped');
}
```

## Validation Rules Reference

### TestResult
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| testId | Yes | String | - | - |
| totalScore | Yes | int | >= 0 | - |
| maxScore | Yes | int | >= 1 | - |
| interpretation | Yes | String | - | - |
| completedAt | Yes | DateTime | ISO 8601 | - |
| version | No | int | 1-10 | 1 |
| factorScores | No | Map | - | null |
| userAnswers | No | Map<String, int> | - | null |
| scaleScores | No | Map<String, double> | 0-100 (clamped) | null |
| bipolarScores | No | Map | - | null |
| personalityType | No | String | 4 chars | null |
| qualityValidation | No | Object | - | null |

### FactorScore
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| factorId | Yes | String | - | - |
| factorName | Yes | Map<String, String> | Not empty | - |
| score | Yes | int | >= 0 | - |
| maxScore | Yes | int | >= 1 | - |
| interpretation | Yes | Map<String, String> | Not empty | - |

### QuestionContribution
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| questionId | Yes | String | - | - |
| questionText | Yes | Map<String, String> | - | - |
| answerScore | Yes | int | >= 0 | - |
| maxAnswerScore | Yes | int | >= 1 | - |
| weight | Yes | double | >= 0 (abs) | - |
| normalizedContribution | Yes | double | - | - |

### BipolarDimensionScore
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| dimensionId | Yes | String | - | - |
| positiveScore | Yes | int | >= 0 | - |
| negativeScore | Yes | int | >= 0 | - |
| positiveMaxScore | Yes | int | >= 1 | - |
| negativeMaxScore | Yes | int | >= 1 | - |
| dominantPole | Yes | String | Single uppercase | - |
| normalizedScore | Yes | double | 0-100 (clamped) | - |
| confidenceInterval | No | double | 0-100 | null |

### TestQualityValidation
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| responseVariance | Yes | double | >= 0 | - |
| neutralRate | Yes | double | 0-100 | - |
| consistencyScore | Yes | double | 0-1 | - |
| extremeRate | Yes | double | 0-100 | - |
| qualityLevel | Yes | String | success/warning/error | - |
| issues | Yes | List<String> | - | - |

### SummaryScore
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| axisId | Yes | String | - | - |
| score | Yes | double | 0-100 (clamped) | - |
| rawScore | Yes | double | - | - |
| confidence | Yes | double | 0-1 (clamped) | - |
| contributions | Yes | List | - | - |

### TestContribution
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| testId | Yes | String | - | - |
| testName | Yes | String | - | - |
| scale | Yes | String | - | - |
| score | Yes | double | 0-100 | - |
| weight | Yes | double | >= 0 | - |
| direction | Yes | int | 1 or -1 | 1 |
| contribution | Yes | double | - | - |

### SummaryData
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| axisScores | Yes | Map | - | - |
| confidence | Yes | enum | ConfidenceLevel | low |
| summaryText | Yes | String | - | - |
| advice | Yes | List<String> | - | - |
| strengths | Yes | List<String> | - | - |
| developmentAreas | Yes | List<String> | - | - |
| testInfluences | Yes | List | - | - |
| generatedAt | Yes | DateTime | ISO 8601 | - |

### TestInfluence
| Field | Required | Type | Range/Format | Default |
|-------|----------|------|--------------|---------|
| testId | Yes | String | - | - |
| testName | Yes | String | - | - |
| questionsCount | Yes | int | >= 0 (corrected) | - |
| totalInfluence | Yes | double | >= 0 | - |
| influencedAxes | Yes | List<String> | - | - |

## Type Conversions

### Automatic Conversions
The validation system automatically converts between compatible types:

```dart
// String to int
"80" → 80

// Double to int (truncates)
80.7 → 80

// Int to double
80 → 80.0

// String to double
"75.5" → 75.5
```

### Clamping Behavior
Out-of-range values are automatically clamped:

```dart
// ScaleScores (0-100)
150.0 → 100.0
-10.0 → 0.0

// Confidence (0-1)
1.5 → 1.0
-0.5 → 0.0

// NormalizedScore (0-100)
120.0 → 100.0
```

### Special Handling
```dart
// Negative weights → absolute value
weight: -0.5 → 0.5

// Invalid direction → default to 1
direction: 5 → 1

// Negative questionsCount → 0
questionsCount: -10 → 0

// Missing version → default to 1
version: null → 1

// Invalid confidence enum → low
confidence: 999 → ConfidenceLevel.low
```

## Common Patterns

### Loading Saved Results
```dart
Future<List<TestResult>> loadResults() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('completedTests');

  if (jsonString == null) return [];

  try {
    final jsonList = jsonDecode(jsonString) as List;
    final results = <TestResult>[];

    for (final json in jsonList) {
      try {
        results.add(TestResult.fromJson(json));
      } catch (e) {
        appLogger.w('Skipping corrupted result', error: e);
        // Continue loading other results
      }
    }

    return results;
  } catch (e) {
    appLogger.e('Failed to load results', error: e);
    return [];
  }
}
```

### Saving with Validation
```dart
Future<void> saveResult(TestResult result) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final json = result.toJson();

    // Validate round-trip (ensures data can be loaded back)
    TestResult.fromJson(json);

    final existing = await loadResults();
    existing.add(result);

    final jsonString = jsonEncode(existing.map((r) => r.toJson()).toList());
    await prefs.setString('completedTests', jsonString);
  } catch (e) {
    appLogger.e('Failed to save result', error: e);
    throw Exception('Could not save test result');
  }
}
```

### Data Migration
```dart
Future<void> migrateOldData() async {
  final results = await loadResults();
  int migrated = 0;

  for (int i = 0; i < results.length; i++) {
    if (results[i].needsMigration) {
      try {
        final migrated = migrateToV2(results[i]);
        results[i] = migrated;
        migrated++;
      } catch (e) {
        appLogger.e('Migration failed for result $i', error: e);
      }
    }
  }

  if (migrated > 0) {
    await saveResults(results);
    appLogger.i('Migrated $migrated results to v2');
  }
}
```

## Testing Tips

### Unit Testing Validation
```dart
test('Should throw MissingFieldException for missing testId', () {
  final json = {
    // testId missing
    'totalScore': 80,
    'maxScore': 100,
    'interpretation': 'Good',
    'completedAt': '2025-01-01T12:00:00.000Z',
  };

  expect(
    () => TestResult.fromJson(json),
    throwsA(isA<MissingFieldException>()),
  );
});
```

### Integration Testing
```dart
testWidgets('Should handle corrupted data gracefully', (tester) async {
  // Inject corrupted data
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('completedTests', '[{"invalid": "data"}]');

  // App should not crash
  await tester.pumpWidget(MyApp());
  await tester.pumpAndSettle();

  // Verify error was logged but app is functional
  expect(find.byType(HomeScreen), findsOneWidget);
});
```

## Performance Tips

1. **Batch Validation**: When loading many results, consider adding a progress indicator
2. **Lazy Validation**: For large datasets, validate only when needed
3. **Caching**: Cache validated results to avoid re-validation
4. **Async Loading**: Load and validate data in background isolates for large datasets

## Logging Best Practices

```dart
// ERROR: Critical issues that prevent data usage
appLogger.e('TestResult.fromJson: Required field missing', error: e, stackTrace: st);

// WARNING: Data issues that were auto-corrected
appLogger.w('TestResult.fromJson: Score exceeds maxScore, clamping');

// INFO: Normal operations
appLogger.i('Successfully loaded 10 test results');

// DEBUG: Detailed debugging information
appLogger.d('Validating TestResult for testId: $testId');
```

## Troubleshooting

### Problem: App crashes when loading old data
**Solution**: Check logs for ValidationException, add graceful error handling

### Problem: All results show as corrupted
**Solution**: Verify JSON structure matches expected format, check for breaking changes

### Problem: Performance degradation
**Solution**: Profile validation code, consider lazy loading for large datasets

### Problem: Users losing data
**Solution**: Implement backup/recovery mechanism before validation, add migration path

## References

- Full implementation: `/lib/models/test_model.dart`, `/lib/models/summary_model.dart`
- Exception definitions: `/lib/exceptions/validation_exceptions.dart`
- Test suite: `/test/model_validation_test.dart`
- Implementation notes: `/VALIDATION_IMPLEMENTATION.md`
