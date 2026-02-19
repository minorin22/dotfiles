# .zshrc - minorin's zsh config
# Target: macOS Tahoe / Apple Silicon (arm64 native, no Rosetta)
# Managed by dotfiles: https://github.com/minorin/dotfiles

# ============================================================
# Homebrew (arm64 only - no arch detection needed)
# ============================================================
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:$PATH"
export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH:-}"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"

# ============================================================
# Shell options
# ============================================================
setopt PROMPT_SUBST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
unsetopt nomatch

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

# ============================================================
# Completion (rebuild compdump once per day only)
# ============================================================
autoload -Uz compinit
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# ============================================================
# Prompt (preserved from original - 可愛いので)
# ============================================================
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr   "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats     "%F{yellow}%c%u[%b]%f "
zstyle ':vcs_info:*' actionformats '[%b|%a] '

local ok_yuno="%F{yellow}✘╹◡╹✘%f"
local bad_yuno="%F{red}✘>﹏<✘%f"
local _color="cyan"
[[ "$USER" == "root" ]] && _color="red"
local command_line="
%F{green}%B%*%b%f %F{${_color}}%B%n@%m%b%f \$vcs_info_msg_0_%F{green}%B%~%b%f
%(?.${ok_yuno}.${bad_yuno}) %F{yellow}%B%#%b%f "

export PROMPT="${command_line}"
precmd() { vcs_info }

# ============================================================
# Modern CLI aliases
# ============================================================
alias ls='eza --icons'
alias ll='eza --icons -lh'
alias la='eza --icons -lah'
alias lt='eza --icons --tree'
#alias cat='bat'
alias grep='rg'
#alias find='fd'
alias tree='tree -CN'
alias reload='source ~/.zshrc'
alias brewup='brew update && brew upgrade && brew cleanup'

# ============================================================
# PATH (order: most specific first)
# ============================================================
export PATH="${HOME}/.local/bin:$PATH"          # uv, local tools
export PATH="${HOME}/.cargo/bin:$PATH"          # Rust

# volta (Node.js)
export VOLTA_HOME="${HOME}/.volta"
export PATH="${VOLTA_HOME}/bin:$PATH"

# LaTeX (mactex)
[[ -d "/Library/TeX/texbin" ]] && export PATH="/Library/TeX/texbin:$PATH"

# PostgreSQL (homebrew)
[[ -d "${HOMEBREW_PREFIX}/opt/postgresql@16/bin" ]] && \
    export PATH="${HOMEBREW_PREFIX}/opt/postgresql@16/bin:$PATH"

# ============================================================
# Build flags (openssl@3 — NOT @1.1)
# ============================================================
if [[ -d "${HOMEBREW_PREFIX}/opt/openssl@3" ]]; then
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/openssl@3/lib"
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/openssl@3/include"
    export PKG_CONFIG_PATH="${HOMEBREW_PREFIX}/opt/openssl@3/lib/pkgconfig"
fi

# ============================================================
# Editor
# ============================================================
export EDITOR="code --wait"
export VISUAL="code --wait"

# ============================================================
# bat theme
# ============================================================
export BAT_THEME="Monokai Extended"

# ============================================================
# Tool integrations
# ============================================================
# zoxide (smart cd)
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# fzf (fuzzy finder)
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
fi

# direnv (per-directory env vars)
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# ============================================================
# miniforge / conda - lazy (NOT auto-activated)
# Run 'conda-activate' to enter conda environment
# ============================================================
conda-activate() {
    local _BASE="${HOMEBREW_PREFIX}/Caskroom/miniforge/base"
    if [[ ! -f "${_BASE}/bin/conda" ]]; then
        echo "miniforge not installed. Run: brew install --cask miniforge"
        return 1
    fi
    local _setup
    _setup="$("${_BASE}/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
    if [[ $? -eq 0 ]]; then
        eval "$_setup"
        echo "conda activated (base: ${_BASE})"
    else
        export PATH="${_BASE}/bin:$PATH"
    fi
}
