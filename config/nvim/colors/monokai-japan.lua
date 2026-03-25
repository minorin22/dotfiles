-- Monokai Japan カラースキーム for Neovim
-- 作者: minorin
-- ソース: config/zed/themes/monokai-japan.json + config/ghostty/config

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "monokai-japan"

-- カラーパレット定義
local c = {
  -- UI基本色（Zedテーマから）
  bg = "#272727",
  surface = "#202020",
  elevated = "#414141",
  border = "#414141",
  border_var = "#363636",
  active_line = "#3f3f3f",

  -- テキスト
  fg = "#fbfbf8",
  fg_muted = "#cccccc",
  fg_disabled = "#6b6b6b",
  line_nr = "#90908a",
  line_nr_act = "#c2c2bf",
  invisible = "#474747",

  -- アクセント
  accent = "#fb966e",

  -- シンタックス（Zed syntax定義から）
  comment = "#88846f",
  string = "#eebf35",
  string_esc = "#dba2b4",
  keyword = "#dba2b4",
  func = "#7bb75b",
  func_builtin = "#87c7d4",
  variable = "#fbfbf8",
  var_builtin = "#fb966e",
  var_param = "#fb966e",
  type = "#7bb75b",
  type_builtin = "#87c7d4",
  constant = "#b595cf",
  number = "#b595cf",
  boolean = "#b595cf",
  tag = "#dba2b4",
  punctuation = "#fbfbf8",
  operator = "#dba2b4",

  -- セマンティック（Zed status色から）
  error = "#da5673",
  warning = "#eebf35",
  info = "#5cabdc",
  hint = "#5cabdc",
  added = "#7bb75b",
  modified = "#eebf35",
  deleted = "#da5673",

  -- セレクション（Ghosttyから）
  selection = "#49483e",

  -- ターミナルANSI（Ghosttyから）
  ansi_black = "#272822",
  ansi_red = "#f92672",
  ansi_green = "#a6e22e",
  ansi_yellow = "#f4bf75",
  ansi_blue = "#66d9ef",
  ansi_magenta = "#ae81ff",
  ansi_cyan = "#a1efe4",
  ansi_white = "#f8f8f2",
  ansi_bright_black = "#75715e",
  ansi_bright_white = "#f9f8f5",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ========== エディタUI ==========
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.surface })
hl("FloatBorder", { fg = c.border, bg = c.surface })
hl("FloatTitle", { fg = c.accent, bg = c.surface, bold = true })
hl("CursorLine", { bg = c.active_line })
hl("CursorColumn", { bg = c.active_line })
hl("CursorLineNr", { fg = c.line_nr_act, bold = true })
hl("LineNr", { fg = c.line_nr })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.active_line })
hl("Visual", { bg = c.selection })
hl("VisualNOS", { bg = c.selection })
hl("Pmenu", { fg = c.fg, bg = c.surface })
hl("PmenuSel", { fg = c.fg, bg = c.elevated })
hl("PmenuSbar", { bg = c.elevated })
hl("PmenuThumb", { bg = c.fg_disabled })
hl("WinSeparator", { fg = c.border })
hl("VertSplit", { fg = c.border })
hl("StatusLine", { fg = c.fg, bg = c.elevated })
hl("StatusLineNC", { fg = c.fg_muted, bg = c.border_var })
hl("TabLine", { fg = c.fg_muted, bg = c.border_var })
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("TabLineFill", { bg = c.surface })
hl("WildMenu", { fg = c.bg, bg = c.accent })
hl("Search", { fg = c.bg, bg = c.string })
hl("IncSearch", { fg = c.bg, bg = c.accent })
hl("CurSearch", { fg = c.bg, bg = c.accent })
hl("Substitute", { fg = c.bg, bg = c.accent })
hl("Folded", { fg = c.comment, bg = c.border_var })
hl("FoldColumn", { fg = c.fg_disabled, bg = c.bg })
hl("MatchParen", { fg = c.accent, bold = true, underline = true })
hl("NonText", { fg = c.invisible })
hl("SpecialKey", { fg = c.invisible })
hl("Whitespace", { fg = c.invisible })
hl("Directory", { fg = c.func })
hl("Title", { fg = c.func, bold = true })
hl("ErrorMsg", { fg = c.error, bold = true })
hl("WarningMsg", { fg = c.warning })
hl("ModeMsg", { fg = c.fg, bold = true })
hl("MoreMsg", { fg = c.func })
hl("Question", { fg = c.func })
hl("Conceal", { fg = c.fg_disabled })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("lCursor", { fg = c.bg, bg = c.fg })
hl("CursorIM", { fg = c.bg, bg = c.fg })
hl("SpellBad", { undercurl = true, sp = c.error })
hl("SpellCap", { undercurl = true, sp = c.warning })
hl("SpellLocal", { undercurl = true, sp = c.info })
hl("SpellRare", { undercurl = true, sp = c.hint })

-- ========== シンタックスハイライト ==========
hl("Comment", { fg = c.comment, italic = true })
hl("String", { fg = c.string })
hl("Character", { fg = c.string })
hl("Number", { fg = c.number })
hl("Float", { fg = c.number })
hl("Boolean", { fg = c.boolean })
hl("Constant", { fg = c.constant })
hl("Identifier", { fg = c.variable })
hl("Function", { fg = c.func })
hl("Statement", { fg = c.keyword })
hl("Keyword", { fg = c.keyword })
hl("Conditional", { fg = c.keyword })
hl("Repeat", { fg = c.keyword })
hl("Label", { fg = c.func })
hl("Operator", { fg = c.operator })
hl("Exception", { fg = c.keyword })
hl("PreProc", { fg = c.keyword })
hl("Include", { fg = c.keyword })
hl("Define", { fg = c.keyword })
hl("Macro", { fg = c.keyword })
hl("Type", { fg = c.type })
hl("StorageClass", { fg = c.keyword })
hl("Structure", { fg = c.type })
hl("Typedef", { fg = c.type })
hl("Special", { fg = c.string_esc })
hl("SpecialChar", { fg = c.string_esc })
hl("Tag", { fg = c.tag })
hl("Delimiter", { fg = c.punctuation })
hl("Debug", { fg = c.error })
hl("Underlined", { fg = c.info, underline = true })
hl("Error", { fg = c.error })
hl("Todo", { fg = c.accent, bold = true })

-- ========== Tree-sitter ハイライト ==========
hl("@comment", { link = "Comment" })
hl("@string", { fg = c.string })
hl("@string.escape", { fg = c.string_esc })
hl("@string.regex", { fg = c.string_esc })
hl("@string.special", { fg = c.string_esc })
hl("@character", { fg = c.string })
hl("@number", { fg = c.number })
hl("@number.float", { fg = c.number })
hl("@boolean", { fg = c.boolean })
hl("@constant", { fg = c.constant })
hl("@constant.builtin", { fg = c.constant })
hl("@variable", { fg = c.variable })
hl("@variable.builtin", { fg = c.var_builtin })
hl("@variable.parameter", { fg = c.var_param, italic = true })
hl("@variable.member", { fg = c.fg })
hl("@function", { fg = c.func })
hl("@function.builtin", { fg = c.func_builtin })
hl("@function.call", { fg = c.func })
hl("@function.method", { fg = c.func })
hl("@function.method.call", { fg = c.func })
hl("@keyword", { fg = c.keyword })
hl("@keyword.operator", { fg = c.keyword })
hl("@keyword.return", { fg = c.keyword })
hl("@keyword.function", { fg = c.keyword })
hl("@keyword.import", { fg = c.keyword })
hl("@keyword.conditional", { fg = c.keyword })
hl("@keyword.repeat", { fg = c.keyword })
hl("@keyword.exception", { fg = c.keyword })
hl("@operator", { fg = c.operator })
hl("@type", { fg = c.type })
hl("@type.builtin", { fg = c.type_builtin, italic = true })
hl("@type.definition", { fg = c.type })
hl("@constructor", { fg = c.func })
hl("@property", { fg = c.fg })
hl("@punctuation", { fg = c.punctuation })
hl("@punctuation.bracket", { fg = c.punctuation })
hl("@punctuation.delimiter", { fg = c.punctuation })
hl("@punctuation.special", { fg = c.punctuation })
hl("@tag", { fg = c.tag })
hl("@tag.attribute", { fg = c.func })
hl("@tag.delimiter", { fg = c.punctuation })
hl("@namespace", { fg = c.func })
hl("@module", { fg = c.func })
hl("@attribute", { fg = c.func })
hl("@label", { fg = c.func })
hl("@text.literal", { fg = c.accent })
hl("@markup.heading", { fg = c.func, bold = true })
hl("@markup.list", { fg = c.string })
hl("@markup.strong", { fg = c.func_builtin, bold = true })
hl("@markup.emphasis", { fg = c.func_builtin, italic = true })
hl("@markup.italic", { fg = c.func_builtin, italic = true })
hl("@markup.link", { fg = c.string })
hl("@markup.link.url", { fg = c.info, underline = true })
hl("@markup.quote", { fg = c.fg_disabled, italic = true })
hl("@markup.raw", { fg = c.accent })
hl("@markup.math", { fg = c.number })
hl("@diff.plus", { fg = c.added })
hl("@diff.minus", { fg = c.deleted })
hl("@diff.delta", { fg = c.modified })

-- ========== LSP セマンティックトークン ==========
hl("@lsp.type.class", { fg = c.type })
hl("@lsp.type.decorator", { fg = c.func })
hl("@lsp.type.enum", { fg = c.type })
hl("@lsp.type.enumMember", { fg = c.constant })
hl("@lsp.type.function", { fg = c.func })
hl("@lsp.type.interface", { fg = c.type })
hl("@lsp.type.macro", { fg = c.keyword })
hl("@lsp.type.method", { fg = c.func })
hl("@lsp.type.namespace", { fg = c.func })
hl("@lsp.type.parameter", { fg = c.var_param, italic = true })
hl("@lsp.type.property", { fg = c.fg })
hl("@lsp.type.struct", { fg = c.type })
hl("@lsp.type.type", { fg = c.type })
hl("@lsp.type.typeParameter", { fg = c.type })
hl("@lsp.type.variable", { fg = c.variable })
hl("@lsp.mod.defaultLibrary", { fg = c.func_builtin })

-- ========== Diagnostics ==========
hl("DiagnosticError", { fg = c.error })
hl("DiagnosticWarn", { fg = c.warning })
hl("DiagnosticInfo", { fg = c.info })
hl("DiagnosticHint", { fg = c.hint })
hl("DiagnosticOk", { fg = c.added })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.warning })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.info })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.hint })
-- アルファ20(12.5%)を bg #272727 にブレンドした近似色
hl("DiagnosticVirtualTextError", { fg = c.error, bg = "#2f2a2c" })
hl("DiagnosticVirtualTextWarn", { fg = c.warning, bg = "#302d29" })
hl("DiagnosticVirtualTextInfo", { fg = c.info, bg = "#2b2d30" })
hl("DiagnosticVirtualTextHint", { fg = c.hint, bg = "#2b2d30" })

-- ========== Git Signs ==========
hl("GitSignsAdd", { fg = c.added })
hl("GitSignsChange", { fg = c.modified })
hl("GitSignsDelete", { fg = c.deleted })
-- アルファ20/40を bg #272727 にブレンドした近似色
hl("DiffAdd", { bg = "#2e3529" })
hl("DiffChange", { bg = "#302d29" })
hl("DiffDelete", { bg = "#2f2a2c" })
hl("DiffText", { bg = "#3a332b" })

-- ========== Neo-tree（ファイルエクスプローラ） ==========
hl("NeoTreeNormal", { fg = c.fg, bg = c.surface })
hl("NeoTreeNormalNC", { fg = c.fg, bg = c.surface })
hl("NeoTreeRootName", { fg = c.accent, bold = true })
hl("NeoTreeDirectoryName", { fg = c.fg })
hl("NeoTreeDirectoryIcon", { fg = c.info })
hl("NeoTreeFileName", { fg = c.fg })
hl("NeoTreeFileIcon", { fg = c.fg_muted })
hl("NeoTreeGitAdded", { fg = c.added })
hl("NeoTreeGitModified", { fg = c.modified })
hl("NeoTreeGitDeleted", { fg = c.deleted })
hl("NeoTreeGitConflict", { fg = c.warning })
hl("NeoTreeIndentMarker", { fg = c.border })
hl("NeoTreeWinSeparator", { fg = c.border, bg = c.surface })
hl("NeoTreeEndOfBuffer", { fg = c.surface, bg = c.surface })

-- ========== Telescope ==========
hl("TelescopeNormal", { fg = c.fg, bg = c.surface })
hl("TelescopeBorder", { fg = c.border, bg = c.surface })
hl("TelescopeTitle", { fg = c.accent, bold = true })
hl("TelescopePromptNormal", { fg = c.fg, bg = c.elevated })
hl("TelescopePromptBorder", { fg = c.elevated, bg = c.elevated })
hl("TelescopePromptTitle", { fg = c.bg, bg = c.accent })
hl("TelescopePreviewTitle", { fg = c.bg, bg = c.func })
hl("TelescopeResultsTitle", { fg = c.bg, bg = c.info })
hl("TelescopeSelection", { bg = c.active_line })
hl("TelescopeMatching", { fg = c.accent, bold = true })

-- ========== Which-key ==========
hl("WhichKey", { fg = c.accent })
hl("WhichKeyGroup", { fg = c.info })
hl("WhichKeyDesc", { fg = c.fg_muted })
hl("WhichKeySeparator", { fg = c.fg_disabled })
hl("WhichKeyFloat", { bg = c.surface })
hl("WhichKeyValue", { fg = c.fg_disabled })

-- ========== indent-blankline ==========
hl("IblIndent", { fg = c.border_var })
hl("IblScope", { fg = c.fg_disabled })

-- ========== Noice / Notify ==========
hl("NoiceCmdlinePopup", { fg = c.fg, bg = c.surface })
hl("NoiceCmdlinePopupBorder", { fg = c.border })
hl("NoiceCmdlineIcon", { fg = c.accent })
hl("NotifyERRORBorder", { fg = c.error })
hl("NotifyWARNBorder", { fg = c.warning })
hl("NotifyINFOBorder", { fg = c.info })
hl("NotifyDEBUGBorder", { fg = c.fg_disabled })
hl("NotifyTRACEBorder", { fg = c.constant })
hl("NotifyERRORIcon", { fg = c.error })
hl("NotifyWARNIcon", { fg = c.warning })
hl("NotifyINFOIcon", { fg = c.info })
hl("NotifyDEBUGIcon", { fg = c.fg_disabled })
hl("NotifyTRACEIcon", { fg = c.constant })
hl("NotifyERRORTitle", { fg = c.error })
hl("NotifyWARNTitle", { fg = c.warning })
hl("NotifyINFOTitle", { fg = c.info })
hl("NotifyDEBUGTitle", { fg = c.fg_disabled })
hl("NotifyTRACETitle", { fg = c.constant })

-- ========== Lazy.nvim ==========
hl("LazyH1", { fg = c.bg, bg = c.accent, bold = true })
hl("LazyButton", { fg = c.fg, bg = c.elevated })
hl("LazyButtonActive", { fg = c.bg, bg = c.func })
hl("LazySpecial", { fg = c.accent })

-- ========== Mason ==========
hl("MasonHeader", { fg = c.bg, bg = c.accent, bold = true })
hl("MasonHighlight", { fg = c.info })
hl("MasonHighlightBlock", { fg = c.bg, bg = c.info })
hl("MasonHighlightBlockBold", { fg = c.bg, bg = c.info, bold = true })
hl("MasonMuted", { fg = c.fg_disabled })
hl("MasonMutedBlock", { fg = c.bg, bg = c.fg_disabled })

-- ========== ターミナルANSIカラー ==========
vim.g.terminal_color_0 = c.ansi_black
vim.g.terminal_color_1 = c.ansi_red
vim.g.terminal_color_2 = c.ansi_green
vim.g.terminal_color_3 = c.ansi_yellow
vim.g.terminal_color_4 = c.ansi_blue
vim.g.terminal_color_5 = c.ansi_magenta
vim.g.terminal_color_6 = c.ansi_cyan
vim.g.terminal_color_7 = c.ansi_white
vim.g.terminal_color_8 = c.ansi_bright_black
vim.g.terminal_color_9 = c.ansi_red
vim.g.terminal_color_10 = c.ansi_green
vim.g.terminal_color_11 = c.ansi_yellow
vim.g.terminal_color_12 = c.ansi_blue
vim.g.terminal_color_13 = c.ansi_magenta
vim.g.terminal_color_14 = c.ansi_cyan
vim.g.terminal_color_15 = c.ansi_bright_white
