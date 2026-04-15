@echo off
if "%1"=="copy" (
    powershell.exe -ExecutionPolicy Bypass -File ".\install.ps1" -InstallMode copy
) else (
    powershell.exe -ExecutionPolicy Bypass -File ".\install.ps1"
)
