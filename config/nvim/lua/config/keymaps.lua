-- カスタムキーマップ
-- .vimrc から移植 + LazyVim のデフォルトを活かす

local map = vim.keymap.set

-- .vimrcから移植: j/k で表示行単位の移動
map("n", "j", "gj", { desc = "表示行単位で下移動" })
map("n", "k", "gk", { desc = "表示行単位で上移動" })

-- .vimrcから移植: Esc×2 でハイライト解除
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "検索ハイライト解除" })

-- .vimrcから移植: Ctrl-n でファイルエクスプローラ切替（fern.vim → neo-tree）
map("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "ファイルエクスプローラ切替" })

-- .vimrcから移植: fr でカーソル位置の単語を検索（Telescope live_grep版）
map("n", "fr", function()
  require("telescope.builtin").grep_string()
end, { desc = "カーソル位置の単語を検索" })
map("x", "fr", function()
  require("telescope.builtin").grep_string()
end, { desc = "選択した単語を検索" })

-- .vimrcから移植: fb でバッファ検索
map("n", "fb", "<cmd>Telescope buffers<CR>", { desc = "バッファ検索" })

-- .vimrcから移植: fl で現在ファイルの行検索
map("n", "fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "ファイル内行検索" })

-- .vimrcから移植: fh でファイル履歴検索
map("n", "fh", "<cmd>Telescope oldfiles<CR>", { desc = "ファイル履歴検索" })

-- .vimrcから移植: fc でコミット履歴検索
map("n", "fc", "<cmd>Telescope git_commits<CR>", { desc = "コミット履歴検索" })

-- .vimrcから移植: fm でマーク検索
map("n", "fm", "<cmd>Telescope marks<CR>", { desc = "マーク検索" })

-- LazyVim デフォルトで対応済みのキーマップ（参考）:
-- <leader>ff = ファイル検索（git優先）
-- <leader>fg / <leader>/ = 文字列検索（ripgrep）
-- <leader>fb = バッファ検索
-- ]h / [h = git hunk 移動
-- <leader>e = neo-tree toggle
