# 0003 - Clarification of "Challenge" vs. "Machine" Terminology

## Status
Accepted

## Context
Initial documentation and examples used "challenge" and "machine" interchangeably, which did not accurately reflect Hack The Box scenarios involving multiple targets (Paths).

## Decision
- **`templates/WRITEUP_TEMPLATE.md`:** Refactored to be more generic for a "challenge" (which may contain multiple machines), including sections to document individual machines within it.
- **`bin/create_challenge.sh`:** Adjusted to use the new terminology and template placeholders.
- **`README.md` and `GEMINI.md`:** Updated to clarify the distinction between "challenge" (Path/series of machines) and "individual machine", and to provide more comprehensive usage examples for `create_challenge.sh`.

## Consequences
- Improved clarity and accuracy of terminology across the project.
- Better support for documenting complex Hack The Box scenarios (e.g., Paths).
- More intuitive usage of `create_challenge.sh` for different challenge types.
