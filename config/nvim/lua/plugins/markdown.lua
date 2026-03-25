-- Markdown プレビュー設定
-- markdown-preview.nvim（ブラウザプレビュー、Mermaid対応、スクロール同期）
-- Marp CLI 起動キーマップ

return {
  -- markdownlint を無効化（日本語で誤検知が多い）
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },

  -- render-markdown.nvim: ターミナル内インラインプレビュー
  -- LazyVim markdown extras に含まれるが、設定を上書き
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        enabled = true,
        icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      },
      code = {
        enabled = true,
        sign = false,
        width = "block",
      },
    },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", desc = "Markdownレンダリング切替" },
    },
  },

  -- markdown-preview.nvim: ブラウザベースのリアルタイムプレビュー
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npx --yes yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      -- デフォルトブラウザでプレビュー
      vim.g.mkdp_browser = ""
      -- スクロール同期・Mermaid対応
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {}, -- Mermaid ダイアグラム
        disable_sync_scroll = 0, -- スクロール同期有効
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
      }
      -- リアルタイムリフレッシュ
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_auto_close = 1

      -- Marp CLI によるスライドプレビュー（ライブリロード付き）
      vim.keymap.set("n", "<leader>ms", function()
        local file = vim.fn.expand("%:p")
        local marp = vim.fn.exepath("marp")
        if marp == "" then
          vim.notify("marp が見つかりません: npm i -g @marp-team/marp-cli", vim.log.levels.ERROR)
          return
        end
        -- nohup + stdio全リダイレクトでNeovimから完全に切り離す
        os.execute(string.format("nohup %s --watch --preview %s > /dev/null 2>&1 &", vim.fn.shellescape(marp), vim.fn.shellescape(file)))
        vim.notify("Marp プレビューを起動しました（--watch モード）", vim.log.levels.INFO)
      end, { desc = "Marpスライドプレビュー" })

      vim.keymap.set("n", "<leader>mS", function()
        os.execute("pkill -f 'marp --watch' 2>/dev/null")
        vim.notify("Marp プレビューを停止しました", vim.log.levels.INFO)
      end, { desc = "Marpプレビュー停止" })
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdownプレビュー切替" },
    },
  },
}
