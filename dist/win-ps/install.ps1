if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Elevating ..." -ForegroundColor Yellow
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$repoBase = "https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/dist/win-ps/src"
$defaultPath = "C:\ProgramData\neofetch"

Write-Host "enter install location and press Enter (default): " -NoNewline
$userInput = Read-Host
$installRoot = if ([string]::IsNullOrWhiteSpace($userInput)) { $defaultPath } else { $userInput.ToLower() }

Write-Host "installing Neofetch..." -ForegroundColor Cyan

if (Test-Path $installRoot) { 
    try { Remove-Item $installRoot -Recurse -Force -ErrorAction Stop } 
    catch { Write-Host "warning: folder busy, overwriting files instead." -ForegroundColor Yellow }
}

New-Item -ItemType Directory -Path $installRoot -Force
New-Item -ItemType Directory -Path (Join-Path $installRoot "logos") -Force

$files = @("fetch.ps1", "fetch.bat", "textart.cfg")

foreach ($file in $files) {
    $url = "$repoBase/$file"
    $dest = Join-Path $installRoot $file
    Write-Host "installing $file from GitHub..." -ForegroundColor Gray
    try {
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing -ErrorAction Stop
    } catch {
        Write-Host "FAIL: $file not installed" -ForegroundColor Red
    }
}

$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
if ($currentPath -notlike "*$installRoot*") {
    $newPath = "$currentPath;$installRoot"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
    Write-Host "added $installRoot to system path." -ForegroundColor Green
}

Write-Host "`ninstallation complete!" -ForegroundColor Green
Write-Host "Finish by downloading logos to: $installRoot\logos"
Write-Host "Restart your terminal and type 'neofetch'."
pause
