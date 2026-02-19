#!/usr/bin/env zsh
# 05-claude-code.sh - Install Claude Code CLI via npm (managed by volta)
set -euo pipefail

echo "==> [05] Claude Code CLI"

export VOLTA_HOME="${HOME}/.volta"
export PATH="${VOLTA_HOME}/bin:$PATH"

if ! command -v claude &>/dev/null; then
    echo "  -> Installing @anthropic-ai/claude-code..."
    npm install -g @anthropic-ai/claude-code
else
    echo "  -> Already installed. Updating..."
    npm update -g @anthropic-ai/claude-code
fi

echo "  -> claude: $(claude --version 2>/dev/null || echo 'installed')"
