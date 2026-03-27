# Contributing

Thank you for considering a contribution to **windows-eventlog-exporter**!

## Versioning policy

This project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

| Change type | Version bump |
|---|---|
| Bug fix or minor improvement | PATCH (`1.0.x`) |
| New feature (backwards-compatible) | MINOR (`1.x.0`) |
| Breaking change | MAJOR (`x.0.0`) |

## Two-file update rule

**Every pull request that changes behaviour must update exactly two files together:**

1. **`script.ps1`** — bump the `Version:` field in the `.NOTES` block of the comment-based help.
2. **`CHANGELOG.md`** — add a new entry at the top of the file describing what changed and why.

Pull requests that change behaviour without updating both files will not be merged.

## Development workflow

1. Fork the repository and create a feature branch from `main`.
2. Make your changes to `script.ps1`.
3. Run the linter locally:
   ```powershell
   Install-Module PSScriptAnalyzer -Force -Scope CurrentUser
   Invoke-ScriptAnalyzer -Path .\script.ps1
   ```
4. Fix any **Error**-level findings before opening a pull request.
5. Update `script.ps1` (version) and `CHANGELOG.md` as described above.
6. Open a pull request against `main` and fill in the PR template.

## Code style

- Follow the existing comment-based help structure.
- Use `Write-Host` with `-ForegroundColor` for user-facing status messages.
- Use `[CmdletBinding()]` and typed parameters.
- Keep the script self-contained — no external module dependencies.

## Reporting bugs

Please use the [Bug Report](.github/ISSUE_TEMPLATE/bug_report.yml) issue template.

## Requesting features

Please use the [Feature Request](.github/ISSUE_TEMPLATE/feature_request.yml) issue template.
