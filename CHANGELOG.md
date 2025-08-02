# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-08-02

### Added
- **Native Linting System:** Implemented a dependency-free linting script (`bin/lint.sh`) to enforce code consistency (trailing whitespace and end-of-file newlines).
- **Makefile Integration:** Added `make lint` to run the linter manually and `make install-hook` to install an optional Git pre-commit hook for automated formatting.
- **VS Code Task:** Included a VS Code task to run the linter via `make lint`.
- **Documentation:** Updated `CONTRIBUTING.md`, `GEMINI.md`, and `.github/copilot-instructions.md` to reflect the new linting process.
- **License:** Added a GPLv3 license to the project.

## [1.0.0] - 2025-08-02

### Added
- **Official Release:** Marks the stabilization of the core feature set and development workflows.

## [0.6.0] - 2025-08-01

### Changed
- **Decoupled Container Lifecycle:** Modified the Docker container's startup command to `tail -f /dev/null`. This ensures the container starts reliably and remains active, independent of the VPN connection status, guaranteeing a stable development environment.
- **Explicit VPN Control:** Removed automatic VPN initialization from container startup. The connection is now managed manually by the developer from within the container, providing full control and clear feedback.
- **Standardized Docker Usage:** Corrected the Docker volume mount to ensure the entire project root is accessible at `/workspace` and standardized `docker-compose` execution from the project root.
- **Refactored Documentation:** Consolidated and streamlined ADRs for clarity and translated all documentation to Portuguese.

### Removed
- **Implicit File Creation:** Removed the automatic creation of placeholder `.ovpn` files from `create_challenge.sh`.

## [0.5.0] - 2025-08-01

### Removed
- **MCP Server Management via Docker Compose/Makefile:** Eliminated the direct management of the `github-mcp-server` via `docker-compose.yml` and `Makefile` targets (`mcp-up`, `mcp-down`).

### Changed
- **MCP Server Configuration:** Centralized `github-mcp-server` configuration to `.vscode/mcp.json` (for VS Code) and `~/.gemini/settings.json` (for Gemini CLI).
- **Documentation:** Updated `docs/adr/0001-environment-and-tooling.md` and `README.md` to reflect the new MCP server management approach.

## [0.4.0] - 2025-07-28

### Added
- **Contribution Guidelines:** Added `CONTRIBUTING.md` and AI-specific instructions (`GEMINI.md`, `.github/copilot-instructions.md`).
- **Standardized Documentation:** Created `WRITEUP_TEMPLATE.md` for challenges.

### Removed
- **Redundant Configuration:** Deleted the `.env.example` file as it became obsolete.

## [0.3.0] - 2025-07-25

### Added
- **Architectural Decision Records (ADRs):** Introduced a structured process for documenting architectural decisions in the `docs/adr` directory.
- **Makefile:** Created a `Makefile` to simplify common commands for environment management (`up`, `down`, `shell`), VPN connection, and Nmap scans.
- **Development Journal:** Created `JOURNAL.md` for development logging.

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
