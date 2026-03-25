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

新しいMacでは `git` コマンドが Xcode Command Line Tools（CLT）のインストールを自動的に促します。
ダイアログが出たらインストールし、完了後に再度クローンしてください。

```zsh
# HTTPSでクローン（初回セットアップ時はSSHキー未設定のためHTTPS推奨）
git clone https://github.com/minorin22/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. セットアップスクリプトを実行

```zsh
zsh setup.sh
```

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
| Neovim | ターミナルエディタ（LazyVim ベース） |
| Skim | PDF ビューア（LaTeX SyncTeX 対応） |
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
│   ├── zed/
│   │   └── settings.json      # Zed 設定
│   └── nvim/                  # Neovim 設定（LazyVim）
│       ├── init.lua           # ブートストラップ
│       ├── lazyvim.json       # extras 宣言
│       ├── colors/
│       │   └── monokai-japan.lua  # カスタムカラースキーム
│       └── lua/
│           ├── config/        # options, keymaps, autocmds
│           └── plugins/       # プラグイン設定
├── .vimrc                     # Vim 設定（レガシー、残置）
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

## Neovim (LazyVim)

ターミナルエディタとして [LazyVim](https://www.lazyvim.org/) ベースの Neovim を導入しています。

### 初回セットアップ

```zsh
# setup.sh 実行後、Neovim を起動するとプラグインが自動インストールされる
nvim
# :checkhealth で環境を確認
```

初回起動時に lazy.nvim が全プラグインをダウンロードし、mason.nvim が LSP サーバーを自動インストールします（数分かかります）。

### 主要キーバインド

| キー | 動作 |
|------|------|
| `Space` | リーダーキー（which-key でガイド表示） |
| `Ctrl-n` | ファイルエクスプローラ（neo-tree）切替 |
| `Space ff` | ファイル検索（Telescope） |
| `Space fg` / `Space /` | テキスト検索（ripgrep） |
| `fb` | バッファ検索 |
| `fl` | 現在ファイル内の行検索 |
| `fr` | カーソル位置の単語を全文検索 |
| `fc` | コミット履歴検索 |
| `]h` / `[h` | 次の/前の git hunk に移動 |
| `Space mp` | Markdown プレビュー開始/停止（ブラウザ） |
| `Space ms` | Marp スライドプレビュー開始 |
| `Space mS` | Marp スライドプレビュー停止 |
| `Space ll` | LaTeX コンパイル開始/停止 |
| `Space lv` | LaTeX PDF 表示（Skim） |

### 対応言語（LSP）

| 言語 | LSP サーバー |
|------|-------------|
| C/C++/CUDA | clangd |
| Python | pyright + ruff |
| TypeScript/JavaScript | ts_ls |
| Rust | rust-analyzer |
| Shell (bash/zsh) | bash-language-server + shellcheck |
| Markdown | marksman |
| LaTeX | texlab + vimtex |
| Verilog/SystemVerilog | svls |
| JSON/YAML/TOML | LazyVim extras で自動 |
| Tcl | Tree-sitter ハイライトのみ（成熟 LSP なし） |

### カラースキーム

自作テーマ **Monokai-Japan** を Zed/VSCode/Ghostty と統一して適用しています。
定義ファイル: `config/nvim/colors/monokai-japan.lua`

### Marp スライドを使う場合

```zsh
# Marp CLI をインストール
npm install -g @marp-team/marp-cli
```

Neovim 内での操作:
- `<Space>ms` — プレビュー開始（ブラウザが開き、ファイル変更を自動リロード）
- `<Space>mS` — プレビュー停止

### LaTeX プレビュー

vimtex + Skim で SyncTeX 連携しています。

- Neovim → Skim: `<Space>lv` でフォワードサーチ
- Skim → Neovim: PDF 上で `Cmd+Shift+Click` でインバースサーチ

Skim の設定（初回のみ）: Skim → 設定 → 同期 → プリセット「カスタム」→ コマンド `nvim`、引数 `--headless -c "VimtexInverseSearch %line '%file'"`

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
