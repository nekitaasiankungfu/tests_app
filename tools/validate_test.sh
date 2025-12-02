#!/bin/bash
# validate_test.sh - Автоматическая проверка нового теста
#
# Использование:
#   ./tools/validate_test.sh your_test_id
#
# Пример:
#   ./tools/validate_test.sh disc_personality_v1

set -e

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Счётчики
TOTAL_CHECKS=0
PASSED_CHECKS=0
FAILED_CHECKS=0
WARNINGS=0

# Функции для вывода
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_check() {
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    echo -e "${YELLOW}[CHECK $TOTAL_CHECKS]${NC} $1"
}

print_pass() {
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
    echo -e "${GREEN}✓ PASS:${NC} $1"
}

print_fail() {
    FAILED_CHECKS=$((FAILED_CHECKS + 1))
    echo -e "${RED}✗ FAIL:${NC} $1"
}

print_warn() {
    WARNINGS=$((WARNINGS + 1))
    echo -e "${YELLOW}⚠ WARNING:${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ INFO:${NC} $1"
}

# Проверка аргументов
if [ $# -eq 0 ]; then
    echo "Использование: $0 <test_id>"
    echo "Пример: $0 disc_personality_v1"
    exit 1
fi

TEST_ID="$1"
print_header "VALIDATING TEST: $TEST_ID"

# Определяем пути к файлам
TEST_STUB_FILE=""
DATA_FILE=""
WEIGHTS_FILE="lib/config/summary/question_weights/${TEST_ID//_v[0-9]/}_weights.dart"

# Поиск test stub файла
print_check "A. Поиск файлов теста"
TEST_STUB_PATTERN="${TEST_ID//_v[0-9]/}_test.dart"
TEST_STUB_FILE=$(find lib/data/tests -name "$TEST_STUB_PATTERN" 2>/dev/null | head -1)

if [ -z "$TEST_STUB_FILE" ]; then
    print_fail "Test stub не найден: lib/data/tests/*${TEST_STUB_PATTERN}"
else
    print_pass "Test stub: $TEST_STUB_FILE"
fi

# Поиск data файла
DATA_PATTERN="${TEST_ID//_v[0-9]/}_data.dart"
DATA_FILE=$(find lib/data -maxdepth 1 -name "$DATA_PATTERN" 2>/dev/null | head -1)

if [ -z "$DATA_FILE" ]; then
    print_fail "Data файл не найден: lib/data/*${DATA_PATTERN}"
else
    print_pass "Data файл: $DATA_FILE"
fi

# Проверка weights файла
if [ ! -f "$WEIGHTS_FILE" ]; then
    print_fail "Weights файл не найден: $WEIGHTS_FILE"
else
    print_pass "Weights файл: $WEIGHTS_FILE"
fi

echo ""

# CHECK B: Дубликаты ключей в weights Map
print_check "B. Проверка дубликатов ключей в weights файле"
if [ -f "$WEIGHTS_FILE" ]; then
    DUPLICATES=$(grep -oP "'${TEST_ID}:q\d+'" "$WEIGHTS_FILE" | sort | uniq -d)
    if [ -n "$DUPLICATES" ]; then
        print_fail "Найдены дублирующиеся ключи:"
        echo "$DUPLICATES" | while read -r dup; do
            echo "  - $dup"
        done
    else
        print_pass "Дубликаты ключей не найдены"
    fi
else
    print_warn "Пропущено (weights файл не найден)"
fi

echo ""

# CHECK A: Валидность шкал
print_check "C. Проверка что все шкалы существуют в hierarchical_scales.dart"
if [ -f "$WEIGHTS_FILE" ]; then
    # Биполярные полюса (это нормально что их нет в hierarchical_scales)
    BIPOLAR_POLES="extraversion|introversion|sensing|intuition|thinking|feeling|judging|perceiving"

    # Извлекаем все шкалы из weights файла
    SCALES=$(grep -oP "'\K[a-z_]+(?=':\s*-?\d)" "$WEIGHTS_FILE" | sort -u)

    INVALID_SCALES=""
    BIPOLAR_COUNT=0

    while IFS= read -r scale; do
        # Пропускаем биполярные полюса
        if echo "$scale" | grep -qE "^($BIPOLAR_POLES)$"; then
            BIPOLAR_COUNT=$((BIPOLAR_COUNT + 1))
            continue
        fi

        # Проверяем существование в hierarchical_scales.dart
        if ! grep -q "id: '$scale'" lib/config/summary/hierarchical_scales.dart; then
            INVALID_SCALES="$INVALID_SCALES\n  - $scale"
        fi
    done <<< "$SCALES"

    if [ -n "$INVALID_SCALES" ]; then
        print_fail "Найдены несуществующие шкалы (не в hierarchical_scales.dart):$INVALID_SCALES"
        print_info "Проверьте ПРАВИЛО #6 в ADDING_NEW_TEST.md"
    else
        TOTAL_SCALES=$(echo "$SCALES" | wc -l)
        VALID_SCALES=$((TOTAL_SCALES - BIPOLAR_COUNT))
        print_pass "$VALID_SCALES валидных шкал + $BIPOLAR_COUNT биполярных полюсов"
    fi
else
    print_warn "Пропущено (weights файл не найден)"
fi

echo ""

# CHECK C: Отрицательные веса на биполярных полюсах
print_check "D. Проверка отсутствия отрицательных весов на биполярных полюсах"
if [ -f "$WEIGHTS_FILE" ]; then
    BIPOLAR_POLES="extraversion|introversion|sensing|intuition|thinking|feeling|judging|perceiving"
    NEGATIVE_BIPOLAR=$(grep -P "'($BIPOLAR_POLES)':\s*-\d" "$WEIGHTS_FILE" || true)

    if [ -n "$NEGATIVE_BIPOLAR" ]; then
        print_fail "Найдены отрицательные веса на биполярных полюсах:"
        echo "$NEGATIVE_BIPOLAR" | head -5
        print_info "Проверьте ПРАВИЛО #2 в ADDING_NEW_TEST.md"
    else
        print_pass "Отрицательные веса на биполярных полюсах отсутствуют"
    fi
else
    print_warn "Пропущено (weights файл не найден)"
fi

echo ""

# CHECK D1: Неправильный формат биполярных весов (отдельные QuestionWeight с :personality)
print_check "D1. Проверка формата биполярных весов (НЕ должно быть :personality суффикса)"
if [ -f "$WEIGHTS_FILE" ]; then
    PERSONALITY_SUFFIX=$(grep -P "'${TEST_ID}:q\d+:personality'" "$WEIGHTS_FILE" || true)

    if [ -n "$PERSONALITY_SUFFIX" ]; then
        print_fail "Найдены QuestionWeight с суффиксом :personality (неправильный формат!):"
        echo "$PERSONALITY_SUFFIX" | head -5
        print_info "❌ НЕПРАВИЛЬНО: '${TEST_ID}:q1:personality': QuestionWeight(...)"
        print_info "✅ ПРАВИЛЬНО: Добавьте биполярные веса В ТОТ ЖЕ axisWeights основного вопроса"
        print_info "Пример в ADDING_TEST_EXAMPLES.md строки 437-507"
    else
        print_pass "Формат биполярных весов правильный (встроены в основные QuestionWeight)"
    fi
else
    print_warn "Пропущено (weights файл не найден)"
fi

echo ""

# CHECK E: Регистрация в test_registry.dart
print_check "E. Проверка регистрации в test_registry.dart"
if [ -n "$TEST_STUB_FILE" ]; then
    CLASS_NAME=$(grep -oP "class \K\w+(?= extends TestStub)" "$TEST_STUB_FILE" | head -1)
    if grep -q "$CLASS_NAME()" lib/data/test_registry.dart; then
        print_pass "Тест зарегистрирован в test_registry.dart"
    else
        print_fail "Тест НЕ найден в test_registry.dart (ищем: $CLASS_NAME())"
        print_info "Добавьте в allTests[]: $CLASS_NAME(),"
    fi
else
    print_warn "Пропущено (test stub не найден)"
fi

echo ""

# CHECK F: Регистрация в test_loader_service.dart
print_check "F. Проверка регистрации в test_loader_service.dart"
if grep -q "case '$TEST_ID':" lib/services/test_loader_service.dart; then
    print_pass "Тест найден в test_loader_service.dart"
else
    print_fail "Тест НЕ найден в test_loader_service.dart (case '$TEST_ID':)"
    print_info "Добавьте case в switch statement метода _loadLegacyTest"
fi

echo ""

# CHECK G: Регистрация в test_service.dart
print_check "G. Проверка регистрации в test_service.dart (факторы и интерпретации)"
FOUND_FACTORS=false
FOUND_INTERP=false

if grep -q "test.id == '$TEST_ID'" lib/services/test_service.dart; then
    FOUND_FACTORS=true
fi

if grep -q "testResult.testId == '$TEST_ID'" lib/services/test_service.dart; then
    FOUND_INTERP=true
fi

if [ "$FOUND_FACTORS" = true ] && [ "$FOUND_INTERP" = true ]; then
    print_pass "Тест найден в test_service.dart (факторы + интерпретации)"
elif [ "$FOUND_FACTORS" = true ]; then
    print_warn "Найдены факторы, но НЕ найдены интерпретации в test_service.dart"
elif [ "$FOUND_INTERP" = true ]; then
    print_warn "Найдены интерпретации, но НЕ найдены факторы в test_service.dart"
else
    print_fail "Тест НЕ найден в test_service.dart"
    print_info "Добавьте 3 блока: import, факторные имена (~строка 222), интерпретации (~строка 266)"
fi

echo ""

# CHECK H: Регистрация в summary_service.dart (2 места)
print_check "H. Проверка регистрации в summary_service.dart (2 места)"
if [ -f "$WEIGHTS_FILE" ]; then
    WEIGHTS_CLASS=$(basename "$WEIGHTS_FILE" .dart | sed 's/_/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1' | sed 's/ //g')

    COUNT=$(grep -c "\\.\\.\\.$WEIGHTS_CLASS\\.weights" lib/services/summary_service.dart || echo "0")

    if [ "$COUNT" -eq 2 ]; then
        print_pass "Веса импортированы в 2 местах summary_service.dart"
    elif [ "$COUNT" -eq 1 ]; then
        print_fail "Веса найдены только в 1 месте (нужно 2!)"
        print_info "Проверьте строки ~125 и ~500 в summary_service.dart"
    else
        print_fail "Веса НЕ найдены в summary_service.dart"
        print_info "Добавьте ...$WEIGHTS_CLASS.weights в 2 Map (строки ~125 и ~500)"
    fi
else
    print_warn "Пропущено (weights файл не найден)"
fi

echo ""

# CHECK I: Регистрация в summary_screen.dart (2 switch)
print_check "I. Проверка регистрации в summary_screen.dart (2 switch statements)"
COUNT=$(grep -c "case '$TEST_ID':" lib/screens/summary_screen.dart || echo "0")

if [ "$COUNT" -ge 2 ]; then
    print_pass "Тест найден в $COUNT местах summary_screen.dart"
elif [ "$COUNT" -eq 1 ]; then
    print_fail "Тест найден только в 1 switch statement (нужно 2!)"
    print_info "Добавьте case в оба: _getAnswerText (~строка 69) и _getQuestionText (~строка 2569)"
else
    print_fail "Тест НЕ найден в summary_screen.dart"
    print_info "Добавьте case '$TEST_ID': в 2 switch statements"
fi

echo ""

# CHECK J: Регистрация в summary_config.dart
print_check "J. Проверка регистрации в summary_config.dart"
if [ -f "$WEIGHTS_FILE" ]; then
    WEIGHTS_CLASS=$(basename "$WEIGHTS_FILE" .dart | sed 's/_/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1' | sed 's/ //g')

    if grep -q "\\.\\.\\.$WEIGHTS_CLASS\\.weights" lib/config/summary_config.dart; then
        print_pass "Веса найдены в summary_config.dart"
    else
        print_fail "Веса НЕ найдены в summary_config.dart"
        print_info "Добавьте ...$WEIGHTS_CLASS.weights в QuestionWeightsConfig._weights (~строка 2303)"
    fi
else
    print_warn "Пропущено (weights файл не найден)"
fi

echo ""

# CHECK K: Flutter analyze
print_check "K. Запуск flutter analyze"
if command -v flutter &> /dev/null; then
    if flutter analyze 2>&1 | grep -qi "no issues found"; then
        print_pass "Flutter analyze прошёл без ошибок"
    else
        print_fail "Flutter analyze нашёл проблемы"
        print_info "Запустите 'flutter analyze' для подробностей"
    fi
else
    print_warn "Flutter не найден, пропуск проверки"
fi

echo ""

# CHECK L: Правильное именование Data класса
print_check "L. Проверка правильности именования Data класса"
if [ -n "$DATA_FILE" ]; then
    # Извлекаем название класса из файла
    ACTUAL_CLASS=$(grep -oP "class \K\w+(?= \{)" "$DATA_FILE" | head -1)

    # Ожидаемое название (без "Test" дублирования)
    # Например: disc_personality_data.dart → DISCPersonalityData (не DISCPersonalityTestData)
    BASE_NAME=$(basename "$DATA_FILE" _data.dart)

    # Проверяем что класс не содержит "TestData" или "TestTest"
    if echo "$ACTUAL_CLASS" | grep -qi "TestTest\|TestData"; then
        print_fail "Класс Data содержит 'TestTest' или 'TestData': $ACTUAL_CLASS"
        print_info "Правильное именование: ${BASE_NAME^}Data (без 'Test')"
    else
        print_pass "Класс Data назван правильно: $ACTUAL_CLASS"
    fi
else
    print_warn "Пропущено (data файл не найден)"
fi

echo ""

# Итоговый отчёт
print_header "SUMMARY"
echo -e "Total checks:   ${BLUE}$TOTAL_CHECKS${NC}"
echo -e "Passed:         ${GREEN}$PASSED_CHECKS${NC}"
echo -e "Failed:         ${RED}$FAILED_CHECKS${NC}"
echo -e "Warnings:       ${YELLOW}$WARNINGS${NC}"
echo ""

if [ $FAILED_CHECKS -eq 0 ]; then
    echo -e "${GREEN}✓ ВСЕ ПРОВЕРКИ ПРОЙДЕНЫ!${NC}"
    echo "Тест готов к использованию."
    exit 0
else
    echo -e "${RED}✗ НАЙДЕНЫ ОШИБКИ!${NC}"
    echo "Исправьте ошибки перед запуском теста."
    echo "Обратитесь к ADDING_NEW_TEST.md для деталей."
    exit 1
fi
