#!/bin/bash

echo "========================================"
echo "ДИАГНОСТИКА MCP СЕРВЕРА APA SEARCH"
echo "========================================"
echo ""

# Проверка Python
echo "[1/5] Проверка Python..."
if ! command -v python3 &> /dev/null
then
    echo "[X] Python НЕ НАЙДЕН!"
    echo ""
    echo "Установите Python 3.10+ с официального сайта:"
    echo "macOS: brew install python3"
    echo "Linux: sudo apt install python3 python3-pip"
    echo ""
    exit 1
else
    python3 --version
    echo "[OK] Python установлен"
fi
echo ""

# Проверка директории
echo "[2/5] Проверка директории сервера..."
if [ -f "server.py" ]; then
    echo "[OK] Файл server.py найден"
else
    echo "[X] Файл server.py не найден"
    echo "Убедитесь, что вы в директории mcp_apa_server"
    exit 1
fi
echo ""

# Проверка зависимостей
echo "[3/5] Проверка зависимостей..."
if python3 -c "import mcp" 2>/dev/null; then
    echo "[OK] MCP SDK установлен"
else
    echo "[X] MCP SDK не установлен"
    echo "Запустите: pip install -r requirements.txt"
    exit 1
fi

if python3 -c "import httpx" 2>/dev/null; then
    echo "[OK] httpx установлен"
else
    echo "[X] httpx не установлен"
    exit 1
fi

if python3 -c "import bs4" 2>/dev/null; then
    echo "[OK] BeautifulSoup4 установлен"
else
    echo "[X] BeautifulSoup4 не установлен"
    exit 1
fi
echo ""

# Проверка конфигурации Cursor
echo "[4/5] Проверка конфигурации Cursor..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    CURSOR_CONFIG="$HOME/Library/Application Support/Cursor/User/globalStorage/rooveterinaryinc.roo-cline/settings/cline_mcp_settings.json"
else
    CURSOR_CONFIG="$HOME/.config/Cursor/User/globalStorage/rooveterinaryinc.roo-cline/settings/cline_mcp_settings.json"
fi

if [ -f "$CURSOR_CONFIG" ]; then
    echo "[OK] Файл конфигурации Cursor найден"
    echo "Путь: $CURSOR_CONFIG"
    if grep -q "apa-search" "$CURSOR_CONFIG"; then
        echo "[OK] Сервер apa-search найден в конфигурации"
    else
        echo "[!] Сервер apa-search НЕ НАЙДЕН в конфигурации"
        echo ""
        echo "Добавьте конфигурацию из файла cursor_config_example.json"
    fi
else
    echo "[!] Файл конфигурации Cursor не найден"
    echo "Путь: $CURSOR_CONFIG"
fi
echo ""

# Тест подключения к APA
echo "[5/5] Тест подключения к APA.org..."
if python3 -c "import httpx; import asyncio; asyncio.run(httpx.AsyncClient().get('https://www.apa.org'))" 2>/dev/null; then
    echo "[OK] Подключение к APA.org работает"
else
    echo "[!] Не удалось подключиться к APA.org"
    echo "Проверьте интернет-соединение"
fi
echo ""

echo "========================================"
echo "ДИАГНОСТИКА ЗАВЕРШЕНА"
echo "========================================"
echo ""
echo "Чтобы запустить сервер вручную:"
echo "python3 server.py"
echo ""
echo "Чтобы проверить работу через Cursor:"
echo "1. Перезапустите Cursor"
echo "2. Откройте чат и напишите:"
echo "   'Найди информацию о психологических тестах'"
echo ""

