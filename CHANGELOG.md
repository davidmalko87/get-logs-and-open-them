# Changelog

All notable changes to this project will be documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.1] - 2026-03-20

### Changed
- Refactored script with improved formatting and consistent style
- Added full comment-based help (synopsis, description, parameters, examples)
- Added MIT License

## [1.0.0] - 2022-12-22

### Added
- Initial release
- Export System and Application Windows Event Log errors and warnings to `.txt` files
- Configurable `-After` date filter (default `2022-01-12`)
- Configurable `-OutputPath` output directory (default `%USERPROFILE%\Downloads`)
- Auto-creates output directory if it does not exist
- Automatically opens exported files after writing
