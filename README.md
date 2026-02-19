# dotfiles

M1Max MacBook Pro 16" (macOS Tahoe / Apple Silicon arm64) のセットアップ用 dotfiles。

`zsh setup.sh` 1コマンドで全環境が整います。

---

## 必要条件

- macOS Tahoe 26.2 以降
- Apple Silicon (arm64) ネイティブ（Rosetta 不可）
- iCloud ログイン済み
- インターネット接続

---

## セットアップ手順

### 1. このリポジトリをクローン

```zsh
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

### 2. セットアップスクリプトを実行

```zsh
zsh setup.sh
```

初回は Xcode Command Line Tools のインストールを求められます。
ダイアログが出たらインストールし、完了後に再実行してください。

### 3. ログアウト → 再ログイン

macOS のシステム設定を反映させるために必要です。

---

## オプション

| フラグ | 説明 |
|--------|------|
| `--skip-mas` | Mac App Store のインストールをスキップ（App Store 未サインイン時に使用） |
| `--skip-manual` | 手動インストール（cmd-eikana 等）をスキップ |

```zsh
# 例: MAS をスキップ
zsh setup.sh --skip-mas

# 例: 両方スキップ
zsh setup.sh --skip-mas --skip-manual
```

---

## インストールされるもの

### CLI ツール
| ツール | 説明 |
|--------|------|
| `eza` | `ls` の代替（`alias ls='eza --icons'`） |
| `bat` | `cat` の代替（シンタックスハイライト付き） |
| `ripgrep` | `grep` の代替（高速） |
| `fd` | `find` の代替（シンプル） |
| `fzf` | ファジーファインダー |
| `zoxide` | スマート `cd` |
| `delta` | git diff の美化ページャー |
| `gh` | GitHub CLI |
| `direnv` | ディレクトリ単位の環境変数管理 |

### 言語・ランタイム
| ツール | 説明 |
|--------|------|
| `uv` | Python パッケージ・プロジェクト管理（pyenv / pipenv の代替） |
| `volta` | Node.js バージョン管理（nodenv / nodebrew の代替） |
| `rustup` | Rust ツールチェイン管理 |

### アプリケーション
| アプリ | 説明 |
|--------|------|
| Ghostty | ターミナル（iterm2 の代替） |
| VSCode | エディタ |
| Zed | モダンエディタ |
| OrbStack | コンテナ環境（Docker Desktop の代替） |
| Maccy | クリップボードマネージャー（Clipy の代替） |
| Obsidian | ノート・ナレッジベース |
| miniforge | conda 環境（ML 用サブ、デフォルト無効） |
| mactex-no-gui | LaTeX 環境 |

---

## セットアップ後の手動作業

スクリプト完了後、以下を手動で行ってください。

### 必須
- [ ] **Dropbox** にサインインして同期を待つ
- [ ] **Clip Studio Paint 1.x** を手動インストール
  - ダウンロード: https://www.clipstudio.net/en/dl/
  - ⚠️ 2.x は入れないこと（1.x ライセンスのため）
- [ ] **cmd-eikana** のアクセシビリティ許可
  - システム設定 → プライバシーとセキュリティ → アクセシビリティ → cmd-eikana を追加してオン
- [ ] **SSH キー** の生成と GitHub への登録
  ```zsh
  ssh-keygen -t ed25519 -C "your@email.com"
  gh auth login
  ```

### 任意
- [ ] **Adobe Creative Cloud** を手動インストール
  - https://creativecloud.adobe.com
- [ ] **Rhinoceros** を手動インストール（brew 未対応）
- [ ] **Chrome** で Discord・Slack を PWA としてインストール
  - 各サイトを開く → メニュー → ... → 「ページをアプリとしてインストール」

---

## ファイル構成

```
dotfiles/
├── Brewfile                    # パッケージ定義
├── setup.sh                   # メインスクリプト（エントリポイント）
├── macos-defaults.sh          # macOS システム設定
├── scripts/
│   ├── 00-xcode-tools.sh      # Xcode CLI ツール
│   ├── 01-homebrew.sh         # Homebrew + brew bundle
│   ├── 02-python.sh           # uv + Python 3.13
│   ├── 03-node.sh             # volta + Node.js LTS
│   ├── 04-rust.sh             # rustup stable
│   ├── 05-claude-code.sh      # Claude Code CLI
│   ├── 06-manual-apps.sh      # cmd-eikana 等
│   └── 07-symlinks.sh         # シンボリックリンク作成
├── config/
│   ├── zsh/
│   │   ├── .zshrc             # zsh 設定
│   │   └── .zshenv            # 全シェル共通環境変数
│   ├── git/
│   │   └── .gitconfig         # git 設定
│   ├── ghostty/
│   │   └── config             # Ghostty 設定（Monokai-Japan テーマ）
│   ├── vscode/
│   │   └── settings.json      # VSCode 設定
│   └── zed/
│       └── settings.json      # Zed 設定
├── .vimrc                     # Vim 設定（そのまま移行）
└── .latexmkrc                 # LaTeX 設定（そのまま移行）
```

---

## スクリプトを個別に実行する

何か失敗した場合や、特定のステップだけやり直したい場合は個別実行できます。

```zsh
# 例: Homebrew のみ再実行
DOTFILES_DIR="$(pwd)" zsh scripts/01-homebrew.sh

# 例: シンボリックリンクだけ再作成
DOTFILES_DIR="$(pwd)" zsh scripts/07-symlinks.sh
```

---

## シンボリックリンクの確認

```zsh
ls -la ~/.zshrc ~/.gitconfig ~/.config/ghostty/config
```

---

## ツールの動作確認

```zsh
eza --version && bat --version && rg --version && fd --version
uv --version && volta --version && rustc --version
claude --version
```

---

## conda を使う場合

conda はデフォルトでシェルを汚染しないよう無効化されています。
必要なときだけ以下で有効化してください。

```zsh
conda-activate
conda create -n myenv python=3.11
conda activate myenv
```

---

## ログ

セットアップログは `setup.log` に保存されます。
エラーが出たときは確認してください。

```zsh
cat setup.log
```
