#!/usr/bin/env zsh
# setup.sh - One-command Mac setup for M1Max MacBook Pro 16"
# Usage: zsh setup.sh [--skip-mas] [--skip-manual]
#
# Idempotent: safe to run multiple times.
# Requires: macOS Tahoe 26.2, Apple Silicon arm64 (native, NOT under Rosetta)

set -euo pipefail

DOTFILES_DIR="${0:A:h}"
LOG_FILE="${DOTFILES_DIR}/setup.log"

# ---- Colors ------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()   { echo -e "${GREEN}[$(date +%H:%M:%S)]${NC} $*" | tee -a "$LOG_FILE"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*" | tee -a "$LOG_FILE"; }
error() { echo -e "${RED}[ERROR]${NC} $*" | tee -a "$LOG_FILE"; }

# ---- arm64 guard -------------------------------------------
if [[ "$(uname -m)" != "arm64" ]]; then
    error "This setup requires native arm64. Do not run under Rosetta."
    error "Tip: open a new terminal and verify with: uname -m"
    exit 1
fi

# ---- Parse flags -------------------------------------------
SKIP_MAS=false
SKIP_MANUAL=false
for arg in "$@"; do
    [[ "$arg" == "--skip-mas" ]]    && SKIP_MAS=true
    [[ "$arg" == "--skip-manual" ]] && SKIP_MANUAL=true
done

if [[ "$SKIP_MAS" == true ]]; then
    warn "--skip-mas: Skipping Mac App Store installs (sign in to App Store first on next run)"
fi

# ---- Banner ------------------------------------------------
log "============================================================"
log "  dotfiles setup for $(whoami) on $(hostname -s)"
log "  macOS $(sw_vers -productVersion) | $(uname -m)"
log "  Dotfiles: ${DOTFILES_DIR}"
log "============================================================"

# ---- Run subscript -----------------------------------------
run() {
    local script="$1"
    log ""
    log "--- [${script}] ---"
    DOTFILES_DIR="${DOTFILES_DIR}" zsh "${DOTFILES_DIR}/scripts/${script}" 2>&1 | tee -a "$LOG_FILE"
}

# --- Path ---------------------------------------------------
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:$PATH"
export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH:-}"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"

# ---- Execution order (dependencies matter) -----------------
run "00-xcode-tools.sh"
run "01-homebrew.sh"
run "02-python.sh"
run "03-node.sh"
run "04-rust.sh"
run "05-claude-code.sh"

if [[ "$SKIP_MANUAL" == false ]]; then
    run "06-manual-apps.sh"
fi

run "07-symlinks.sh"

log ""
log "--- [macos-defaults.sh] ---"
DOTFILES_DIR="${DOTFILES_DIR}" zsh "${DOTFILES_DIR}/macos-defaults.sh" 2>&1 | tee -a "$LOG_FILE"

# ---- Done --------------------------------------------------
log ""
log "============================================================"
log "  Setup complete!"
log "  Log saved to: ${LOG_FILE}"
log "============================================================"
log ""
log "Next steps (manual):"
log "  1. Sign in to Dropbox and wait for sync"
log "  2. Install Clip Studio Paint 1.x from https://www.clipstudio.net/en/dl/"
log "     (DO NOT install 2.x - you have a 1.x license)"
log "  3. Open cmd-eikana from /Applications and grant Accessibility permission"
log "  4. Install Adobe Creative Cloud from https://creativecloud.adobe.com"
log "  5. Set up SSH key:"
log "       ssh-keygen -t ed25519 -C 'your@email.com'"
log "       gh auth login"
log "  6. In Chrome: open Discord/Slack and install as PWA"
log "       (Menu → ... → Save and share → Install page as app)"
log ""
log "Restart required for all macOS defaults to take effect."
