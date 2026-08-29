#!/usr/bin/env bash
set -euo pipefail

REPO_PATH="${1:-$PWD}"
OS_NAME="${2:-YourOSName}"

echo "[$OS_NAME] Executing Shim 01: Rebrand Engine..."

# Execute pipeline tasks with failure detection
bash "$PWD/shim-tools/scripts/01-rebrand-strings.sh" "$REPO_PATH" "$OS_NAME"
bash "$PWD/shim-tools/scripts/02-update-release-conf.sh" "$REPO_PATH" "$OS_NAME"
bash "$PWD/shim-tools/scripts/03-sanity-check.sh" "$REPO_PATH" "$OS_NAME"

echo "Shim 01 rebranding completed successfully."