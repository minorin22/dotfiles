-- 自動コマンド
-- ファイルタイプ固有の設定

-- スペルチェック無効化（日本語の誤検知防止）
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- C/C++/CUDA: 4スペースインデント
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "cuda" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Python: 4スペースインデント
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Makefile: タブ文字を使う（.vimrcから移植）
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- CUDA ファイルタイプの認識
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.cu", "*.cuh" },
  callback = function()
    vim.bo.filetype = "cuda"
  end,
})

-- Verilog/SystemVerilog ファイルタイプの認識
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.sv", "*.svh" },
  callback = function()
    vim.bo.filetype = "systemverilog"
  end,
})
