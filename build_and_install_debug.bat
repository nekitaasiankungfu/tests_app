@echo off
REM ========================================
REM  Сборка и установка приложения (Debug)
REM ========================================

echo.
echo [1/3] Сборка APK...
echo.

flutter build apk --debug

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Ошибка при сборке!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ✅ Сборка завершена!
echo.
echo [2/3] Установка на устройство...
echo.

adb install -r build\app\outputs\flutter-apk\app-debug.apk

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Ошибка при установке!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ✅ Установка завершена!
echo.
echo [3/3] Запуск приложения...
echo.

adb shell am start -n com.example.psycho_app/com.example.psycho_app.MainActivity

echo.
echo ========================================
echo  Готово! Приложение запущено.
echo ========================================
echo.
echo Для просмотра логов используйте:
echo   adb logcat -s flutter
echo.
pause
