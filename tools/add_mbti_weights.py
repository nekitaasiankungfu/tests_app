#!/usr/bin/env python3
"""
Script to add MBTI personality type weights to existing test question weights.

Adds weights for 8 MBTI scales:
- extraversion / introversion
- sensing / intuition
- thinking / feeling
- judging / perceiving

Weight range: 0.1-0.5 (flexible, based on question relevance)
"""

import re
import sys

# MBTI scale mapping logic
# Each entry: (keyword patterns, scale_id, weight)
MBTI_MAPPINGS = {
    # Extraversion / Introversion
    'extraversion': [
        (r'party|social|talk|people|outgoing|gregarious|lively|assertive|active|enthusiasm', 'extraversion', 0.4),
        (r'comfortable.*people|enjoy.*company|social.*confidence', 'extraversion', 0.3),
        (r'warm|friendly|approachable', 'extraversion', 0.2),
    ],
    'introversion': [
        (r"don't talk|quiet|reserved|solitude|alone|withdrawn|shy", 'introversion', 0.4),
        (r'introspective|reflective|depth', 'introversion', 0.3),
        (r'private|self.*conscious', 'introversion', 0.2),
    ],

    # Sensing / Intuition
    'sensing': [
        (r'concrete|practical|details|facts|present|hands.*on|realistic|literal', 'sensing', 0.4),
        (r'abstract.*difficult|struggle.*abstract|dislike.*theory', 'sensing', 0.3),
        (r'traditional|conventional|proven', 'sensing', 0.2),
    ],
    'intuition': [
        (r'abstract|imagination|creative|innovative|possibilities|future|theory|concepts', 'intuition', 0.4),
        (r'ideas|intellectual|curious|philosophy', 'intuition', 0.3),
        (r'vocabulary|complex|novel', 'intuition', 0.2),
    ],

    # Thinking / Feeling
    'thinking': [
        (r'logic|rational|analyze|objective|critical|debate|principles', 'thinking', 0.4),
        (r"little concern|don't care|insult|blunt|straightforward", 'thinking', 0.3),
        (r'facts.*feelings|competent|efficient', 'thinking', 0.2),
    ],
    'feeling': [
        (r'empathy|compassion|caring|concern.*others|emotional|harmony|values', 'feeling', 0.4),
        (r'interested.*people|understand.*feelings|sensitive|tender', 'feeling', 0.3),
        (r'warm|kind|supportive|cooperative', 'feeling', 0.2),
    ],

    # Judging / Perceiving
    'judging': [
        (r'organized|prepared|plan|schedule|structure|order|disciplined|systematic', 'judging', 0.4),
        (r'responsible|reliable|deliberate|careful|thorough', 'judging', 0.3),
        (r'decide|decisive|closure|complete', 'judging', 0.2),
    ],
    'perceiving': [
        (r'spontaneous|flexible|adapt|improvise|open.*ended|explore', 'perceiving', 0.4),
        (r'leave.*belongings|messy|disorganized|procrastinate', 'perceiving', 0.3),
        (r'casual|easy.*going|relaxed.*deadlines', 'perceiving', 0.2),
    ],
}


def find_mbti_weights(question_text, comment_text):
    """
    Analyze question and comment to determine relevant MBTI weights.

    Returns: dict of {scale_id: weight}
    """
    combined_text = f"{question_text} {comment_text}".lower()
    weights = {}

    for scale, patterns in MBTI_MAPPINGS.items():
        for pattern, scale_id, weight in patterns:
            if re.search(pattern, combined_text, re.IGNORECASE):
                # Use highest matching weight for this scale
                if scale_id not in weights or weight > weights[scale_id]:
                    weights[scale_id] = weight
                break  # Use first matching pattern only

    return weights


def add_mbti_weights_to_file(filepath):
    """
    Read weights file, add MBTI weights to each question, write back.
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Pattern to match a question weight entry
    # Matches: 'test_id:qN': const QuestionWeight(...),
    pattern = r"('[\w_]+:q\d+': const QuestionWeight\([^)]+axisWeights: \{)([^}]+)(\}[^)]+note: '([^']+)')"

    def add_weights(match):
        prefix = match.group(1)  # Everything before axisWeights
        existing_weights = match.group(2)  # Existing axis weights
        suffix = match.group(3)  # Everything after axisWeights
        note_text = match.group(4)  # Note content

        # Extract question comment from preceding lines
        # Look backwards for comment block
        start_pos = match.start()
        preceding_text = content[:start_pos]
        comment_lines = []
        for line in reversed(preceding_text.split('\n')[-10:]):  # Check last 10 lines
            if '//' in line:
                comment_lines.insert(0, line)
            elif line.strip() and not line.strip().startswith('//'):
                break

        comment_text = ' '.join(comment_lines)

        # Find MBTI weights for this question
        mbti_weights = find_mbti_weights(comment_text, note_text)

        if not mbti_weights:
            # No relevant MBTI weights found
            return match.group(0)

        # Add MBTI weights to existing weights
        # Parse existing weights to find last weight line
        existing_lines = existing_weights.strip().split('\n')

        # Remove trailing comma from last weight if present
        if existing_lines and existing_lines[-1].rstrip().endswith(','):
            existing_lines[-1] = existing_lines[-1].rstrip()[:-1] + ','

        # Add MBTI weights section
        mbti_lines = []
        mbti_lines.append("        // MBTI personality type scales")
        for scale_id, weight in sorted(mbti_weights.items()):
            mbti_lines.append(f"        '{scale_id}': {weight},")

        # Combine
        new_weights = '\n'.join(existing_lines) + '\n' + '\n'.join(mbti_lines) + '\n      '

        return prefix + new_weights + suffix

    # Apply transformation
    updated_content = re.sub(pattern, add_weights, content, flags=re.DOTALL)

    # Write back
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(updated_content)

    print(f"✅ Updated {filepath}")

    # Count how many questions were updated
    mbti_count = updated_content.count("// MBTI personality type scales")
    print(f"   Added MBTI weights to {mbti_count} questions")


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python add_mbti_weights.py <weights_file.dart>")
        sys.exit(1)

    filepath = sys.argv[1]
    add_mbti_weights_to_file(filepath)
