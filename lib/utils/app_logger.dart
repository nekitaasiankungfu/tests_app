import 'package:logger/logger.dart';

/// Global app logger instance with custom configuration
///
/// Usage:
/// ```dart
/// appLogger.d('Debug message');
/// appLogger.i('Info message');
/// appLogger.w('Warning message');
/// appLogger.e('Error message', error: e, stackTrace: stackTrace);
/// ```
final appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // Number of method calls to be displayed
    errorMethodCount: 8, // Number of method calls if stacktrace is provided
    lineLength: 120, // Width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false, // Should each log print contain a timestamp
  ),
  level: Level.warning, // Set minimum log level (changed from debug to warning for cleaner test output)
);

/// Production logger with minimal output
final productionLogger = Logger(
  printer: SimplePrinter(
    colors: false,
    printTime: true,
  ),
  level: Level.warning, // Only warnings and errors in production
);
