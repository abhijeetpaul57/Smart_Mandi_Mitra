@echo off
if not exist mandimitra.exe (
    echo Binary not found. Building first...
    call build.bat
)
mandimitra.exe
