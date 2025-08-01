# 0001 - Repository Organization and Structure

## Status
Accepted

## Context
The initial repository structure needed clear organization for scripts and documentation to support a generic Hack The Box challenge toolkit.

## Decision
- **Script Directories:**
    - Created `bin/` for repository management scripts (e.g., `create_challenge.sh`).
    - Created `tools/` for pentest utility scripts (e.g., `nmap_scan.sh`).
- **Templates:**
    - Created `templates/` and `templates/WRITEUP_TEMPLATE.md` to standardize challenge documentation.
- **Challenge Creation Automation:**
    - Developed `bin/create_challenge.sh` to automate the creation of new challenge folder structures, including copying `WRITEUP_TEMPLATE.md`.
- **VS Code Integration:**
    - Configured `.vscode/tasks.json` to allow `create_challenge.sh` to be executed directly from VS Code.

## Consequences
- Improved clarity and separation of concerns for different types of scripts.
- Standardized documentation for challenges.
- Streamlined the process of setting up new challenges.
- Enhanced developer experience for VS Code users.
