-- UI プラグイン設定
-- bufferline（タブ）、lualine（ステータスライン）

return {
  -- bufferline: .vimrc の airline tabline を置き換え
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers", -- バッファモード（.vimrcと同じ挙動）
        always_show_bufferline = true,
        show_buffer_close_icons = false, -- .vimrc の show_close_button = 0
        show_close_icon = false,
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        indicator = { style = "underline" },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            padding = 1,
          },
        },
      },
    },
  },

  -- lualine: .vimrc の airline を置き換え（Monokai-Japan配色）
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = {
            a = { fg = "#272727", bg = "#7bb75b", gui = "bold" },
            b = { fg = "#fbfbf8", bg = "#414141" },
            c = { fg = "#cccccc", bg = "#363636" },
          },
          insert = {
            a = { fg = "#272727", bg = "#5cabdc", gui = "bold" },
          },
          visual = {
            a = { fg = "#272727", bg = "#b595cf", gui = "bold" },
          },
          replace = {
            a = { fg = "#272727", bg = "#da5673", gui = "bold" },
          },
          command = {
            a = { fg = "#272727", bg = "#eebf35", gui = "bold" },
          },
          inactive = {
            a = { fg = "#90908a", bg = "#363636" },
            b = { fg = "#90908a", bg = "#363636" },
            c = { fg = "#90908a", bg = "#272727" },
          },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      -- .vimrc の airline_section_c = '%t %M' / section_z = line:col に合わせる
      sections = {
        lualine_c = {
          { "filename", file_status = true, path = 0 }, -- ファイル名のみ + 変更マーク
        },
        lualine_z = {
          { "location", padding = { left = 1, right = 1 } },
        },
      },
    },
  },
}
