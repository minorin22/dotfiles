-- Neovim 基本設定
-- .vimrc からの移植 + Neovim 向け拡張

local opt = vim.opt

-- エンコーディング
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- バックアップ無効（.vimrcと同じ）
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- ファイル変更時に自動再読み込み（.vimrcと同じ）
opt.autoread = true

-- 見た目（.vimrcから移植）
opt.number = true
opt.relativenumber = true -- LazyVimデフォルト: 相対行番号
opt.virtualedit = "onemore"
opt.smartindent = true
opt.showmatch = true
opt.laststatus = 3 -- グローバルステータスライン
opt.termguicolors = true -- 24bitカラー（Monokai-Japan テーマに必須）
opt.cursorline = true

-- タブ設定（.vimrcと同じ: 2スペース）
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.list = true
opt.listchars = { tab = "▸-", trail = "·", nbsp = "␣" }

-- 検索（.vimrcと同じ）
opt.incsearch = true
opt.wrapscan = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- マウスサポート（要件: クリック、スクロール、カーソル移動）
opt.mouse = "a"
opt.mousemodel = "extend"

-- スクロール余白
opt.scrolloff = 8
opt.sidescrolloff = 8

-- フォント（Neovide等のGUI用）
opt.guifont = "HackGen35 Console NF:h15"

-- クリップボード（macOS pbcopy/pbpaste統合）
opt.clipboard = "unnamedplus"

-- 分割方向
opt.splitbelow = true
opt.splitright = true

-- アンドゥ永続化
opt.undofile = true
opt.undolevels = 10000
