-- Tree-sitter 設定
-- シンタックスハイライト用パーサーの追加

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- 要件のプログラミング言語
        "c",
        "cpp",
        "cuda",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "bash",
        "verilog",
        "tcl",

        -- マークアップ・ドキュメント
        "markdown",
        "markdown_inline",
        "latex",
        "html",
        "css",

        -- 設定ファイル系
        "json",
        "jsonc",
        "yaml",
        "toml",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "regex",
        "diff",
        "gitcommit",
        "git_rebase",

        -- Rust（Brewfileにrustup有り）
        "rust",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
