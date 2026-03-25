-- コーディング補助設定
-- nvim-cmp 追加ソース

return {
  -- vimtex の補完ソースを追加
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "omni" })
    end,
  },
}
