#!/bin/bash
# Complete fix for self_sabotage_data.dart

# Restore from backup
cp lib/data/self_sabotage_data.dart.backup lib/data/self_sabotage_data.dart

# Fix with sed commands
sed -i 's/static final List<Question>/static List<QuestionModel> _buildQuestions() {\n    return [/g' lib/data/self_sabotage_data.dart
sed -i "s/textRu: '/text: {\n          'ru': '/g" lib/data/self_sabotage_data.dart
sed -i "s/',$//',/g" lib/data/self_sabotage_data.dart
sed -i "s/textEn: '/          'en': '/g" lib/data/self_sabotage_data.dart
sed -i 's/options: _frequencyOptions,/        },\n        answers: _buildFrequencyAnswers(),/g' lib/data/self_sabotage_data.dart
sed -i 's/reversed: /factorId: '"'"'TODO'"'"',\n        isReversed: /g' lib/data/self_sabotage_data.dart
sed -i 's/Question(/QuestionModel(\n        id: /g' lib/data/self_sabotage_data.dart
sed -i 's/id: /        id: /g' lib/data/self_sabotage_data.dart

echo "Basic structure fixed"
