@echo off
echo ====================================================
echo  Compiling MandiMitra (C++17) using MinGW g++...
echo ====================================================
g++ -std=c++17 src/main.cpp src/CSVHandler.cpp src/MandiSystem.cpp src/Utils.cpp -Iinclude -o mandimitra.exe
if %ERRORLEVEL% EQU 0 (
    echo [OK] Build successful! Run with: .\mandimitra.exe or run.bat
) else (
    echo [ERROR] Build failed! Check compiler output above.
)
