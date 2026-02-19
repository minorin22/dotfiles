#!/usr/bin/env zsh
# 02-python.sh - Install uv (Python package/project manager)
# uv replaces: pyenv, pipenv, pipx, virtualenv
# miniforge (conda) is installed via Brewfile as a fallback for ML envs
set -euo pipefail

echo "==> [02] Python (uv)"

# Install uv if not already present
if ! command -v uv &>/dev/null && [[ ! -f "${HOME}/.local/bin/uv" ]]; then
    echo "  -> Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

export PATH="${HOME}/.local/bin:$PATH"
echo "  -> uv: $(uv --version)"

# Install Python 3.13 (latest stable as of 2026)
echo "  -> Installing Python 3.13..."
uv python install 3.13

echo "  -> Available Python versions:"
uv python list | head -5

echo "  -> Done. Use 'uv run', 'uv init', 'uv sync' for project workflows."
echo "     For conda/ML envs: run 'conda-activate' in your shell after setup."
