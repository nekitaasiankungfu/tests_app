/// Custom exceptions for data validation errors
/// Used to provide clear error messages when JSON deserialization fails

/// Base exception for all validation errors
class ValidationException implements Exception {
  final String message;
  final String? field;
  final dynamic value;
  final StackTrace? stackTrace;

  ValidationException(
    this.message, {
    this.field,
    this.value,
    this.stackTrace,
  });

  @override
  String toString() {
    final buffer = StringBuffer('ValidationException: $message');
    if (field != null) {
      buffer.write(' (field: $field');
      if (value != null) {
        buffer.write(', value: $value');
      }
      buffer.write(')');
    }
    return buffer.toString();
  }
}

/// Exception thrown when a required field is missing or null
class MissingFieldException extends ValidationException {
  MissingFieldException(String field)
      : super(
          'Required field "$field" is missing or null',
          field: field,
        );
}

/// Exception thrown when a field has an invalid type
class InvalidTypeException extends ValidationException {
  final Type expectedType;
  final Type? actualType;

  InvalidTypeException(
    String field,
    this.expectedType, {
    this.actualType,
    dynamic value,
  }) : super(
          'Field "$field" has invalid type. Expected $expectedType${actualType != null ? ', got $actualType' : ''}',
          field: field,
          value: value,
        );
}

/// Exception thrown when a numeric value is out of valid range
class RangeValidationException extends ValidationException {
  final num min;
  final num max;

  RangeValidationException(
    String field,
    num value,
    this.min,
    this.max,
  ) : super(
          'Field "$field" value $value is out of valid range [$min, $max]',
          field: field,
          value: value,
        );
}

/// Exception thrown when a string format is invalid
class FormatValidationException extends ValidationException {
  final String expectedFormat;

  FormatValidationException(
    String field,
    String value,
    this.expectedFormat,
  ) : super(
          'Field "$field" has invalid format. Expected: $expectedFormat',
          field: field,
          value: value,
        );
}

/// Exception thrown when a collection is empty but shouldn't be
class EmptyCollectionException extends ValidationException {
  EmptyCollectionException(String field)
      : super(
          'Field "$field" cannot be empty',
          field: field,
        );
}

/// Exception thrown when a date/time string cannot be parsed
class DateTimeParseException extends ValidationException {
  DateTimeParseException(String field, String value)
      : super(
          'Field "$field" contains invalid date/time format',
          field: field,
          value: value,
        );
}

/// Exception thrown when enum value is invalid
class InvalidEnumException extends ValidationException {
  final List<dynamic> validValues;

  InvalidEnumException(
    String field,
    dynamic value,
    this.validValues,
  ) : super(
          'Field "$field" has invalid enum value "$value". Valid values: ${validValues.join(', ')}',
          field: field,
          value: value,
        );
}

/// Exception thrown when JSON structure is completely invalid
class MalformedJsonException extends ValidationException {
  MalformedJsonException(String message, {dynamic value})
      : super(
          'Malformed JSON: $message',
          value: value,
        );
}
