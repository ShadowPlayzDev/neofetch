try {
    $os = Get-CimInstance Win32_OperatingSystem
    $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
    $uptime = (Get-Date) - $os.LastBootUpTime
} catch { exit }

$cfgPath = Join-Path $PSScriptRoot "textart.cfg"
$osDir = ""
$textFile = ""

if (Test-Path $cfgPath) {
    Get-Content $cfgPath | ForEach-Object {
        if ($_ -match "^OS_DIR=(.*)") { $osDir = $matches[1].Trim() }
        if ($_ -match "^TEXT_FILE=(.*)") { $textFile = $matches[1].Trim() }
    }
}

$rawUrl = "https://raw.githubusercontent.com/ShadowPlayzDev/neofetch/main/logos/$osDir/$textFile"
$logo = try { (Invoke-WebRequest -Uri $rawUrl -UseBasicParsing).Content -split "`n" } catch { $null }

function Get-PkgCount($Path) {
    if (Test-Path $Path) { return (Get-ChildItem $Path).Count }
    return 0
}
$choco  = Get-PkgCount "C:\ProgramData\chocolatey\lib"
$scoop  = Get-PkgCount "$env:USERPROFILE\scoop\apps"
$winget = Get-PkgCount "$env:LOCALAPPDATA\Microsoft\WinGet\Packages"

$c1 = "[34m"; $c2 = "[36m"; $w = "[37m"; $r = "[0m"
$grid = "[40m   [41m   [42m   [43m   [44m   [45m   [46m   [47m   $r"

$info = @(
    "$($c2)$env:USERNAME$($r)@$($c2)$env:COMPUTERNAME$($r)",
    "$($w)-------------------------$($r)",
    "$($c2)OS:$($r)       $($os.Caption)",
    "$($c2)Kernel:$($r)   $($os.Version)",
    "$($c2)Uptime:$($r)   $($uptime.Days)d $($uptime.Hours)h $($uptime.Minutes)m",
    "$($c2)Packages:$($r) $choco (choco), $scoop (scoop), $winget (winget)",
    "$($c2)CPU:$($r)      $($cpu.Name.Trim())",
    "",
    $grid
)

Write-Host ""
if ($logo) {
    $lines = [math]::Max($logo.Count, $info.Count)
    for ($i=0; $i -lt $lines; $i++) {
        $l = if ($i -lt $logo.Count) { $logo[$i].TrimEnd().PadRight(35) } else { " " * 35 }
        $right = if ($i -lt $info.Count) { $info[$i] } else { "" }
        Write-Host "  $($c1)$l$($r) $right"
    }
} else {
    $info | ForEach-Object { Write-Host "  $_" }
}
Write-Host ""
