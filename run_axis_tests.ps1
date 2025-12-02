# PowerShell скрипт для запуска тестов
# Более надежный чем bat-файл

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Running axis directions tests..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Запуск тестов с сохранением в файл
flutter test test/axis_directions_test.dart --reporter expanded | Tee-Object -FilePath test_results.log

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host " Tests completed!" -ForegroundColor Green
Write-Host " Full log saved to: test_results.log" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
