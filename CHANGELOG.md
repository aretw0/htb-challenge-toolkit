# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-08-01

### Added
- **Architectural Decision Records (ADRs):** Introduced a structured process for documenting architectural decisions in the `docs/adr` directory.
- **Makefile:** Created a `Makefile` to simplify common commands for environment management (`up`, `down`, `shell`), VPN connection, and Nmap scans.
- **Contribution Guidelines:** Added `CONTRIBUTING.md` and AI-specific instructions (`GEMINI.md`, `.github/copilot-instructions.md`).
- **Standardized Documentation:** Created `JOURNAL.md` for development logging and `WRITEUP_TEMPLATE.md` for challenges.

### Changed
- **Refactored Documentation:** Consolidated and streamlined ADRs for clarity and translated all documentation to Portuguese.
- **Simplified Environment:** Removed automatic VPN initialization, giving developers explicit control over the connection.
- **Improved Scripts:** Simplified `connect_vpn.sh` and `nmap_scan.sh` by removing implicit logic and favoring explicit parameters.
- **Standardized Docker Usage:** Corrected the Docker volume mount to ensure the entire project root is accessible at `/workspace` and standardized `docker-compose` execution from the project root.

### Removed
- **Redundant Configuration:** Deleted the `.env.example` file as it became obsolete.
- **Implicit File Creation:** Removed the automatic creation of placeholder `.ovpn` files from `create_challenge.sh`.

## [0.2.0] - 2025-07-20

### Added
- **Flexible VPN Configuration:** Implemented a priority-based system for selecting `.ovpn` files, allowing for global and challenge-specific VPNs.
- **Nmap Scan Script:** Introduced `tools/nmap_scan.sh` to automate network scans.

### Changed
- **Terminology:** Clarified the distinction between a "challenge" (a series of machines) and a single "machine" across all documentation.

## [0.1.0] - 2025-07-15

### Added
- **Initial Project Structure:** Established the initial repository layout with `bin`, `tools`, `docker`, and `challenges` directories.
- **Docker Environment:** Created a Docker-based pentesting environment with `nmap` and `openvpn`.
- **Challenge Creation Script:** Developed `bin/create_challenge.sh` to automate the setup of new challenge directories.
