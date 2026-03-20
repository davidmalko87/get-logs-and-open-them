# windows-eventlog-exporter

> PowerShell tool that exports Windows Event Log errors and warnings to text files and opens them instantly for review.

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey?logo=windows)

## What It Does

Queries the **System** and **Application** Windows Event Logs for `Error` and `Warning` entries after a configurable date, saves each log to a separate text file, and opens them automatically for review — no manual navigation required.

## Features

- Queries both System and Application event logs in one run
- Filters entries by a configurable start date
- Exports results to separate `.txt` files per log source
- Opens each file automatically after export
- Creates the output directory if it doesn't exist
- No external dependencies — pure PowerShell

## Requirements

- Windows with PowerShell 5.1 or later
- Sufficient permissions to read Windows Event Logs (run as Administrator if needed)

## Usage

**Default** — exports events after `2022-01-12` to your Downloads folder:

```powershell
.\script.ps1
```

**Custom date and output path:**

```powershell
.\script.ps1 -After "2024-01-01" -OutputPath "C:\Logs"
```

## Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `-After` | datetime | `2022-01-12` | Start date for log retrieval |
| `-OutputPath` | string | `%USERPROFILE%\Downloads` | Directory where result files are saved |

## Output Files

| File | Contents |
|---|---|
| `system-log.txt` | System Event Log errors and warnings |
| `application-log.txt` | Application Event Log errors and warnings |

## Notes

- The script pauses for 5 seconds before exiting so you can review console output
- If the output directory does not exist, it is created automatically
- Run as Administrator to ensure full access to all event log entries

## License

[MIT](LICENSE) © 2026 David Malko
