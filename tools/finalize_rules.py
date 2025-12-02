#!/usr/bin/env python3
"""
Finalize ADDING_NEW_TEST.md rules numbering:
1. Keep RULE #1-6 as is
2. Rename #6.5 → #7
3. Delete old RULE #7 (lines 1130-1347, Structure of scales)
4. Keep RULE #8 (maxQuestionScore)
"""

# Read the file
with open('ADDING_NEW_TEST_v3.md', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Find old RULE #7 boundaries
rule7_start = None
rule7_end = None

for i, line in enumerate(lines):
    if '### 🔴 ПРАВИЛО #7: Структура шкал и биполярные шкалы' in line:
        rule7_start = i
    if rule7_start is not None and rule7_end is None:
        if '### 🔴 ПРАВИЛО #8:' in line:
            rule7_end = i
            break

print(f"Old RULE #7 found at lines {rule7_start+1} to {rule7_end}")

# Remove old RULE #7
if rule7_start and rule7_end:
    del lines[rule7_start:rule7_end]
    print(f"Deleted {rule7_end - rule7_start} lines")

# Rename #6.5 → #7
new_lines = []
for line in lines:
    # Rename in headers
    if 'ПРАВИЛО #6.5:' in line:
        line = line.replace('ПРАВИЛО #6.5:', 'ПРАВИЛО #7:')
    # Rename in references
    if 'ПРАВИЛО #6.5)' in line or 'ПРАВИЛО #6.5,' in line:
        line = line.replace('ПРАВИЛО #6.5', 'ПРАВИЛО #7')
    new_lines.append(line)

# Write output
with open('ADDING_NEW_TEST_v3.md', 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print(f"✅ Done! Final file has {len(new_lines)} lines")
print("Rules renumbered: #1, #2, #3, #4, #5, #6, #7, #8")
