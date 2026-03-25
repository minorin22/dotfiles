-- LSP 設定
-- mason（LSPサーバー自動インストール）+ 言語サーバー個別設定

return {
  -- mason: LSPサーバー自動インストール
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- C/C++/CUDA → clangd は LazyVim extras.lang.clangd で自動
        -- Python → pyright + ruff は LazyVim extras.lang.python で自動
        -- TypeScript → ts_ls は LazyVim extras.lang.typescript で自動
        -- Rust → rust-analyzer は LazyVim extras.lang.rust で自動

        -- Shell
        "bash-language-server",
        "shellcheck",
        "shfmt",

        -- Markdown（markdownlintは日本語で誤検知が多いため除外）
        "marksman",

        -- LaTeX
        "texlab",

        -- Verilog
        "svls",

        -- フォーマッター
        "prettier",
        "stylua",
      },
    },
  },

  -- clangd: CUDA filetype追加
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        },
        -- Tcl: 成熟したLSPが存在しないため、Tree-sitterのみで対応
      },
    },
  },
}
