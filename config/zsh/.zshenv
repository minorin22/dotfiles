# .zshenv - Sourced by ALL zsh instances (interactive and non-interactive)
# Keep this minimal. Heavy initialization belongs in .zshrc.

# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

# Default editor (available to non-interactive shells and scripts)
export EDITOR="code --wait"
export VISUAL="code --wait"
