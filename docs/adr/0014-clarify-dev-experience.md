# 0014 - Clarification of Developer Experience (VS Code Dev Containers vs. Terminal)

## Status
Accepted

## Context
The introduction of the `Makefile` could create confusion for VS Code Dev Container users, as many `make` commands duplicate functionality already available directly in the container's terminal.

## Decision
Updated `README.md` and `GEMINI.md` to:
- Explain that, inside a Dev Container, the user is already in the container's shell.
- Recommend direct execution of scripts (`/workspace/tools/connect_vpn.sh`, `/workspace/tools/nmap_scan.sh`) for greater efficiency when inside the container.
- Acknowledge the continued utility of `make` commands for container lifecycle management (e.g., `make down`, `make clean`) from the host terminal.

## Consequences
- Provided clear guidance for users across different development environments.
- Optimized workflow for VS Code Dev Container users by promoting direct script execution.
- Reduced potential confusion and improved overall user experience.
