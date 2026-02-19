tap "homebrew/services"

# ============================================================
# Core CLI Tools
# ============================================================
brew "git"
brew "git-lfs"
brew "gh"                    # GitHub CLI
brew "mas"                   # Mac App Store CLI
brew "wget"
brew "curl"
brew "aria2"                 # Fast parallel downloader
brew "jq"                    # JSON processor
brew "yq"                    # YAML processor

# Modern CLI replacements
brew "eza"                   # ls replacement (alias ls='eza --icons')
brew "bat"                   # cat replacement
brew "ripgrep"               # grep replacement
brew "fd"                    # find replacement
brew "fzf"                   # fuzzy finder
brew "zoxide"                # smart cd
brew "delta"                 # better git diff

# Shell tools
brew "direnv"                # per-directory env vars
brew "tree"
brew "rename"
brew "nkf"                   # Japanese text encoding
brew "nmap"
brew "htop"
brew "tmux"
brew "pandoc"

# ============================================================
# Development: Build & Compilers
# ============================================================
brew "cmake"
brew "gcc"
brew "pkg-config"
brew "openssl@3"

# ============================================================
# Development: Language Runtime Managers
# ============================================================
brew "rustup"                # Rust toolchain manager

# NOTE: Python managed by uv (curl install) + miniforge cask (conda fallback)
# NOTE: Node.js managed by volta (curl install)

# ============================================================
# Development: Data & Services
# ============================================================
brew "postgresql@16"
brew "redis", restart_service: :changed
brew "sqlite"

# ============================================================
# Media & Computer Vision
# ============================================================
brew "ffmpeg"
brew "imagemagick"
brew "ghostscript"
brew "exiftool"
brew "yt-dlp"
brew "colmap"                # Structure-from-Motion (photogrammetry)
brew "opencv"
brew "libass"
brew "vapoursynth"

# ============================================================
# Casks: Terminal & Editors
# ============================================================
cask "ghostty"               # Terminal (replaces iterm2)
cask "font-hackgen-nerd"              # CJK + Nerd Font glyphs (for eza --icons etc.)
cask "visual-studio-code"
cask "zed"

# ============================================================
# Casks: Development
# ============================================================
cask "orbstack"              # Docker Desktop replacement
cask "miniforge"             # Conda (sub to uv, for ML envs)

# ============================================================
# Casks: Productivity & Utilities
# ============================================================
cask "obsidian"
cask "maccy"                 # Clipboard manager (replaces clipy)
cask "dropbox"
cask "topnotch"
cask "appcleaner"
cask "the-unarchiver"
cask "syntax-highlight"      # Quick Look syntax highlighting
cask "imhex"                 # Hex editor

# ============================================================
# Casks: Browser & Peripherals
# ============================================================
cask "google-chrome"         # Chrome (Discord/Slack as PWA)
cask "logi-options+"         # Logitech peripherals

# ============================================================
# Casks: LaTeX
# ============================================================
cask "mactex-no-gui"

# ============================================================
# Mac App Store
# ============================================================
mas "Final Cut Pro",                   id: 424389933
mas "Logic Pro",                       id: 634148309
mas "GarageBand",                      id: 682658836
mas "Keynote",                         id: 409183694
mas "Numbers",                         id: 409203825
mas "Pages",                           id: 409201541
mas "iMovie",                          id: 408981434
mas "Xcode",                           id: 497799835
mas "Hex Fiend",                       id: 1342896380
mas "Blackmagic Disk Speed Test",      id: 425264550
mas "LINE",                            id: 539883307
mas "Kindle",                          id: 302584613
mas "uBlacklist for Safari",           id: 1547912640
mas "uBlock Origin Lite",              id: 6745342698
mas "Y!News Excluder for Safari",      id: 6461722709
mas "Control Panel for Twitter",       id: 1668516167
mas "Control Panel for YouTube",       id: 6478456678

# ============================================================
# VSCode Extensions
# ============================================================
# Theme & Icons
vscode "minorin.theme-monokai-japan"
vscode "file-icons.file-icons"

# AI
vscode "github.copilot"
vscode "github.copilot-chat"
vscode "openai.chatgpt"

# Python
vscode "ms-python.python"
vscode "ms-python.vscode-pylance"
vscode "ms-python.debugpy"
vscode "ms-python.vscode-python-envs"
vscode "charliermarsh.ruff"
vscode "ms-toolsai.jupyter"
vscode "ms-toolsai.jupyter-keymap"
vscode "ms-toolsai.jupyter-renderers"
vscode "ms-toolsai.vscode-jupyter-cell-tags"
vscode "ms-toolsai.vscode-jupyter-slideshow"

# C/C++
vscode "ms-vscode.cpptools"
vscode "ms-vscode.cmake-tools"
vscode "twxs.cmake"

# Git
vscode "mhutchie.git-graph"
vscode "eamodio.gitlens"

# Formatters
vscode "esbenp.prettier-vscode"
vscode "dbaeumer.vscode-eslint"

# Frontend
vscode "svelte.svelte-vscode"
vscode "jpoissonnier.vscode-styled-components"

# LaTeX
vscode "james-yu.latex-workshop"
vscode "torn4dom4n.latex-support"

# Markdown & Docs
vscode "marp-team.marp-vscode"
vscode "bierner.markdown-mermaid"
vscode "bpruitt-goddard.mermaid-markdown-syntax-highlighting"
vscode "yzane.markdown-pdf"
vscode "chrischinchilla.vscode-pandoc"
vscode "lextudio.restructuredtext"

# Data & Misc
vscode "be5invis.toml"
vscode "mechatroner.rainbow-csv"
vscode "ms-vscode-remote.remote-ssh"
vscode "ms-ceintl.vscode-language-pack-ja"
vscode "minorin.vscode-language-pack-ko-hanja"
vscode "ms-ceintl.vscode-language-pack-ko"

# ============================================================
# Intentionally EXCLUDED:
# - iterm2             → ghostty
# - karabiner-elements → cmd-eikana (manual install via scripts/06-manual-apps.sh)
# - clipy              → maccy
# - docker-desktop     → orbstack
# - discord, slack     → PWA via Chrome
# - pyenv, nodenv, rbenv, nodebrew → uv (Python), volta (Node.js)
# - openssl@1.1        → openssl@3 (EOL)
# - gcloud-cli         → not in requirements
# - clip-studio-paint  → manual install (1.x only; brew cask installs 2.x)
# - whisky, kodi       → not in requirements
# - ollama             → not needed (using Claude API)
# - cargo "rust-stakeholder" → joke package
# - python@3.9         → managed by uv
# - google-drive, onedrive → Dropbox only
# - gemini-cli         → Claude Code
# ============================================================
