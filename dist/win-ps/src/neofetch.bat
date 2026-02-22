@echo off
:: Batch relys on PowerShell as a dependancy
setlocal
set "WRKDIR=%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%WRKDIR%neofetch.ps1" %*
endlocal
