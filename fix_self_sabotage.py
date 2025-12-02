#!/usr/bin/env python3
"""Fix self_sabotage_data.dart syntax to use correct model types"""

import re

# Read the current broken file
with open('lib/data/self_sabotage_data.dart', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Process line by line to fix Question -> QuestionModel
fixed_lines = []
in_question = False
question_buffer = []
factor_map = {
    range(1, 7): 'procrastination_avoidance',
    range(7, 13): 'toxic_relationship_patterns',
    range(13, 19): 'self_devaluation',
    range(19, 25): 'fear_success_failure',
}

i = 0
while i < len(lines):
    line = lines[i]

    # Skip old Question/QuestionOption/Factor definitions
    if 'Question(' in line and 'QuestionModel(' not in line:
        # Start capturing question
        question_buffer = [line]
        i += 1
        while i < len(lines) and '),' not in lines[i]:
            question_buffer.append(lines[i])
            i += 1
        if i < len(lines):
            question_buffer.append(lines[i])

        # Extract question ID
        q_text = ''.join(question_buffer)
        q_id_match = re.search(r"id: '(q\d+)'", q_text)
        if q_id_match:
            q_num = int(q_id_match.group(1)[1:])
            factor_id = next((fid for r, fid in factor_map.items() if q_num in r), 'procrastination_avoidance')

            # Extract texts
            text_ru_match = re.search(r"textRu: '([^']+)'", q_text)
            text_en_match = re.search(r"textEn: '([^']+)'", q_text)
            reversed_match = re.search(r"reversed: (\w+)", q_text)

            if text_ru_match and text_en_match:
                # Write corrected QuestionModel
                fixed_lines.append(f"      QuestionModel(\n")
                fixed_lines.append(f"        id: '{q_id_match.group(1)}',\n")
                fixed_lines.append(f"        text: {{\n")
                fixed_lines.append(f"          'ru': '{text_ru_match.group(1)}',\n")
                fixed_lines.append(f"          'en': '{text_en_match.group(1)}',\n")
                fixed_lines.append(f"        }},\n")
                fixed_lines.append(f"        answers: _buildFrequencyAnswers(),\n")
                fixed_lines.append(f"        factorId: '{factor_id}',\n")
                is_reversed = reversed_match.group(1).lower() if reversed_match else 'false'
                fixed_lines.append(f"        isReversed: {is_reversed},\n")
                fixed_lines.append(f"      ),\n")
        i += 1
        continue

    fixed_lines.append(line)
    i += 1

# Write fixed version
with open('lib/data/self_sabotage_data.dart', 'w', encoding='utf-8') as f:
    f.writelines(fixed_lines)

print("✅ Fixed Question → QuestionModel conversions")
print(f"   Processed {len(fixed_lines)} lines")
