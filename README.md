# windows-eventlog-exporter

[![CI](https://github.com/davidmalko87/windows-eventlog-exporter/actions/workflows/ci.yml/badge.svg)](https://github.com/davidmalko87/windows-eventlog-exporter/actions/workflows/ci.yml)
[![Version](https://img.shields.io/badge/version-1.0.1-blue)](CHANGELOG.md)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-5391FE?logo=powershell&logoColor=white)](https://learn.microsoft.com/en-us/powershell/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows-0078D6?logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Last Commit](https://img.shields.io/github/last-commit/davidmalko87/windows-eventlog-exporter)](https://github.com/davidmalko87/windows-eventlog-exporter/commits/main)
[![Open Issues](https://img.shields.io/github/issues/davidmalko87/windows-eventlog-exporter)](https://github.com/davidmalko87/windows-eventlog-exporter/issues)

> A PowerShell script that exports Windows Event Log errors and warnings to text files and opens them instantly for review.

---

## Why?

Digging through Windows Event Viewer by hand is slow and repetitive. This script queries both the **System** and **Application** event logs in one command, saves the results to plain-text files, and opens them automatically — turning a multi-minute manual process into a single command.

---

## Features

| Feature | Description |
|---|---|
| Dual-log export | Queries both System and Application event logs in a single run |
| Severity filter | Captures only `Error` and `Warning` entries — no noise |
| Date filter | Configurable `-After` parameter keeps results focused on a time window |
| Auto-open | Exported files open automatically for immediate review |
| Auto-create output dir | Creates the output directory if it does not already exist |
| Zero dependencies | Pure Windows PowerShell — no modules to install |
| Colored console output | Blue / green / yellow status messages for at-a-glance progress |

---

## Quick Start

### 1. Prerequisites

- Windows with PowerShell 5.1 or later
- Permission to read Windows Event Logs (run as Administrator if needed)

### 2. Download

```powershell
git clone https://github.com/davidmalko87/windows-eventlog-exporter.git
cd windows-eventlog-exporter
```

Or download `script.ps1` directly.

### 3. Run

**Default** — exports events after `2022-01-12` to `%USERPROFILE%\Downloads`:

```powershell
.\script.ps1
```

**Custom date and output path:**

```powershell
.\script.ps1 -After "2024-01-01" -OutputPath "C:\Logs"
```

---

## Configuration reference

| Parameter | Type | Default | Description |
|---|---|---|---|
| `-After` | `datetime` | `2022-01-12` | Start date — only entries on or after this date are returned |
| `-OutputPath` | `string` | `%USERPROFILE%\Downloads` | Directory where the two output files are saved |

---

## Output files

| File | Contents |
|---|---|
| `system-log.txt` | System Event Log — errors and warnings |
| `application-log.txt` | Application Event Log — errors and warnings |

---

## Project structure

```
windows-eventlog-exporter/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.yml
│   │   └── feature_request.yml
│   ├── workflows/
│   │   └── ci.yml
│   └── PULL_REQUEST_TEMPLATE.md
├── script.ps1          # Main script
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

---

## Known limitations

- `Get-EventLog` is deprecated in PowerShell 7+ but continues to work on Windows via the compatibility shim. It is not available on Linux or macOS.
- `Invoke-Item` opens files with the system default viewer and requires an interactive GUI session. Running in a headless or SSH-only environment will produce a warning.
- The default `-After` date (`2022-01-12`) may return a large number of entries on systems with old logs. Use a more recent date to narrow results.

---

## License

[MIT](LICENSE) © 2026 David Malko

---

## Contributing & changelog

- [CONTRIBUTING.md](CONTRIBUTING.md) — versioning policy, development workflow, code style
- [CHANGELOG.md](CHANGELOG.md) — full release history
