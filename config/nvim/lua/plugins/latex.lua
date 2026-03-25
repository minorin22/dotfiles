-- LaTeX 設定
-- vimtex（LazyVim extras.lang.tex で基本設定済み）+ Skim連携

return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- 既存の .latexmkrc を活用
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- PDFビューア: Skim（SyncTeX対応）
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1 -- フォワードサーチ（Neovim → Skim）
      vim.g.vimtex_view_skim_activate = 1 -- Skimをアクティブにする

      -- 補完
      vim.g.vimtex_complete_enabled = 1

      -- Tree-sitterとの共存
      vim.g.vimtex_syntax_conceal_disable = 1
    end,
    keys = {
      { "<leader>ll", "<cmd>VimtexCompile<CR>", desc = "LaTeXコンパイル開始/停止" },
      { "<leader>lv", "<cmd>VimtexView<CR>", desc = "PDF表示" },
      { "<leader>lc", "<cmd>VimtexClean<CR>", desc = "LaTeX中間ファイル削除" },
    },
  },
}
