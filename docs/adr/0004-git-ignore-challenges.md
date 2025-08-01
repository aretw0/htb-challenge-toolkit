# 0004 - Git Ignoring of Challenge Directories

## Status
Accepted

## Context
The `challenges/` directory contained challenge-specific files that should not be versioned to maintain the repository's generic nature.

## Decision
Updated the `.gitignore` file to ignore all content within `challenges/` except for the `.gitkeep` file. This ensures that the directory structure is maintained in the repository while allowing challenge-specific files to remain untracked.

## Consequences
- Prevents accidental versioning of sensitive or challenge-specific files.
- Maintains a clean and generic repository for the toolkit.
- Ensures the `challenges/` directory structure is present for new users.
