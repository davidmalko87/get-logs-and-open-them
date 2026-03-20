# Get Logs and Open Them

A PowerShell script that retrieves Windows Event Log errors and warnings, exports them to text files, and opens them automatically for review.

## What It Does

- Queries the **System** and **Application** Windows Event Logs for `Error` and `Warning` entries
- Filters entries after a configurable date
- Saves results to text files in a configurable output directory
- Opens each file immediately after export

## Requirements

- Windows PowerShell 5.1 or later
- Sufficient permissions to read Windows Event Logs (typically requires running as Administrator)

## Usage

### Default (logs after 2022-01-12, saved to Downloads)

```powershell
.\script.ps1
```

### Custom date and output path

```powershell
.\script.ps1 -After "2024-01-01" -OutputPath "C:\Logs"
```

## Parameters

| Parameter    | Type     | Default                        | Description                                      |
|--------------|----------|--------------------------------|--------------------------------------------------|
| `-After`     | datetime | `2022-01-12`                   | Start date for log retrieval                     |
| `-OutputPath`| string   | `%USERPROFILE%\Downloads`      | Directory where result files are saved           |

## Output Files

| File                  | Contents                              |
|-----------------------|---------------------------------------|
| `system-log.txt`      | System Event Log errors and warnings  |
| `application-log.txt` | Application Event Log errors/warnings |

## Notes

- If the output directory does not exist, the script creates it automatically.
- The script pauses for 5 seconds before exiting so you can review the console output.
