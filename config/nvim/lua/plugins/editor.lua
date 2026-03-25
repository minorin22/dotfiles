-- エディタプラグイン設定
-- neo-tree（ファイルエクスプローラ）、telescope（ファジーファインダー）

return {
  -- neo-tree: .vimrc の fern.vim を置き換え
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- 隠しファイルを薄く表示
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        width = 28, -- .vimrc の fern -width=28 と同じ
        position = "left",
      },
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
    },
  },

  -- telescope: .vimrc の fzf.vim を置き換え
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { preview_width = 0.5 },
        },
      },
    },
  },
}
