#!/usr/bin/env zsh
# 03-node.sh - Install volta (Node.js version manager)
# volta replaces: nodenv, nodebrew, nvm
set -euo pipefail

echo "==> [03] Node.js (volta)"

# Install volta if not already present
if ! command -v volta &>/dev/null && [[ ! -d "${HOME}/.volta" ]]; then
    echo "  -> Installing volta..."
    curl https://get.volta.sh | bash
fi

export VOLTA_HOME="${HOME}/.volta"
export PATH="${VOLTA_HOME}/bin:$PATH"
echo "  -> volta: $(volta --version)"

# Install Node.js LTS
echo "  -> Installing Node.js LTS..."
volta install node@lts

echo "  -> Node: $(node --version)"
echo "  -> npm:  $(npm --version)"
