@echo off
:: Batch relys on PowerShell as a dependancy
setlocal
set "WRKDIR=%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%WRKDIR%fetch.ps1" %*
endlocal
