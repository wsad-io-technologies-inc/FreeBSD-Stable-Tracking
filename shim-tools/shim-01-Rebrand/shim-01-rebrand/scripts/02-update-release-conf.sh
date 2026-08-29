#!/usr/bin/env bash
set -euo pipefail

REPO_PATH="$1"
OS_NAME="$2"

echo "Updating kernel version generation script (newvers.sh)..."

# FreeBSD uses sys/conf/newvers.sh to generate kernel identification strings (banner/uname)
NEWVERS_PATH="$REPO_PATH/sys/conf/newvers.sh"

if [ -f "$NEWVERS_PATH" ]; then
    # Safely override the default OS release identity string variable
    sed -i.bak 's/^RELEASE=".*"/RELEASE="'"$OS_NAME"'"/' "$NEWVERS_PATH"
    sed -i.bak 's/^REVISION=".*"/REVISION="1.0-RELEASE"/' "$NEWVERS_PATH"
    sed -i.bak 's/^BRANCH=".*"/BRANCH="development"/' "$NEWVERS_PATH"
    rm -f "${NEWVERS_PATH}.bak"
    echo "Successfully updated newvers.sh parameters."
else
    echo "::warning::newvers.sh not found at expected path."
fi