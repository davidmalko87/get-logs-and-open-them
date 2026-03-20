<#
.SYNOPSIS
    Retrieves Windows Event Log errors and warnings and opens them for review.

.DESCRIPTION
    Queries the System and Application Windows Event Logs for Error and Warning
    entries after a specified date, exports them to text files, and opens each
    file automatically for immediate review.

.PARAMETER After
    The start date from which to retrieve log entries. Defaults to 2022-01-12.

.PARAMETER OutputPath
    Directory where the result files will be saved. Defaults to the current
    user's Downloads folder.

.EXAMPLE
    .\script.ps1
    Runs with default settings (logs after 2022-01-12, saved to Downloads).

.EXAMPLE
    .\script.ps1 -After "2024-01-01" -OutputPath "C:\Logs"
    Retrieves logs after January 1 2024 and saves them to C:\Logs.

.NOTES
    Requires Windows PowerShell 5.1 or later.
    The Get-EventLog cmdlet requires appropriate permissions to read event logs.
#>

[CmdletBinding()]
param (
    [datetime]$After = '2022-01-12',
    [string]$OutputPath = "$env:USERPROFILE\Downloads"
)

# Ensure the output directory exists
if (-not (Test-Path -Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath | Out-Null
}

$SystemLogPath      = Join-Path $OutputPath 'system-log.txt'
$ApplicationLogPath = Join-Path $OutputPath 'application-log.txt'

Write-Host 'Script started...' -ForegroundColor Blue

# --- System Log ---
Write-Host 'Retrieving System log entries...' -ForegroundColor Blue
Get-EventLog -LogName System -EntryType Error, Warning -After $After |
    Out-File -FilePath $SystemLogPath
Write-Host "System log saved to: $SystemLogPath" -ForegroundColor Green
Invoke-Item $SystemLogPath

# --- Application Log ---
Write-Host 'Retrieving Application log entries...' -ForegroundColor Blue
Get-EventLog -LogName Application -EntryType Error, Warning -After $After |
    Out-File -FilePath $ApplicationLogPath
Write-Host "Application log saved to: $ApplicationLogPath" -ForegroundColor Green
Invoke-Item $ApplicationLogPath

Write-Host 'Script completed.' -ForegroundColor Yellow
Start-Sleep -Seconds 5
