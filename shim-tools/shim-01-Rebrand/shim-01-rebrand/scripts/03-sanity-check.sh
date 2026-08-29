#!/usr/bin/env bash
set -euo pipefail

REPO_PATH="$1"
OS_NAME="$2"

echo "Running post-rebrand sanity checks..."

# 1. Verify critical build files still exist and are readable
CRITICAL_FILES=(
    "$REPO_PATH/sys/conf/newvers.sh"
    "$REPO_PATH/Makefile"
    "$REPO_PATH/sys/kern/kern_mib.c"
)

for file in "${CRITICAL_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "::error::Critical build file missing after rebrand: $file"
        exit 1
    fi
done

# 2. Check for syntax errors in modified shell/config files
if command -v bash &>/dev/null; then
    bash -n "$REPO_PATH/sys/conf/newvers.sh"
fi

echo "Sanity checks passed cleanly."