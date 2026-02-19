#!/usr/bin/env zsh
# 00-xcode-tools.sh - Ensure Xcode Command Line Tools are installed
set -euo pipefail

echo "==> [00] Xcode Command Line Tools"

if xcode-select -p &>/dev/null; then
    echo "  -> Already installed: $(xcode-select -p)"
else
    echo "  -> Installing Xcode Command Line Tools..."
    xcode-select --install

    echo "  -> Waiting for installation to complete..."
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    echo "  -> Installed: $(xcode-select -p)"
fi
