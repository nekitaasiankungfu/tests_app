@echo off
echo ========================================
echo Установка MCP сервера APA Search
echo ========================================
echo.

REM Проверка Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ОШИБКА] Python не найден. Установите Python 3.10 или выше.
    echo Скачать: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo [OK] Python найден
echo.

REM Переход в директорию скрипта
cd /d "%~dp0"

REM Создание виртуального окружения
echo Создание виртуального окружения...
if not exist "venv" (
    python -m venv venv
    echo [OK] Виртуальное окружение создано
) else (
    echo [OK] Виртуальное окружение уже существует
)
echo.

REM Активация виртуального окружения и установка зависимостей
echo Установка зависимостей...
call venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt

if errorlevel 1 (
    echo [ОШИБКА] Не удалось установить зависимости
    pause
    exit /b 1
)

echo.
echo ========================================
echo [УСПЕШНО] Установка завершена!
echo ========================================
echo.
echo Следующие шаги:
echo 1. Скопируйте содержимое файла cursor_config_example.json
echo 2. Откройте Cursor: Settings ^> MCP Servers ^> Edit Config
echo 3. Вставьте конфигурацию
echo 4. Перезапустите Cursor
echo.
echo Путь к серверу: %cd%\server.py
echo.
pause

