@echo off
echo ==================================================
echo Cleaning Flutter Build Environment
echo ==================================================

echo [1/4] Terminating Dart and Java processes...
:: Use /F for force, /IM for image name, /T for tree kill. 2>nul suppresses error if process not found.
taskkill /F /IM dart.exe /T 2>nul
taskkill /F /IM java.exe /T 2>nul

echo [2/4] Deleting build artifacts...
if exist "build" (
    echo Deleting build directory...
    rd /s /q "build"
)
if exist ".dart_tool" (
    echo Deleting .dart_tool directory...
    rd /s /q ".dart_tool"
)
if exist "pubspec.lock" (
    echo Deleting pubspec.lock...
    del /f /q "pubspec.lock"
)

echo [3/4] Running flutter clean...
:: 'call' ensures control returns to this batch file
call flutter clean

echo [4/4] Getting fresh dependencies...
call flutter pub get

echo.
echo ==================================================
echo STRICT CLEAN COMPLETE
echo You can now proceed with 'flutter run' or 'flutter build'.
echo ==================================================
pause
