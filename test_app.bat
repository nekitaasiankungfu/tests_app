@echo off
echo ========================================
echo Testing Psycho Tests App
echo ========================================
echo.

cd /d %~dp0

echo Step 1: Getting dependencies...
call C:\flutter\bin\flutter.bat pub get
echo.

echo Step 2: Analyzing code...
call C:\flutter\bin\flutter.bat analyze
echo.

echo Step 3: Running tests...
call C:\flutter\bin\flutter.bat test
echo.

echo ========================================
echo Testing complete!
echo ========================================
echo.
echo Press any key to exit...
pause > nul
