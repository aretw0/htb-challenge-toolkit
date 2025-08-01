# 0009 - Simplification of Nmap Scan Script

## Status
Accepted

## Context
The `nmap_scan.sh` script attempted to infer the output directory based on `CHALLENGE_NAME`, adding unnecessary complexity.

## Decision
- Removed the `CHALLENGE_NAME` detection logic from `tools/nmap_scan.sh`.
- The `OUTPUT_DIR` now defaults to `scans/` in the project root, or can be explicitly specified with the `-o` option.
- The script now creates the output directory (`scans/`) if it does not exist.

## Consequences
- Simplified the Nmap scan script, making it more straightforward to use.
- Provided clear default behavior for scan output.
- Allowed for explicit control over output location when needed.
