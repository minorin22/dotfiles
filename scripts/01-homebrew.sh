#!/usr/bin/env zsh
# 01-homebrew.sh - Install Homebrew and run brew bundle
set -euo pipefail

echo "==> [01] Homebrew"

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "  -> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure arm64 Homebrew is on PATH for the rest of this session
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "  -> Homebrew: $(brew --version | head -1)"

# Check Mac App Store sign-in for mas
if ! mas account &>/dev/null; then
    echo "  -> [WARN] Not signed in to Mac App Store."
    echo "     Sign in via System Settings > Apple ID, then re-run."
    echo "     Continuing with --skip-mas for now..."
    BREW_BUNDLE_FLAGS="--without-mas"
else
    echo "  -> App Store: $(mas account)"
    BREW_BUNDLE_FLAGS=""
fi

# Run brew bundle
echo "  -> Running brew bundle (this may take a while)..."
brew bundle \
    --file="${DOTFILES_DIR}/Brewfile" \
    ${BREW_BUNDLE_FLAGS:-}

brew cleanup
echo "  -> brew bundle complete."
