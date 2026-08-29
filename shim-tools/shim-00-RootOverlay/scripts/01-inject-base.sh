#!/usr/bin/env bash
set -euo pipefail

REPO_PATH="$1"
OS_NAME="$2"

echo "Injecting baseline overlay files for $OS_NAME..."

# Create a sample custom directory or system tracking file
mkdir -p "$REPO_PATH/sys/conf/os"
cat << EOF > "$REPO_PATH/sys/conf/os/version.txt"
OS_NAME="$OS_NAME"
SHIM_LAYER="00-RootOverlay"
BUILD_TIMESTAMP="$(date -u +"%Y-%m-%d %H:%M:%S UTC")"
EOF

echo "Base overlay injected."