#!/usr/bin/env python3
"""
Restore bipolar scale weights to disc_personality_weights.dart

This script restores weights for bipolar personality type scales that were
incorrectly removed. Only restores POSITIVE weights (no negative weights allowed).
"""

import re

# Bipolar poles that need to be restored
BIPOLAR_SCALES = {
    'extraversion',
    'introversion',
    'sensing',
    'intuition',
    'thinking',
    'feeling',
    'judging',
    'perceiving',
}

def extract_bipolar_weights_from_backup(backup_path):
    """Extract all positive bipolar weights from backup file"""
    with open(backup_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Parse question blocks
    question_pattern = r"'(disc_personality_v1:q\d+)':\s*QuestionWeight\((.*?)\),\s*(?=//|'disc_personality_v1:q|\})"

    bipolar_weights = {}  # question_id -> list of (scale, weight, comment)

    for match in re.finditer(question_pattern, content, re.DOTALL):
        question_id = match.group(1)
        block = match.group(2)

        # Find all weights in this block
        weight_pattern = r"'([a-z_]+)':\s*(-?\d+\.?\d*),?\s*(?://\s*(.+?))?\s*$"

        weights_for_question = []
        for line in block.split('\n'):
            weight_match = re.search(weight_pattern, line)
            if weight_match:
                scale = weight_match.group(1)
                weight_val = float(weight_match.group(2))
                comment = weight_match.group(3) if weight_match.group(3) else ''

                # Only keep positive weights for bipolar scales
                if scale in BIPOLAR_SCALES and weight_val > 0:
                    weights_for_question.append((scale, weight_val, comment.strip()))

        if weights_for_question:
            bipolar_weights[question_id] = weights_for_question

    return bipolar_weights

def restore_weights_to_file(file_path, bipolar_weights):
    """Add bipolar weights back to the current file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    restored_count = 0

    while i < len(lines):
        line = lines[i]
        new_lines.append(line)

        # Check if this is a question definition
        match = re.search(r"'(disc_personality_v1:q\d+)':", line)
        if match:
            question_id = match.group(1)

            # Find the axisWeights block
            while i < len(lines) and 'axisWeights: {' not in lines[i]:
                i += 1
                new_lines.append(lines[i])

            if i < len(lines):
                # Now at axisWeights: { line
                i += 1
                if i < len(lines):
                    # Collect existing weights
                    existing_weights = []
                    start_of_weights = len(new_lines)

                    while i < len(lines) and '},' not in lines[i]:
                        existing_weights.append(lines[i])
                        new_lines.append(lines[i])
                        i += 1

                    # Check if we have bipolar weights to restore
                    if question_id in bipolar_weights:
                        # Add bipolar weights before the closing brace
                        for scale, weight, comment in bipolar_weights[question_id]:
                            comment_str = f' // {comment}' if comment else ''
                            weight_line = f"        '{scale}': {weight},{comment_str}\n"
                            new_lines.insert(len(new_lines), weight_line)
                            restored_count += 1

                    # Add the closing brace
                    if i < len(lines):
                        new_lines.append(lines[i])  # },

        i += 1

    # Write back
    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)

    print(f"✅ Restored {restored_count} bipolar weights")
    return restored_count

if __name__ == '__main__':
    backup_file = 'lib/config/summary/question_weights/disc_personality_weights.dart.backup'
    target_file = 'lib/config/summary/question_weights/disc_personality_weights.dart'

    print("Extracting bipolar weights from backup...")
    bipolar_weights = extract_bipolar_weights_from_backup(backup_file)

    print(f"Found bipolar weights for {len(bipolar_weights)} questions")

    print("\nRestoring weights to current file...")
    count = restore_weights_to_file(target_file, bipolar_weights)

    print(f"\n✅ Done! Restored {count} bipolar weight entries")
