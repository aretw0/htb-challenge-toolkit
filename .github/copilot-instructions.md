# Copilot Instructions

## Core Principles

*   **Context:** Utilize surrounding code, comments, and project files for relevant suggestions.
*   **Review:** Always verify suggestions for correctness, conventions, and security.
*   **Linting:** Before generating or committing code, be aware of the project's linting standards. Run `make lint` to ensure all files are correctly formatted.
*   **Efficiency:** Prefer direct script execution within Dev Containers; use `make` for host-level Docker management.
*   **ADRs:** Prioritize updating existing ADRs; create new ones only for significant architectural changes.

## Project Context

This project is a Hack The Box challenge toolkit. Key aspects:

*   **Purpose:** Consistent, controlled pentest environment (Docker, VPN, Nmap).
*   **Languages:** Primarily Bash scripting, Docker.
*   **Structure:**
    *   `bin/`: Project management scripts.
    *   `tools/`: Pentest utility scripts.
    *   `challenges/`: Challenge files, writeups, scans.
    *   `docker/`: Dockerfile, docker-compose.yml.
    *   `docs/`: Architecture, ADRs.
*   **Key Scripts:** `bin/create_challenge.sh`, `tools/connect_vpn.sh`, `tools/nmap_scan.sh`.
*   **Makefile:** Simplifies Docker and script execution commands. Be aware of `make` targets.
*   **Documentation:** Emphasize clear, concise documentation focusing on *why*.

### Model Context Protocol (MCP) Server

*   **Purpose:** GitHub MCP server for AI model integration.
*   **Configuration:** Requires `GITHUB_PERSONAL_ACCESS_TOKEN` in `.env` (from `.env.example`).
*   **Management:** Use `make mcp-up SERVICE=github` and `make mcp-down SERVICE=github`.

## Mermaid Diagrams

*   **Syntax:** Avoid `()`, `[]`, `{}`, `.`, `-`, `_` in node IDs. Use `ID["Label"]` for labels with spaces.
*   **`architecture-beta`:** Use `group ID(mdi:icon)[Label]` and `service ID(mdi:icon)[Label]`.
*   **`graph`:** Use `ID[Label]` or `ID(Label)`. Apply `style` for custom formatting.
*   **Connectors:** Use `-->` for directed arrows; `"Label"` for labels.
*   **Validation:** Always validate syntax in a previewer.
