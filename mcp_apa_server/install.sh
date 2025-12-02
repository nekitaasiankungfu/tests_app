#!/bin/bash

echo "========================================"
echo "Установка MCP сервера APA Search"
echo "========================================"
echo ""

# Проверка Python
if ! command -v python3 &> /dev/null
then
    echo "[ОШИБКА] Python не найден. Установите Python 3.10 или выше."
    echo "Для macOS: brew install python3"
    echo "Для Linux: sudo apt install python3 python3-pip"
    exit 1
fi

echo "[OK] Python найден"
echo ""

# Переход в директорию скрипта
cd "$(dirname "$0")"

# Создание виртуального окружения
echo "Создание виртуального окружения..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "[OK] Виртуальное окружение создано"
else
    echo "[OK] Виртуальное окружение уже существует"
fi
echo ""

# Активация виртуального окружения и установка зависимостей
echo "Установка зависимостей..."
source venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "[ОШИБКА] Не удалось установить зависимости"
    exit 1
fi

echo ""
echo "========================================"
echo "[УСПЕШНО] Установка завершена!"
echo "========================================"
echo ""
echo "Следующие шаги:"
echo "1. Скопируйте содержимое файла cursor_config_example.json"
echo "2. Откройте Cursor: Settings > MCP Servers > Edit Config"
echo "3. Вставьте конфигурацию (замените путь на актуальный)"
echo "4. Перезапустите Cursor"
echo ""
echo "Путь к серверу: $(pwd)/server.py"
echo ""

