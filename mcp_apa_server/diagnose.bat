@echo off
echo ========================================
echo ДИАГНОСТИКА MCP СЕРВЕРА APA SEARCH
echo ========================================
echo.

REM Проверка Python
echo [1/5] Проверка Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo [X] Python НЕ НАЙДЕН!
    echo.
    echo Установите Python 3.10+ с официального сайта:
    echo https://www.python.org/downloads/
    echo.
    echo ВАЖНО: При установке отметьте "Add Python to PATH"
    echo.
    pause
    exit /b 1
) else (
    python --version
    echo [OK] Python установлен
)
echo.

REM Проверка директории
echo [2/5] Проверка директории сервера...
if exist "server.py" (
    echo [OK] Файл server.py найден
) else (
    echo [X] Файл server.py не найден
    echo Убедитесь, что вы в директории mcp_apa_server
    pause
    exit /b 1
)
echo.

REM Проверка зависимостей
echo [3/5] Проверка зависимостей...
python -c "import mcp" >nul 2>&1
if errorlevel 1 (
    echo [X] MCP SDK не установлен
    echo Запустите: pip install -r requirements.txt
    pause
    exit /b 1
) else (
    echo [OK] MCP SDK установлен
)

python -c "import httpx" >nul 2>&1
if errorlevel 1 (
    echo [X] httpx не установлен
    pause
    exit /b 1
) else (
    echo [OK] httpx установлен
)

python -c "import bs4" >nul 2>&1
if errorlevel 1 (
    echo [X] BeautifulSoup4 не установлен
    pause
    exit /b 1
) else (
    echo [OK] BeautifulSoup4 установлен
)
echo.

REM Проверка конфигурации Cursor
echo [4/5] Проверка конфигурации Cursor...
set "CURSOR_CONFIG=%APPDATA%\Cursor\User\globalStorage\rooveterinaryinc.roo-cline\settings\cline_mcp_settings.json"
if exist "%CURSOR_CONFIG%" (
    echo [OK] Файл конфигурации Cursor найден
    echo Путь: %CURSOR_CONFIG%
    findstr /C:"apa-search" "%CURSOR_CONFIG%" >nul
    if errorlevel 1 (
        echo [!] Сервер apa-search НЕ НАЙДЕН в конфигурации
        echo.
        echo Добавьте конфигурацию из файла cursor_config_example.json
        echo в файл: %CURSOR_CONFIG%
    ) else (
        echo [OK] Сервер apa-search найден в конфигурации
    )
) else (
    echo [!] Файл конфигурации Cursor не найден
    echo Возможно, нужно создать его вручную
    echo Путь: %CURSOR_CONFIG%
)
echo.

REM Тест подключения к APA
echo [5/5] Тест подключения к APA.org...
python -c "import httpx; import asyncio; asyncio.run(httpx.AsyncClient().get('https://www.apa.org'))" >nul 2>&1
if errorlevel 1 (
    echo [!] Не удалось подключиться к APA.org
    echo Проверьте интернет-соединение
) else (
    echo [OK] Подключение к APA.org работает
)
echo.

echo ========================================
echo ДИАГНОСТИКА ЗАВЕРШЕНА
echo ========================================
echo.
echo Чтобы запустить сервер вручную:
echo python server.py
echo.
echo Чтобы проверить работу через Cursor:
echo 1. Перезапустите Cursor
echo 2. Откройте чат и напишите:
echo    "Найди информацию о психологических тестах"
echo.
pause

