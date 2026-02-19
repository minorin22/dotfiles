#!/usr/bin/env zsh
# 06-manual-apps.sh - Install apps not available via Homebrew
set -euo pipefail

echo "==> [06] Manual Apps"

# ============================================================
# cmd-eikana (karabiner-elements replacement, Apple Silicon native)
# https://github.com/dominion525/cmd-eikana
# ============================================================
CMD_EIKANA_VERSION="2.4.2"
CMD_EIKANA_URL="https://github.com/dominion525/cmd-eikana/releases/download/v${CMD_EIKANA_VERSION}/cmd-eikana-v${CMD_EIKANA_VERSION}-arm64.zip"
CMD_EIKANA_APP="/Applications/⌘英かな.app"

if [[ -d "${CMD_EIKANA_APP}" ]]; then
    echo "  -> cmd-eikana already installed at ${CMD_EIKANA_APP}"
else
    echo "  -> Downloading cmd-eikana v${CMD_EIKANA_VERSION}..."
    TEMP_DIR="$(mktemp -d)"
    trap "rm -rf '${TEMP_DIR}'" EXIT

    curl -fsSL "${CMD_EIKANA_URL}" -o "${TEMP_DIR}/cmd-eikana.zip"
    unzip -q "${TEMP_DIR}/cmd-eikana.zip" -d "${TEMP_DIR}/"

    if [[ -d "${TEMP_DIR}/⌘英かな.app" ]]; then
        cp -r "${TEMP_DIR}/⌘英かな.app" /Applications/
        echo "  -> cmd-eikana installed to /Applications/"
    else
        echo "  -> [ERROR] cmd-eikana.app not found in zip. Contents:"
        ls "${TEMP_DIR}/"
        exit 1
    fi
fi

echo ""
echo "  [ACTION REQUIRED] cmd-eikana needs Accessibility permission:"
echo "    System Settings > Privacy & Security > Accessibility"
echo "    -> Add cmd-eikana and enable it"
echo ""

# ============================================================
# Clip Studio Paint 1.x - WARNING
# ============================================================
echo "  [WARNING] Clip Studio Paint:"
echo "    The brew cask installs 2.x which is INCOMPATIBLE with your 1.x license."
echo "    Download 1.x manually from: https://www.clipstudio.net/en/dl/"
echo "    Install the .dmg and use your existing 1.x serial number."
echo ""
