#!/bin/bash
#
# pre-commit: Git hook to run linter before each commit.
#
# This hook executes the main linting script (lint.sh) to automatically
# format staged files. After linting, it re-adds the modified files
# to the staging area so the changes are included in the commit.

echo "Running pre-commit hook..."

# Execute the main linter to format files
bin/lint.sh > /dev/null 2>&1

echo "Formatting complete. Adding changes to the commit..."

# Find all files that were staged and re-add them to capture any
# formatting changes applied by the linter.
STAGED_FILES=$(git diff --name-only --cached)
if [ -n "$STAGED_FILES" ]; then
  git add $STAGED_FILES
fi

echo "Pre-commit hook finished."
exit 0
