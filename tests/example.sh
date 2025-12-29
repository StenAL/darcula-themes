#!/bin/bash
# Example shell script demonstrating theme scopes.
#
# Usage: ./example.sh [name]

set -euo pipefail

# Constants and variables
MAX_COUNT=100
DEFAULT_NAME="default"
name="${1:-$DEFAULT_NAME}"

# Special variables
echo "Script: $0"
echo "Args: $#"
echo "Exit status: $?"
echo "Shell options: $-"
echo "All args: $@"

# Shell builtins
cd /tmp
pwd
echo "Current directory: $(pwd)"

# Function definition
process_item() {
    local item="$1"
    local count="${2:-0}"

    if [[ -z "$item" ]]; then
        echo "Error: empty item" >&2
        return 1
    fi

    # String operations
    echo "Processing: $item (count: $count)"
}

# Conditionals with test brackets
if [ -n "$name" ]; then
    echo "Name is set: $name"
fi

if [[ "$MAX_COUNT" -gt 50 && "$name" != "" ]]; then
    echo "Valid configuration"
fi

# Loops
for i in 1 2 3; do
    process_item "item_$i" "$i"
done

# Command substitution and pipes
files=$(ls -la | head -5)
echo "$files"

# Arrays
declare -a items=("one" "two" "three")
echo "First item: ${items[0]}"

# Aliases
alias ll="ls -la"
alias grep="grep --color=auto"

# External commands
curl --version > /dev/null 2>&1 || echo "curl not found"
git status 2>/dev/null || true

# Arithmetic
count=$((MAX_COUNT + 1))
echo "Count: $count"

# Here document
cat <<EOF
This is a here document.
Name: $name
Count: $count
EOF

echo "Done!"
