@echo off
echo Converting legacy tests to JSON...
echo.

cd /d %~dp0
C:\flutter\bin\dart.bat tools\convert_legacy_tests.dart

echo.
echo Done! Press any key to exit...
pause > nul
