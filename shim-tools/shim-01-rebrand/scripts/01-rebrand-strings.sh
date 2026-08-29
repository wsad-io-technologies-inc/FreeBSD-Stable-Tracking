#!/usr/bin/env bash
set -euo pipefail

REPO_PATH="$1"
OS_NAME="$2"

echo "Replacing target cosmetic strings..."

# Safe string replacements targeting userland and documentation strings
# Avoids touching core kernel macros like __FreeBSD__ to ensure builds don't break.
TARGET_FILES=$(find "$REPO_PATH/sys/conf" "$REPO_PATH/usr.bin" "$REPO_PATH/bin" -type f \( -name "*.c" -name "*.h" -name "newvers.sh" -o -name "Makefile*" \) 2>/dev/null || true)

for file in $TARGET_FILES; do
    if grep -q "FreeBSD" "$file"; then
        # Perform safe, non-destructive substitutions on text/version strings
        sed -i.bak "s/FreeBSD Project/$OS_NAME Project/g" "$file"
        rm -f "${file}.bak"
    fi
done

echo "String replacement phase completed."