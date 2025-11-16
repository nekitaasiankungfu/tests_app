#!/usr/bin/env python3
"""
Remove invalid scale references from disc_personality_weights.dart

This script removes all references to scales that don't exist in hierarchical_scales.dart
"""

import re

# List of 46 invalid scales to remove
INVALID_SCALES = {
    'aggression',
    'agreeableness',
    'attention_seeking',
    'autonomy',
    'carefulness',
    'cautiousness',
    'change_resistance',
    'conscientiousness',
    'conservatism',
    'cooperation',
    'courage',
    'cynicism',
    'determination',
    'diplomacy',
    'emotional_awareness',
    'emotional_expressiveness',
    'emotional_stability',
    'energy',
    'enthusiasm',
    'extraversion',
    'feeling',
    'flexibility',
    'independence',
    'inspiration',
    'introversion',
    'judging',
    'leadership',
    'logical_reasoning',
    'objectivity',
    'openness',
    'openness_to_emotions',
    'optimism',
    'orderliness',
    'peacefulness',
    'perceiving',
    'persuasiveness',
    'planning',
    'precision',
    'reliability',
    'routine_preference',
    'self_confidence',
    'sensing',
    'skepticism',
    'social_awareness',
    'talkativeness',
    'thinking',
}

def remove_invalid_scales(file_path):
    """Remove lines containing invalid scale references"""
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    removed_count = 0

    for line in lines:
        # Check if line contains any invalid scale
        # Pattern: 'scale_name': weight,
        match = re.search(r"'([a-z_]+)':\s*-?\d+\.?\d*,?\s*(?://.*)?$", line)
        if match:
            scale_name = match.group(1)
            if scale_name in INVALID_SCALES:
                removed_count += 1
                print(f"Removing: {line.strip()}")
                continue

        new_lines.append(line)

    # Write back
    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)

    print(f"\n✅ Removed {removed_count} lines with invalid scales")
    print(f"✅ File updated: {file_path}")

if __name__ == '__main__':
    file_path = 'lib/config/summary/question_weights/disc_personality_weights.dart'
    remove_invalid_scales(file_path)
