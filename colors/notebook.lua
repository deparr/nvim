vim.o.bg = "light"

vim.cmd "hi clear"

vim.g.colors_name = "notebook"
local c = {
  base1 = "#595855",
  base2 = "#807E79",
  base3 = "#999791",
  base4 = "#B3B1AD",
  base5 = "#CCCBC6",
  base6 = "#E6E4DF",
  base7 = "#FAF2EB",

  light_orange = "#FAE1C8",
  light_yellow = "#f9eab3",
  light_cyan = "#C8FAFA",
  light_green = "#d4fad4",
  light_blue = "#D4D4FA",
  light_purple = "#EDD4FA",
  light_pink = "#FAD4ED",
  light_red = "#fad4d4",

  deep_red = "#A60000",

  bright_blue = "#005fd7", -- nice, high contrast

  rep_blue = "#365987",
  rep_green = "#3fa66f",

  fg = "#1a1919",
  fg_light = "#484848",
  fg_light2 = "#cccbc6",
  bg = "#faf4ef",
  bg_dark = "#e6e4df",

  red = "#990000",
  blue = "#0000A6",
  green = "#008000",
  cyan = "#00a6a6",
  orange = "#F27900",
  purple = "#6F00A6",
  pink = "#A6006F",
  dark_yellow = "#b37f02",
  orange_red = "#9f4c05",
  -- dark_yellow = "#6f4c05",

  todo = "#ff9920",

  diff_change = "#ececec",
  none = "NONE",
}

-- c = setmetatable(c, {
--   __index = function(_, k)
--     vim.print("nil color: " .. k)
--     return nil
--   end,
-- })

local hl = function(group, opts)
  opts = type(opts) == "string" and { link = opts } or opts
  vim.api.nvim_set_hl(0, group, opts or {})
end

-- == Neovim ==

hl("ColorColumn", { bg = c.bg_dark })
hl("Conceal", { fg = c.green })
hl("CurSearch", { fg = c.fg, bg = c.light_purple })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = c.bg_dark })
hl("CursorIM", { fg = c.bg, bg = c.fg })
hl("CursorLine", { bg = c.bg_dark })
hl("CursorLineFold", "FoldColumn")
hl("CursorLineNr", { fg = c.fg, bg = c.bg_dark, bold = true })
hl("CursorLineSign", { bg = c.bg_dark, bold = true })
hl("DiffAdd", { bg = c.light_green })
hl("DiffChange", { bg = c.diff_change })
hl("DiffDelete", { fg = c.red, bg = c.light_red })
hl("DiffText", { bg = c.light_yellow })
hl("DiffTextAdd", { bg = c.light_orange })
hl("Directory", { fg = c.bright_blue, bold = true })
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
hl("ErrorMsg", { fg = c.red, bold = true })
hl("FloatBorder", { fg = c.fg_light })
hl("FloatFooter", "FloatTitle")
hl("FloatTitle", { fg = c.fg, bold = true })
hl("FoldColumn", { fg = c.fg_light })
hl("Folded", { fg = c.fg_light, bg = c.bg_dark })
hl("IncSearch", { fg = c.fg, bg = c.light_purple })
hl("LineNr", { fg = c.base2 })
hl("LineNrAbove", "LineNr")
hl("LineNrBelow", "LineNr")
hl("MatchParen", { bg = c.light_yellow, bold = true })
hl("ModeMsg", { fg = c.fg, bold = true })
hl("MoreMsg", { fg = c.fg, bold = true })
hl("MsgArea", { fg = c.fg })
hl("MsgSeparator", "StatusLine")
hl("NonText", { fg = c.fg_light })
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", {})
hl("NormalNC", {})
hl("OkMsg", { fg = c.green })
hl("Pmenu", { fg = c.fg, bg = c.diff_change })
hl("PmenuExtra", "Pmenu")
hl("PmenuExtraSel", "PmenuSel")
hl("PmenuKind", "Pmenu")
hl("PmenuKindSel", "PmenuSel")
hl("PmenuMatch", { fg = c.bright_blue, bold = true })
hl("PmenuMatchSel", { bold = true })
hl("PmenuSbar", { fg = c.none, bg = c.bg_dark })
hl("PmenuSel", { bg = c.bg_dark, bold = true })
hl("PmenuThumb", { fg = c.fg, bg = c.bg_dark })
hl("Question", { fg = c.fg, bold = true })
hl("QuickFixLine", { bg = c.bg_dark })
hl("Search", { fg = c.fg, bg = c.light_yellow })
hl("SignColumn", { fg = c.fg_light })
hl("SnippetTabstop", "Visual")
hl("SpecialKey", { fg = c.green })
hl("SpellBad", { sp = c.red, undercurl = true })
hl("SpellCap", { sp = c.orange, undercurl = true })
hl("SpellLocal", { sp = c.bright_blue, undercurl = true })
hl("SpellRare", { sp = c.cyan, undercurl = true })
hl("StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hl("StatusLineNC", { fg = c.fg, bg = c.bg })
hl("StatusLineTerm", { fg = c.fg_light, bg = c.bg_dark })
hl("StatusLineTermNC", { fg = c.fg, bg = c.bg })
hl("StderrMsg", { fg = c.red })
hl("StdoutMsg", { fg = c.fg })
hl("Substitute", "CurSearch")
hl("TabLine", { fg = c.fg, bg = c.bg_dark })
hl("TabLineFill", { bg = c.bg_dark })
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("TermCursor", "Cursor")
hl("TermCursorNC", {})
hl("Title", { fg = c.fg, bold = true })
hl("Visual", { bg = c.fg_light2 })
hl("VisualNOS", "Visual")
hl("WarningMsg", { fg = c.dark_yellow })
hl("Whitespace", { fg = c.fg_light })
hl("WildMenu", "CurSearch")
hl("WinBar", "StatusLine")
hl("WinBarNC", "StatusLineNC")
hl("WinSeparator", { fg = c.fg_light })
hl("lCursor", { fg = c.bg, bg = c.fg })

-- == Neovim Syntax ==
hl("Added", { fg = c.green })
hl("Bold", { bold = true })
hl("Boolean", { fg = c.fg }) -- todo not sure if i like highlighted booleans
hl("Changed", { fg = c.cyan })
hl("Character", "String")
hl("Comment", { fg = c.green })
hl("Conditional", { fg = c.fg })
hl("Constant", { fg = c.fg })
hl("Debug", { fg = c.purple, bold = true })
hl("Define", { fg = c.fg })
hl("Delimiter", { fg = c.fg_light })
hl("Error", { fg = c.red })
hl("Exception", { fg = c.red })
hl("Float", { fg = c.bright_blue })
hl("Function", { fg = c.blue, bold = true })
hl("Identifier", { fg = c.fg })
hl("Ignore", { fg = c.fg_light })
hl("Include", { fg = c.fg, bold = true })
hl("Italic", { italic = true })
hl("Keyword", { fg = c.fg })
hl("Label", { fg = c.purple })
hl("Macro", { fg = c.fg }) -- todo Also used for fugitive unstaged
hl("Number", { fg = c.bright_blue })
hl("Operator", { fg = c.fg })
hl("PreCondit", { fg = c.orange })
hl("PreProc", { fg = c.fg })
hl("Removed", { fg = c.red })
hl("Repeat", { fg = c.fg, bold = true })
hl("Special", { fg = c.bright_blue })
hl("SpecialChar", { fg = c.bright_blue })
hl("SpecialComment", { fg = c.orange_red })
hl("Statement", { fg = c.fg, bold = true })
hl("StorageClass", { fg = c.fg, bold = true })
hl("String", { fg = c.green })
hl("Structure", { fg = c.fg }) -- never know what to use this for
hl("Tag", { fg = c.bright_blue })
hl("Todo", { bg = c.light_blue, bold = true })
hl("Type", { fg = c.pink, bold = false })
hl("Typedef", { fg = c.fg })
hl("Underlined", { underline = true })

hl("LspCodeLens", { fg = c.fg_light2 })
hl("LspCodeLensSeparator", { fg = c.fg_light })
hl("LspInfoBorder", { fg = c.fg_light, bg = c.bg })
hl("LspInlayHint", "NonText")
hl("LspReferenceRead", { bg = c.bg_dark })
hl("LspReferenceTarget", { bg = c.bg_dark })
hl("LspReferenceText", { bg = c.bg_dark })
hl("LspReferenceWrite", { bg = c.bg_dark })
hl("LspSignatureActiveParameter", { underline = true, bold = true })
hl("DiagnosticOk", { fg = c.green, bold = true }) -- todo not sure about diag colors
hl("DiagnosticHint", { fg = c.fg_light, bold = true })
hl("DiagnosticInfo", { fg = c.blue, bold = true })
hl("DiagnosticWarn", { fg = c.dark_yellow, bold = true })
hl("DiagnosticError", { fg = c.red, bold = true })
hl("DiagnosticUnderlineOk", { sp = c.green, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.bright_blue, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.cyan, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.dark_yellow, undercurl = true })
hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hl("DiagnosticVirualTextOk", { fg = c.green })
hl("DiagnosticVirualTextHint", { fg = c.bright_blue })
hl("DiagnosticVirualTextInfo", { fg = c.bright_blue })
hl("DiagnosticVirualTextWarn", { fg = c.dark_yellow })
hl("DiagnosticVirualTextError", { fg = c.red })

hl("diffAdded", "Added")
hl("diffRemoved", "Removed")
hl("diffChanged", "Changed")
hl("diffFile", { fg = c.fg })
hl("diffLine", { fg = c.fg })

-- == Treesitter == :h treesitter-highlight-groups
hl("@variable", { fg = c.fg })
hl("@variable.builtin", {})
hl("@variable.parameter", {})
hl("@variable.parameter.builtin", {})
hl("@variable.member", {})
hl("@constant", "Constant")
hl("@constant.builtin", { fg = c.fg, bold = true })
hl("@constant.macro", { fg = c.fg })
hl("@module", {})
hl("@module.builtin", { fg = c.fg })
hl("@label", "Label")
hl("@string", "String")
hl("@string.documentation", "@comment.documentation")
hl("@string.regexp", { fg = c.orange })
hl("@string.escape", { fg = c.blue })
hl("@string.special", { fg = c.fg })
hl("@string.special.symbol", { fg = c.cyan })
hl("@string.special.path", { fg = c.fg })
hl("@string.special.url", "Underlined")
hl("@character", "Character")
hl("@character.special", {})
hl("@boolean", "Boolean")
hl("@number", "Number")
hl("@number.float", "Float")
hl("@type", "Type")
hl("@type.builtin", { fg = c.pink })
hl "@type.definition"
hl("@attribute", { fg = c.rep_blue, bold = true })
hl("@attribute.builtin", { bg = c.todo })
hl "@property"
hl("@function", "Function")
hl "@function.builtin"
hl "@function.call"
hl("@function.macro", { fg = c.purple }) -- todo not sure
hl("@function.method", "Function")
hl "@function.method.call"
hl("@constructor", { fg = c.bright_blue, bold = true })
hl("@operator", "Operator")
hl("@keyword", "Keyword")
-- .coroutine .function .operator
-- .import .type .modifier
-- .repeat .return .debug
-- .exception .conditional .conditional.ternary
-- .directive .directive.define
hl("@punctuation", { fg = c.fg_light })
-- .delimiter .bracket
hl("@punctuation.special", { fg = c.fg })
hl("@comment", "Comment")
hl("@comment.documentation", { fg = c.orange_red })
hl("@comment.error", "DiagnosticError")
hl("@comment.warning", "DiagnosticWarn")
hl("@comment.todo", "Todo")
hl("@comment.note", "DiagnosticInfo")
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@markup.heading", "Title")
hl("@markup.quote", { fg = c.fg })
hl("@markup.math", { fg = c.bright_blue })
hl("@markup.link", { fg = c.fg })
hl("@markup.link.label", { fg = c.fg })
hl("@markup.link.url", { fg = c.fg })
hl("@markup.raw", { fg = c.bright_blue }) -- todo
hl("@markup.raw.block", { fg = c.fg })
hl("@markup.list", { fg = c.bright_blue })
hl("@markup.list.checked", { fg = c.fg })
hl("@markup.list.unchecked", { fg = c.fg })
hl("@diff.plus", "Added")
hl("@diff.minus", "Removed")
hl("@diff.delta", "Changed")
hl("@tag", { fg = c.blue })
hl("@tag.builtin", { fg = c.blue })
hl("@tag.attribute", { fg = c.fg })
hl("@tag.delimiter", { fg = c.fg })

hl "@constructor.lua"
hl("@keyword.import.zig", "@function.builtin")
-- hl("@lsp.type.lifetime.rust", "@attribute") -- todo
hl("@label.vimdoc", { fg = c.fg, bold = true })
hl("@markup.link.vimdoc", { fg = c.bright_blue, bold = true })

-- todo Good fugitive colors ?

hl("BlinkCmpGhostText", "Comment")

hl("LazyCommit", { fg = c.fg_light }) -- todo lazy colors
hl("LazyLocal", { fg = c.red })
hl("LazySpecial", { fg = c.bright_blue })

hl("TelescopeMatching", { bg = c.light_orange })
hl("TelescopeMultiIcon", { fg = c.fg, bold = true })
hl("TelescopeMultiSelection", { fg = c.fg })
hl("TelescopePromptPrefix", { fg = c.fg, bold = true })
hl("TelescopeSelectionCaret", { fg = c.fg, bg = c.fg_light2, bold = true })
hl("TelescopeTitle", { fg = c.red, bold = true }) -- todo
