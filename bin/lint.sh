#!/bin/bash
#
# lint.sh: Formats files to ensure consistency.
#
# This script performs two main actions:
# 1. Removes trailing whitespace from the end of lines.
# 2. Ensures that every file ends with a single newline character.
#
# It targets common text-based file types and ignores binary files,
# directories like .git, and other non-source files.

# Find all relevant text files to format.
# The list includes common config, documentation, and script files.
# It explicitly excludes paths like .git, .vscode, and challenge scan results.
FILES=$(find . -type f \
  -not -path "./.git/*" \
  -not -path "./.vscode/*" \
  -not -path "./challenges/*/scans/*" \
  \
  \
  -name "*.md" -o \
    -name "*.sh" -o \
    -name "*.yml" -o \
    -name "*.yaml" -o \
    -name "*.json" -o \
    -name "Dockerfile" -o \
    -name "*.conf" -o \
    -name ".gitignore" -o \
    -name ".env.example"
  \
)

# Process each file found.
for FILE in $FILES; do
  # 1. Remove trailing whitespace (spaces and tabs) from each line.
  # The '-i' flag modifies the file in-place.
  sed -i 's/[ \t]*$//' "$FILE"

  # 2. Ensure the file ends with exactly one newline.
  # If the last character of the file is not a newline, add one.
  if [ -n "$(tail -c1 "$FILE")" ]; then
    echo "" >> "$FILE"
  fi
done

echo "Linting complete. All targeted files have been formatted."
