#!/usr/bin/env python3
"""
Convert Dart test files to JSON format.
This is a simplified parser that extracts key information.
"""

import json
import re
import os

def parse_map_literal(text):
    """Parse Dart map literal like {'ru': 'text', 'en': 'text'}"""
    result = {}
    pattern = r"'(\w+)':\s*'([^']*(?:''[^']*)*)'"
    for match in re.finditer(pattern, text):
        key, value = match.groups()
        value = value.replace("''", "'")  # Unescape single quotes
        result[key] = value
    return result

def extract_answers_standard_5point():
    """Standard 5-point scale for IPIP test"""
    return [
        {"id": "a1", "text": {"ru": "Совершенно неточно", "en": "Very Inaccurate"}, "score": 1},
        {"id": "a2", "text": {"ru": "Скорее неточно", "en": "Moderately Inaccurate"}, "score": 2},
        {"id": "a3", "text": {"ru": "Ни точно, ни неточно", "en": "Neither Accurate Nor Inaccurate"}, "score": 3},
        {"id": "a4", "text": {"ru": "Скорее точно", "en": "Moderately Accurate"}, "score": 4},
        {"id": "a5", "text": {"ru": "Совершенно точно", "en": "Very Accurate"}, "score": 5},
    ]

print("🔄 Converting legacy tests to JSON...\n")
print("Note: This creates minimal JSON structures.")
print("Manual review recommended for complex tests.\n")

# For now, create placeholder JSON files
# User can fill in questions manually or run Dart converter on Windows

tests_config = {
    "ipip_big_five": {
        "name": "IPIP Big Five",
        "factors": ["extraversion", "agreeableness", "conscientiousness", "emotional_stability", "intellect"],
        "questions": 50,
        "type": "multi_factor"
    },
    "fisher_temperament": {
        "name": "Fisher Temperament",
        "factors": ["explorer", "builder", "director", "negotiator"],
        "questions": 56,
        "type": "multi_factor"
    },
    "love_profile": {
        "name": "Love Profile",
        "factors": ["intimacy", "passion", "commitment"],
        "questions": 60,
        "type": "multi_factor"
    },
    "sixteen_types": {
        "name": "16 Personality Types",
        "factors": ["extraversion_introversion", "sensing_intuition", "thinking_feeling", "judging_perceiving"],
        "questions": 80,
        "type": "multi_factor"
    }
}

os.makedirs("assets/tests", exist_ok=True)

for test_id, config in tests_config.items():
    filename = f"assets/tests/{test_id}.json"

    if os.path.exists(filename):
        print(f"⏭️  Skipping {config['name']}: {filename} already exists")
        continue

    # Create placeholder JSON
    json_data = {
        "id": test_id,
        "version": "1.0.0",
        "type": config["type"],
        "factors": config["factors"],
        "questions": [],
        "_note": f"TODO: Add {config['questions']} questions. Run convert_tests.bat on Windows or convert manually."
    }

    # Add placeholder questions
    for i in range(min(3, config['questions'])):  # First 3 as examples
        json_data["questions"].append({
            "id": f"q{i+1}",
            "text": {
                "ru": f"TODO: Вопрос {i+1}",
                "en": f"TODO: Question {i+1}"
            },
            "factor": config["factors"][i % len(config["factors"])],
            "is_reversed": False,
            "answers": extract_answers_standard_5point()
        })

    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(json_data, f, ensure_ascii=False, indent=2)

    print(f"✅ Created placeholder: {filename}")
    print(f"   ⚠️  Contains only {min(3, config['questions'])} sample questions")
    print(f"   📝 TODO: Add remaining {config['questions'] - 3} questions\n")

print("\n" + "="*60)
print("✅ Placeholder JSON files created!")
print("\nNext steps:")
print("1. Run convert_tests.bat on Windows to auto-convert")
print("2. OR manually copy questions from Dart files")
print("3. OR use the legacy fallback (tests work as-is)")
print("="*60)
