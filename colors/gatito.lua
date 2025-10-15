vim.cmd "hi clear"
if vim.fn.exists "syntax_on" or vim.g.syntax_on then
  vim.cmd "syntax reset"
end

vim.o.termguicolors = true
vim.g.colors_name = "gatito"

local p = {
  -- fg = "#d4d4d4",
  fg = "#c4c4c4",
  bg = "#151515",
  -- bg = "#242b2e",
  black = "#252b2e",
  red = "#e15a60",
  green = "#99c794",
  yellow = "#fac863",
  blue = "#6699cc",
  purple = "#c594c5",
  cyan = "#5fb3b3",
  orange = "#f99157",
  zero = "#000000",

  comment = "#7f7f7f",
  blue_gray = "#3b3f4c",

  blueish_white = "#bfbfd0",
  sat_purple = "#bb80b3", -- attributes, changed
  desat_red = "#fe777a", -- other variable, string link
  slight_desat_red = "#eb606b", -- tag names

  ok = "#638f5e",
  info = "#6796e6",
  warn = "#cd9731",
  error = "#f44747",
}

local hl = function(g, o)
  vim.api.nvim_set_hl(0, g, o)
end

-- nvim core
hl("ColorColumn", { bg = p.black })
hl("Conceal", { fg = p.comment })
hl("CurSearch", { fg = p.bg, bg = p.orange })
hl("Cursor", {}) -- TODO
hl("lCursor", {}) -- TODO
hl("CursorIM", {}) -- TODO
hl("CursorColumn", { bg = p.black })
hl("CursorLine", { bg = p.black })
hl("Directory", { fg = p.blue })
hl("DiffAdd", { fg = p.green })
hl("DiffChange", { fg = p.yellow })
hl("DiffDelete", { fg = p.red })
hl("DiffText", { fg = p.comment })
hl("EndOfBuffer", { fg = p.bg })
hl("TermCursor", { fg = p.bg, bg = p.fg })
hl("TermCursorNC", {}) -- TODO
hl("ErrorMsg", { fg = p.desat_red })
hl("WinSeparator", { fg = p.comment })
hl("Folded", {}) -- TODO
hl("FoldColumn", {}) -- TODO
hl("SignColumn", {}) -- TODO
hl("IncSearch", { fg = p.bg, bg = p.yellow })
hl("Substitute", { fg = p.bg, bg = p.orange })
hl("LineNr", { fg = p.fg })
hl("LineNrAbove", {})
hl("LineNrBelow", {}) -- should link to linenr
hl("CursorLineNr", { fg = p.blueish_white, bold = true })
hl("CursorLineFold", {}) -- TODO
hl("CursorLineSign", {}) -- TODO
hl("MatchParen", { fg = p.orange })
hl("ModeMsg", {})
hl("MsgArea", {})
hl("MsgSeparator", { bg = p.black })
hl("MoreMsg", { fg = p.sat_purple })
hl("NonText", {})
hl("Normal", { fg = p.fg })
hl("NormalFloat", { fg = p.fg, bg = p.zero }) -- TODO zero bg
hl("FloatBorder", {})
hl("FloatTitle", {})
hl("FloatFooter", {})
hl("NormalNC", {})
hl("Pmenu", { fg = p.fg, bg = p.black })
hl("PmenuSel", { fg = p.blue, bg = p.black })
hl("PmenuKind", { link = "Pmenu" })
hl("PmenuKindSel", { link = "PmenuSel" })
hl("PmenuExtra", { link = "Pmenu" })
hl("PmenuExtraSel", { link = "PmenuSel" })
hl("PmenuSbar", {})
hl("PmenuThumb", { fg = p.blueish_white, bg = p.blueish_white })
hl("PmenuMatch", { link = "Pmenu" })
hl("PmenuMatchSel", { link = "PmenuSel" })
hl("Question", { fg = p.yellow })
hl("QuickFixLine", { fg = p.blue, underline = true })
hl("Search", { fg = p.bg, bg = p.yellow })
hl("SnippetTabstop", { bg = p.red }) -- TODO
hl("SpecialKey", { fg = p.black })
hl("SpellBad", { sp = p.slight_desat_red, undercurl = true })
hl("SpellCap", { sp = p.yellow, undercurl = true })
hl("SpellLocal", { sp = p.blue, undercurl = true })
hl("SpellRare", { sp = p.purple, undercurl = true })
hl("StatusLine", { fg = p.fg, bg = p.black })
hl("StatusLineNC", { fg = p.fg, bg = p.black })
hl("StatusLineTerm", { fg = p.fg, bg = p.black })
hl("StatusLineTermNC", { fg = p.fg, bg = p.black })
hl("TabLine", { fg = p.comment, bg = p.bg })
hl("TabLineFill", {}) -- TODO
hl("TabLineSel", { fg = p.bg, bg = p.comment })
hl("Title", { fg = p.fg, bold = true })
hl("Visual", { fg = p.fg, bg = p.blue_gray })
hl("VisualNOS", {})
hl("WarningMsg", { fg = p.yellow, bold = true })
hl("Whitespace", { fg = p.black })
hl("WildMenu", { fg = p.bg, bg = p.orange })
hl("WinBar", { fg = p.fg, bg = p.zero, bold = true })
hl("WinBarNC", { fg = p.fg, bg = p.zero, bold = false })
hl("DiagnosticOk", { fg = p.ok })
hl("DiagnosticHint", { fg = p.comment })
hl("DiagnosticInfo", { fg = p.info })
hl("DiagnosticWarn", { fg = p.warn })
hl("DiagnosticError", { fg = p.error })
hl("helpSectionDelim", { link = "Title" })

-- builtin syntax
hl("Comment", { fg = p.comment, italic = true })
hl("Constant", { fg = p.orange })
hl("String", { fg = p.green })
hl("Character", { fg = p.desat_red })
hl("Number", { fg = p.orange })
hl("Boolean", { fg = p.orange })
hl("Float", { fg = p.orange })
hl("Identifier", { fg = p.red })
hl("Function", { fg = p.blue })
hl("Statement", { fg = p.sat_purple })
hl("Conditional", { fg = p.slight_desat_red })
hl("Repeat", { fg = p.purple })
hl("Label", { fg = p.red })
hl("Operator", { fg = p.cyan }) -- TODO
hl("Keyword", { fg = p.purple })
hl("Exception", { fg = p.red })
hl("PreProc", { fg = p.purple })
hl("Include", { fg = p.sat_purple })
hl("Define", { fg = p.purple })
hl("Macro", { fg = p.orange })
hl("PreCondit", { fg = p.red })
hl("Type", { fg = p.yellow })
hl("StorageClass", { fg = p.red })
hl("Structure", { fg = p.yellow })
hl("Typedef", { fg = p.yellow })
hl("Special", { fg = p.red, bold = true })
hl("SpecialChar", { fg = p.desat_red })
hl("Tag", { fg = p.slight_desat_red })
hl("Delimiter", { fg = p.cyan })
hl("SpecialComment", { fg = p.comment, italic = true })
hl("Debug", { fg = p.warn })
hl("Underlined", { underline = true })
hl("Bold", { bold = true })
hl("Ignore", {})
hl("Error", { fg = p.red })
hl("Todo", { fg = p.yellow, bold = true })
hl("Added", { fg = p.green })
hl("Changed", { fg = p.cyan })
hl("Removed", { fg = p.desat_red })

-- treesitter
hl("@variable", { fg = p.fg })
hl("@constructor", { fg = p.yellow })
hl("@property", { fg = p.blueish_white })
hl("@function.builtin", { fg = p.red })
hl("@type.builtin", { fg = p.orange })
hl("@markup.raw", { fg = p.blue })
hl("@markup.raw.block", { fg = p.blueish_white })
hl("@markup.raw.delimiter", { fg = p.red })
hl("@markup.link.label", { fg = p.orange, underline = false })

-- lang specific

-- gdscript
hl("@type.builtin.gdscript", { fg = p.yellow })
hl("@string.special.url.gdscript", { fg = p.cyan })
hl("@attribute.gdscript", { fg = p.blue })
hl("@variable.parameter.gdscript", { fg = p.orange })

-- vimdoc
hl("@label.vimdoc", { fg = p.orange })
