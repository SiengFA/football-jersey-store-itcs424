@echo off
setlocal
set TARGET=%USERPROFILE%\Documents\FlutterProjects\football_jersey_store
set HERE=%~dp0
set ROOT=%HERE%..

echo Setting up Flutter project at %TARGET%
if not exist "%TARGET%" (
  flutter create "%TARGET%"
)

if not exist "%TARGET%\lib\models"  mkdir "%TARGET%\lib\models"
if not exist "%TARGET%\lib\widgets" mkdir "%TARGET%\lib\widgets"
if not exist "%TARGET%\lib\screens" mkdir "%TARGET%\lib\screens"
if not exist "%TARGET%\docs"        mkdir "%TARGET%\docs"

copy /Y "%ROOT%\lib\main.dart"                        "%TARGET%\lib\main.dart"
copy /Y "%ROOT%\lib\models\product.dart"              "%TARGET%\lib\models\product.dart"
copy /Y "%ROOT%\lib\widgets\product_card.dart"        "%TARGET%\lib\widgets\product_card.dart"
copy /Y "%ROOT%\lib\screens\product_list_screen.dart" "%TARGET%\lib\screens\product_list_screen.dart"
copy /Y "%ROOT%\README.md"                            "%TARGET%\README.md"
copy /Y "%ROOT%\.gitignore"                           "%TARGET%\.gitignore"
xcopy /Y /E "%ROOT%\docs"                             "%TARGET%\docs\"

cd /d "%TARGET%"
flutter pub get
echo.
echo Phase 1 complete! Next: 02_run.bat
