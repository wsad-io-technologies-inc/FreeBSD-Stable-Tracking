#!/usr/bin/env bash
set -euo pipefail

REPO_PATH="${1:-$PWD}"
OS_NAME="${2:-YourOSName}"

echo "[$OS_NAME] Executing Shim 00: Root Overlay..."

# Load configuration if present
if [ -f "$PWD/shim-tools/config.cfg" ]; then
    source "$PWD/shim-tools/config.cfg"
fi

# Run ordered sub-scripts
for script in "$PWD/shim-tools/scripts/"*.sh; do
    if [ -f "$script" ]; then
        echo "Running $(basename "$script")..."
        bash "$script" "$REPO_PATH" "$OS_NAME"
    fi
done

echo "Shim 00 completed successfully."