/// Tool to generate boilerplate for a new test.
///
/// Usage:
/// ```bash
/// dart run tools/create_new_test.dart \
///   --id=anxiety_test \
///   --name-ru="Тест на тревожность" \
///   --name-en="Anxiety Test" \
///   --category=mental_health \
///   --questions=20
/// ```
///
/// This creates:
/// - lib/data/tests/{id}_test.dart (stub file)
/// - assets/tests/{id}.json (template JSON)

import 'dart:io';

void main(List<String> arguments) async {
  // Parse arguments
  final args = parseArguments(arguments);

  if (args.isEmpty || args.containsKey('help')) {
    printHelp();
    return;
  }

  // Required parameters
  final id = args['id'];
  final nameRu = args['name-ru'];
  final nameEn = args['name-en'];
  final category = args['category'] ?? 'personality';
  final questions = int.tryParse(args['questions'] ?? '10') ?? 10;

  if (id == null || nameRu == null || nameEn == null) {
    print('❌ Error: --id, --name-ru, and --name-en are required\n');
    printHelp();
    exit(1);
  }

  print('🚀 Creating new test: $id');
  print('   Name (RU): $nameRu');
  print('   Name (EN): $nameEn');
  print('   Category: $category');
  print('   Questions: $questions\n');

  // Create files
  await createStubFile(id, nameRu, nameEn, category, questions);
  await createJsonTemplate(id, questions);

  print('\n✅ Test created successfully!');
  print('\n📝 Next steps:');
  print('   1. Edit assets/tests/$id.json to add questions');
  print('   2. Add test to lib/data/test_registry.dart');
  print('   3. Update tags and metadata as needed');
}

/// Create Dart stub file
Future<void> createStubFile(
  String id,
  String nameRu,
  String nameEn,
  String category,
  int questions,
) async {
  final className = toPascalCase(id);
  final estimatedMinutes = (questions / 4).ceil();

  final content = '''import 'test_stub.dart';

/// $nameEn
///
/// TODO: Add detailed description
class $className extends TestStub {
  @override
  String get id => '$id';

  @override
  String get category => '$category';

  @override
  Map<String, String> get name => {
        'ru': '$nameRu',
        'en': '$nameEn',
      };

  @override
  Map<String, String> get description => {
        'ru': 'TODO: Добавьте описание теста',
        'en': 'TODO: Add test description',
      };

  @override
  int get questionCount => $questions;

  @override
  int get estimatedMinutes => $estimatedMinutes;

  @override
  String get type => 'simple'; // or 'multi_factor'

  @override
  List<String> get tags => [
        '$category',
        // TODO: Add more tags
      ];

  @override
  String get assetPath => 'assets/tests/$id.json';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Psycho Tests',
        'category_display': {
          'ru': '${categoryDisplayName(category, 'ru')}',
          'en': '${categoryDisplayName(category, 'en')}',
        },
      };
}
''';

  final file = File('lib/data/tests/${id}.dart');
  await file.writeAsString(content);

  print('✅ Created: lib/data/tests/${id}.dart');
}

/// Create JSON template
Future<void> createJsonTemplate(String id, int questions) async {
  final questionsJson = List.generate(
    questions,
    (index) => {
      'id': 'q${index + 1}',
      'text': {
        'ru': 'TODO: Вопрос ${index + 1}',
        'en': 'TODO: Question ${index + 1}',
      },
      'answers': [
        {
          'id': 'a1',
          'text': {'ru': 'Вариант 1', 'en': 'Option 1'},
          'score': 1,
        },
        {
          'id': 'a2',
          'text': {'ru': 'Вариант 2', 'en': 'Option 2'},
          'score': 2,
        },
        {
          'id': 'a3',
          'text': {'ru': 'Вариант 3', 'en': 'Option 3'},
          'score': 3,
        },
      ],
    },
  );

  final json = {
    'id': id,
    'version': '1.0.0',
    'type': 'simple',
    'questions': questionsJson,
    'interpretations': {
      'ru': {
        '0-10': {
          'level': 'low',
          'title': 'TODO: Низкий уровень',
          'description': 'TODO: Описание',
        },
        '11-20': {
          'level': 'high',
          'title': 'TODO: Высокий уровень',
          'description': 'TODO: Описание',
        },
      },
      'en': {
        '0-10': {
          'level': 'low',
          'title': 'TODO: Low level',
          'description': 'TODO: Description',
        },
        '11-20': {
          'level': 'high',
          'title': 'TODO: High level',
          'description': 'TODO: Description',
        },
      },
    },
  };

  // Format JSON
  final encoder = const JsonEncoder.withIndent('  ');
  final jsonString = encoder.convert(json);

  // Ensure directory exists
  final dir = Directory('assets/tests');
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  final file = File('assets/tests/$id.json');
  await file.writeAsString(jsonString);

  print('✅ Created: assets/tests/$id.json');
}

/// Parse command-line arguments
Map<String, String> parseArguments(List<String> args) {
  final result = <String, String>{};

  for (final arg in args) {
    if (arg.startsWith('--')) {
      final parts = arg.substring(2).split('=');
      if (parts.length == 2) {
        result[parts[0]] = parts[1];
      } else if (parts.length == 1) {
        result[parts[0]] = 'true';
      }
    }
  }

  return result;
}

/// Convert snake_case to PascalCase
String toPascalCase(String input) {
  return input
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join('');
}

/// Get category display name
String categoryDisplayName(String category, String lang) {
  final names = {
    'personality': {'ru': 'Личность', 'en': 'Personality'},
    'mental_health': {'ru': 'Ментальное здоровье', 'en': 'Mental Health'},
    'relationships': {'ru': 'Отношения', 'en': 'Relationships'},
    'intelligence': {'ru': 'Интеллект', 'en': 'Intelligence'},
    'career': {'ru': 'Карьера', 'en': 'Career'},
  };

  return names[category]?[lang] ?? category;
}

/// Print help message
void printHelp() {
  print('''
🔧 Test Generator Tool

Usage:
  dart run tools/create_new_test.dart [options]

Required options:
  --id=<test_id>           Test identifier (snake_case)
  --name-ru=<name>         Test name in Russian
  --name-en=<name>         Test name in English

Optional options:
  --category=<category>    Category (default: personality)
  --questions=<number>     Number of questions (default: 10)
  --help                   Show this help

Categories:
  personality, mental_health, relationships, intelligence, career

Example:
  dart run tools/create_new_test.dart \\
    --id=anxiety_test \\
    --name-ru="Тест на тревожность" \\
    --name-en="Anxiety Test" \\
    --category=mental_health \\
    --questions=20

This will create:
  - lib/data/tests/anxiety_test.dart
  - assets/tests/anxiety_test.json
''');
}
