#!/bin/bash
#
# install-hook.sh: Installs the Git pre-commit hook for this repository.
#
# This script creates a symbolic link from the project's script directory
# to the local .git/hooks directory. This allows the hook to be version-controlled
# and easily updated.

# Define the source script for the hook and its destination in .git/hooks
HOOK_DIR=".git/hooks"
HOOK_NAME="pre-commit"
HOOK_SOURCE_SCRIPT="bin/run-linter.sh"
HOOK_DESTINATION="${HOOK_DIR}/${HOOK_NAME}"

# Create the .git/hooks directory if it doesn't exist
mkdir -p "$HOOK_DIR"

# Create the pre-commit hook script that will be symlinked
cat > "$HOOK_SOURCE_SCRIPT" <<'EOF'
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
EOF

# Make the source hook script executable
chmod +x "$HOOK_SOURCE_SCRIPT"

# Create a symbolic link in the .git/hooks directory that points to our script.
# The 'ln' command with '-s' creates a symbolic link and '-f' forces it,
# overwriting any existing hook with the same name.
# Using a relative path ensures it works for all users.
ln -sf "../../${HOOK_SOURCE_SCRIPT}" "${HOOK_DESTINATION}"

echo "Git pre-commit hook installed successfully."
echo "The linter will now run automatically before each commit."
