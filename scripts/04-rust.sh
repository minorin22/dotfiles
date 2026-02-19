#!/usr/bin/env zsh
# 04-rust.sh - Initialize rustup and install stable toolchain
# rustup itself is installed via Brewfile
set -euo pipefail

echo "==> [04] Rust (rustup)"

# rustup is installed via brew in 01-homebrew.sh
# We need to initialize it if not already done
if ! command -v rustc &>/dev/null; then
    echo "  -> Initializing rustup..."
    # brew installs rustup; use rustup-init to set up toolchains
    rustup-init -y --no-modify-path
fi

# Source cargo env for this session
[[ -f "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"

echo "  -> Setting default toolchain to stable..."
rustup default stable

echo "  -> Adding native arm64 target..."
rustup target add aarch64-apple-darwin

echo "  -> Adding rustfmt and clippy components..."
rustup component add rustfmt clippy

echo "  -> rustc: $(rustc --version)"
echo "  -> cargo: $(cargo --version)"
