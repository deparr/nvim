if vim.g.colors_name then
  vim.cmd "hi clear"
  vim.cmd "syntax reset"
end
vim.o.bg = "light"
vim.g.colors_name = "min"

local c = {
  bg = "#eeeeee",
  bg_float = "#ffffff",
  fg = "#080808",
  gray = "#5e5e5e",

  red = "#7f0000",
  blue = "#001080",
  cyan = "#007872",
  green = "#006000",
  orange = "#ffaf00",
  yellow = "#ffcf00",
  purple = "#5c21a5",
  bright_blue = "#1561b8",
  -- bright_blue = "#005fd7",

  diag_err = "#ae1515",
  diag_warn = "#b37f02",
  diag_ok = "#00a000",

  light_red = "#f2d3cd",
  light_green = "#d7e8b1",
  diff_add_text = "#ebf1dd",

  todo = "#fa50f0",
  doc_comment = "#a55000",
  comment = "#dedef0",

  terminal = {
    red = "#af0000",
    green = "#005f00",
    yellow = "#af5f00",
    blue = "#005faf",
    purple = "#870087",
    cyan = "#008787",
    black = "#080808",
    white = "#d7d7d7",

    bright_red = "#d70000",
    bright_green = "#008700",
    bright_yellow = "#d78700",
    bright_blue = "#0087d7",
    bright_purple = "#af00af",
    bright_cyan = "#00afaf",
    bright_black = "#626262",
    bright_white = "#d7d7d7",
  }
}

local hl = function(group, opts)
  opts = type(opts) == "string" and { link = opts } or opts
  vim.api.nvim_set_hl(0, group, opts or {})
end

-- == Editor ===
hl("Normal", { fg = c.fg, bg = c.bg })
hl("ColorColumn", { bg = c.bg_dark2 })
hl("Conceal", { fg = c.gray })
hl("CurSearch", { bg = c.orange })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = c.bg_float })
hl("CursorIM", { fg = c.bg, bg = c.fg })
hl("CursorLine", {})
hl("CursorLineFold", "FoldColumn")
hl("CursorLineNr", { fg = c.fg })
hl("CursorLineSign", { bold = true })
hl("DiffAdd", { bg = c.light_green })
hl("DiffChange", { bg = c.diff_add_text })
hl("DiffDelete", { fg = c.fg, bg = c.light_red })
hl("DiffText", { bg = c.light_green })
hl("DiffTextAdd", { bg = c.diff_add_text })
hl("Directory", { fg = c.bright_blue })
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
hl("ErrorMsg", { fg = c.bg, bg = c.fg })
hl("FloatBorder", { fg = c.fg, bg = c.bg_float })
hl("FloatFooter", "FloatTitle")
hl("FloatTitle", { fg = c.fg, bg = c.bg_float, bold = true })
hl("FoldColumn", { fg = c.gray })
hl("Folded", { fg = c.gray, bg = c.bg })
hl("IncSearch", { bg = c.yellow })
hl("LineNr", { fg = c.fg })
hl("LineNrAbove", "LineNr")
hl("LineNrBelow", "LineNr")
hl("MatchParen", { bg = c.orange }) -- todo
hl("ModeMsg", { fg = c.fg, bold = true })
hl("MoreMsg", { fg = c.fg, bold = true })
hl("MsgArea", { fg = c.fg })
hl("MsgSeparator", "StatusLine")
hl("NonText", { fg = c.gray })
hl("NormalFloat", { fg = c.fg, bg = c.bg_float })
hl("NormalNC", {})
hl("OkMsg", { fg = c.green })
hl("Pmenu", { fg = c.fg, bg = c.bg_float })
hl("PmenuExtra", "Pmenu")
hl("PmenuExtraSel", "PmenuSel")
hl("PmenuKind", "Pmenu")
hl("PmenuKindSel", "PmenuSel")
hl("PmenuMatch", { fg = c.bright_blue, bold = true })
hl("PmenuMatchSel", { bold = true })
hl("PmenuSbar", { fg = c.none, bg = c.bg_dark })
hl("PmenuSel", { bg = c.bg_dark2, bold = true })
hl("PmenuThumb", { fg = c.fg, bg = c.bg_dark })
hl("Question", { fg = c.fg, bold = true })
hl("QuickFixLine", { bg = c.bg_dark })
hl("Search", { fg = c.bg, bg = c.bright_blue })
hl("SignColumn", { fg = c.fg_light })
hl("SnippetTabstop", "Visual")
hl("SpecialKey", { fg = c.cyan })
hl("SpellBad", { sp = c.red, undercurl = true })
hl("SpellCap", { sp = c.green, undercurl = true })
hl("SpellLocal", { sp = c.bright_blue, undercurl = true })
hl("SpellRare", { sp = c.cyan, undercurl = true })
hl("StatusLine", { fg = c.bg, bg = c.fg, bold = true })
hl("StatusLineNC", { fg = c.bg, bg = c.fg })
hl("StatusLineTerm", { fg = c.bg, bg = c.fg })
hl("StatusLineTermNC", { fg = c.bg, bg = c.fg })
hl("StderrMsg", { fg = c.red })
hl("StdoutMsg", { fg = c.fg })
hl("Substitute", "CurSearch")
hl("TabLine", { fg = c.fg, bg = c.bg })
hl("TabLineFill", { bg = c.bg })
hl("TabLineSel", { fg = c.bg, bg = c.fg, bold = true })
hl("TermCursor", "Cursor")
hl("TermCursorNC", {})
hl("Title", { fg = c.fg, bold = true })
hl("Visual", { bg = c.orange })
hl("VisualNOS", "Visual")
hl("WarningMsg", { fg = c.diag_warn })
hl("Whitespace", { fg = c.gray })
hl("WildMenu", "CurSearch")
hl("WinBar", "StatusLine")
hl("WinBarNC", "StatusLineNC")
hl("WinSeparator", { fg = c.fg })
hl("lCursor", { fg = c.bg, bg = c.fg })

-- == Neovim Syntax ==
hl("Added", { fg = c.green })
hl("Bold", { bold = true })
hl("Boolean", { fg = c.cyan })
hl("Changed", { fg = c.cyan })
hl("Character", "String")
hl("Comment", { fg = c.fg, bg = c.comment, italic = true })
hl("Conditional", { fg = c.fg })
hl("Constant", { fg = c.fg, italic = true })
hl("Debug", { fg = c.red, bold = true })
hl("Define", { fg = c.fg })
hl("Delimiter", { fg = c.fg })
hl("Error", { fg = c.red })
hl("Exception", { fg = c.red })
hl("Float", { fg = c.cyan })
hl("Function", { fg = c.blue, bold = true })
hl("Identifier", { fg = c.fg })
hl("Ignore", { fg = c.gray })
hl("Include", { fg = c.fg, bold = true })
hl("Italic", { italic = true })
hl("Keyword", { fg = c.fg })
hl("Label", { fg = c.bright_blue })
hl("Macro", { fg = c.bright_blue })
hl("Number", { fg = c.cyan })
hl("Operator", { fg = c.fg })
hl("PreCondit", { fg = c.fg, bold = true })
hl("PreProc", { fg = c.fg, bold = true })
hl("Removed", { fg = c.red })
hl("Repeat", { fg = c.fg })
hl("Special", { fg = c.bright_blue })
hl("SpecialChar", { fg = c.bright_blue })
hl("SpecialComment", { bg = c.light_red }) -- todo
hl("Statement", { fg = c.fg })
hl("StorageClass", { fg = c.bright_blue }) -- todo
hl("String", { fg = c.green })
hl("Structure", { fg = c.blue })
hl("Tag", { fg = c.fg, bold = true })
hl("Todo", { bg = c.yellow, fg = c.fg, bold = true })
hl "Type"
hl("Typedef", { fg = c.cyan })
hl("Underlined", { underline = true })

hl("LspCodeLens", { fg = c.gray })
hl("LspCodeLensSeparator", { fg = c.gray })
hl("LspInfoBorder", { fg = c.fg, bg = c.bg })
hl("LspInlayHint", "NonText")
hl("LspReferenceRead", { bg = c.bg_float })
hl("LspReferenceTarget", { bg = c.bg_float })
hl("LspReferenceText", { bg = c.bg_float })
hl("LspReferenceWrite", { bg = c.bg_float })
hl("LspSignatureActiveParameter", { underline = true, bold = true })
hl("DiagnosticOk", { fg = c.diag_ok })
hl("DiagnosticHint", { fg = c.purple })
hl("DiagnosticInfo", { fg = c.gray })
hl("DiagnosticWarn", { fg = c.diag_warn })
hl("DiagnosticError", { fg = c.diag_err })
hl("DiagnosticUnderlineOk", { sp = c.diag_ok, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.purple, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.gray, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.diag_warn, undercurl = true })
hl("DiagnosticUnderlineError", { sp = c.diag_err, undercurl = true })
hl("DiagnosticVirualTextOk", { fg = c.diag_ok })
hl("DiagnosticVirualTextHint", { fg = c.purple })
hl("DiagnosticVirualTextInfo", { fg = c.gray })
hl("DiagnosticVirualTextWarn", { fg = c.diag_warn })
hl("DiagnosticVirualTextError", { fg = c.diag_err })

hl("diffAdded", "Added")
hl("diffRemoved", "Removed")
hl("diffChanged", "Changed")
hl("diffFile", { fg = c.fg })
hl("diffLine", { fg = c.fg })

-- == Treesitter ==
hl("@variable", { fg = c.fg })
hl("@variable.parameter", { italic = true })
hl("@comment.documentation", "SpecialComment")
hl("@keyword.directive", { fg = c.fg, bold = true })
hl("@keyword.import", { fg = c.fg, bold = true })
hl "@type.builtin"
hl("@function.call", { fg = c.fg })
hl("@function.method.call", { fg = c.fg })
hl("@markup.link.url", { underdotted = true })
hl("@markup.link", { fg = c.blue })
hl("@markup.raw", { fg = c.fg })

hl("@constructor.lua", { fg = c.fg })

-- == Lsp ==
hl "@lsp.type.method"
hl "@lsp.type.function"
hl("@lsp.type.parameter", { italic = true })

-- == Plugins ==
hl("LazyLocal", { fg = c.orange })
hl("TelescopeTitle", { fg = c.bg, bg = c.doc_comment })
hl("OilHidden", { fg = c.fg, italic = true })

if vim.g.dpar_min_theme_term_colors then
  vim.g.terminal_color_0 = c.terminal.black
  vim.g.terminal_color_1 = c.terminal.red
  vim.g.terminal_color_2 = c.terminal.green
  vim.g.terminal_color_3 = c.terminal.yellow
  vim.g.terminal_color_4 = c.terminal.blue
  vim.g.terminal_color_5 = c.terminal.purple
  vim.g.terminal_color_6 = c.terminal.cyan
  vim.g.terminal_color_7 = c.terminal.white
  vim.g.terminal_color_8 = c.terminal.bright_black
  vim.g.terminal_color_9 = c.terminal.bright_red
  vim.g.terminal_color_10 = c.terminal.bright_green
  vim.g.terminal_color_11 = c.terminal.bright_yellow
  vim.g.terminal_color_12 = c.terminal.bright_blue
  vim.g.terminal_color_13 = c.terminal.bright_purple
  vim.g.terminal_color_14 = c.terminal.bright_cyan
  vim.g.terminal_color_15 = c.terminal.bright_white
end
