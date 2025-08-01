# 0002 - Documentation Refinement and Conventions

## Status
Accepted

## Context
To ensure clear communication and consistent development practices, documentation and conventions needed refinement.

## Decision
- **`GEMINI.md` Refactoring:** Refactored `GEMINI.md` to be concise and focused on collaboration guidelines for Gemini, including atomic commits, self-documentation, and tool prioritization.
- **Scan Log Management:**
    - Modified `bin/create_challenge.sh` to automatically create a `scans/` subdirectory within each challenge directory.
    - Modified `tools/nmap_scan.sh` to save scan results to the `scans/` folder by default.
    - Updated `README.md` and `GEMINI.md` to instruct users to navigate to the challenge directory before running `nmap_scan.sh`.

## Consequences
- Improved clarity and consistency in documentation.
- Centralized scan results within challenge directories, preventing repository clutter.
- Clearer guidelines for Gemini's interaction and contribution.
