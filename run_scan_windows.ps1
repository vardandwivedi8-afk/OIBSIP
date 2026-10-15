# Safe default: scan only this computer (localhost).
$ErrorActionPreference = "Stop"
$Target = "127.0.0.1"
$Output = "nmap_scan_results.txt"

$nmapCommand = Get-Command nmap -ErrorAction SilentlyContinue
if (-not $nmapCommand) {
    $candidate = "C:\Program Files (x86)\Nmap\nmap.exe"
    if (Test-Path $candidate) { $Nmap = $candidate }
    else {
        $candidate = "C:\Program Files\Nmap\nmap.exe"
        if (Test-Path $candidate) { $Nmap = $candidate }
        else { throw "Nmap not found. Install from https://nmap.org/download.html and reopen PowerShell." }
    }
} else {
    $Nmap = $nmapCommand.Source
}

$lines = @(
    "OIBSIP Task 1 — Basic Network Scanning with Nmap"
    "Run date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')"
    "Target: $Target"
    "Command: nmap -sV --top-ports 1000 $Target"
    "Scope: localhost only"
    ""
)
$lines | Set-Content -Encoding utf8 $Output
& $Nmap -sV --top-ports 1000 $Target 2>&1 | Tee-Object -FilePath $Output -Append
Write-Host "`nSaved actual scan output to: $Output"
