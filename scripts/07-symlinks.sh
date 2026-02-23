#!/usr/bin/env zsh
# 07-symlinks.sh - Symlink dotfiles to their correct locations
# Backs up existing files before overwriting.
set -euo pipefail

echo "==> [07] Symlinks"

# DOTFILES_DIR is passed in from setup.sh via env
# Fallback: infer from this script's location (scripts/../)
DOTFILES_DIR="${DOTFILES_DIR:-${0:A:h:h}}"

# ---- Helper ------------------------------------------------
symlink() {
    local src="$1"
    local dst="$2"
    local dst_dir="${dst:h}"

    # Ensure destination directory exists
    mkdir -p "${dst_dir}"

    # Backup existing non-symlink files
    if [[ -e "${dst}" && ! -L "${dst}" ]]; then
        local backup="${dst}.backup.$(date +%Y%m%d_%H%M%S)"
        echo "  -> Backing up: ${dst} -> ${backup}"
        mv "${dst}" "${backup}"
    fi

    # Remove stale symlinks
    [[ -L "${dst}" ]] && rm "${dst}"

    # Create new symlink
    ln -sf "${src}" "${dst}"
    echo "  -> Linked: ${dst}"
    echo "             -> ${src}"
}

# ---- Shell -------------------------------------------------
symlink "${DOTFILES_DIR}/config/zsh/.zshrc"   "${HOME}/.zshrc"
symlink "${DOTFILES_DIR}/config/zsh/.zshenv"  "${HOME}/.zshenv"

# ---- Git ---------------------------------------------------
symlink "${DOTFILES_DIR}/config/git/.gitconfig" "${HOME}/.gitconfig"

# ---- Vim ---------------------------------------------------
symlink "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"

# ---- LaTeX -------------------------------------------------
symlink "${DOTFILES_DIR}/.latexmkrc" "${HOME}/.latexmkrc"

# ---- Ghostty -----------------------------------------------
symlink "${DOTFILES_DIR}/config/ghostty/config" \
    "${HOME}/.config/ghostty/config"

# ---- VSCode ------------------------------------------------
symlink "${DOTFILES_DIR}/config/vscode/settings.json" \
    "${HOME}/Library/Application Support/Code/User/settings.json"

# ---- Zed ---------------------------------------------------
symlink "${DOTFILES_DIR}/config/zed/settings.json" \
    "${HOME}/.config/zed/settings.json"
symlink "${DOTFILES_DIR}/config/zed/themes" \
    "${HOME}/.config/zed/themes"

echo ""
echo "  Symlinks created. Verify with:"
echo "    ls -la ~/.zshrc ~/.gitconfig ~/.config/ghostty/config"
