@echo off
REM Этот bat-файл открывает CMD и НЕ ЗАКРЫВАЕТ её
REM Используйте этот способ если окно закрывается слишком быстро

start cmd /k "cd /d %~dp0 && flutter test test/axis_directions_test.dart --reporter expanded"
