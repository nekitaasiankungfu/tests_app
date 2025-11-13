@echo off
echo ========================================
echo  Running axis directions tests...
echo ========================================
echo.

REM Запускаем тесты и сохраняем результат в файл
flutter test test/axis_directions_test.dart --reporter expanded > test_results.log 2>&1

REM Показываем результаты
type test_results.log

echo.
echo ========================================
echo  Tests completed!
echo  Full log saved to: test_results.log
echo ========================================
echo.
pause
