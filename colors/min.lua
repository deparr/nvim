if vim.g.colors_name then
  vim.cmd "hi clear"
  vim.cmd "syntax reset"
end
vim.g.colors_name = "min"

-- light diff colors are unreadable in fugitive, should use backgrounds

local light = {
  bg = "#eeeeee",
  bg_float = "#ffffff",
  bg_column = "#d8d8d8",
  fg = "#080808",
  fg_dim = "#5e5e5e",
  fg_dim2 = "#6b6b6b",

  red = "#7f0000",
  blue = "#001080",
  cyan = "#007872",
  green = "#006000",
  orange = "#ffaf00",
  yellow = "#ffcf00",
  purple = "#5c21a5",
  bright_blue = "#1561b8",
  -- bright_blue = "#005fd7",
  light_red = "#f2d3cd",
  light_green = "#d7e8b1",
  diff_add_text = "#ebf1dd",

  diag_err = "#ae1515",
  diag_warn = "#b37f02",
  diag_ok = "#00a000",

  search = { cur = "#ffaf00", inc = "#ffcf00", hl = "#1561b8" },
  visual = "#ffaf00",
  match_paren = { bg = "#ffcf00" },
  status_line = { fg = "#eeeeee", bg = "#080808", bold = true },

  -- doc_comment = "#a55000",
  doc_comment = "#6f4305",
  comment = { fg = "#6f4305", italic = true },
  -- comment = { fg = "#080808", bg = "#e5e5f4", italic = true },
  -- comment = { fg = "#080808", bg = "#dedef0", italic = true },


  special = "#1561b8",
  number = "#007872",
  boolean = "#007872",
  string = "#006000",
  keyword = "#080808",
  structure = "#001080",
  operator = "#080808",
  func = { fg = "#001080", bold = true },
  preproc = { fg = "#080808", bold = true },
  type = { italic = true },

  terminal = {
    red = "#af0000",
    green = "#005f00",
    yellow = "#af5f00",
    blue = "#005faf",
    purple = "#870087",
    cyan = "#008787",
    black = "#080808",
    white = "#484848",

    bright_red = "#d70000",
    bright_green = "#008700",
    bright_yellow = "#d78700",
    bright_blue = "#0087d7",
    bright_purple = "#af00af",
    bright_cyan = "#00afaf",
    bright_black = "#323232",
    bright_white = "#323232",
  }
}

local dark = {
  bg = "#262626",
  bg_float = "#303030",
  bg_column = "#343434",
  fg = "#bcbcbc",
  fg_dim = "#949494",
  fg_dim2 = "#6b6b6b",

  red = "#c55555",
  blue = "#6a9fb5",
  cyan = "#75b5aa",
  green = "#90a959",
  orange = "#cc7f40",
  yellow = "#d7af5f",
  purple = "#aa759f",
  gray = "#a8a8a8",
  light_red = "#362b2b", -- these arent good
  light_green = "#333b23",
  diff_add_text = "#31393d",

  diag_err = "#d74a4c",
  diag_warn = "#cc7f40",
  diag_ok = "#90a959",

  search = { cur = "#cc7f40", inc = "#cc7f40", hl = "#d7af5f" },
  visual = "#323232", -- bespoke
  match_paren = { fg = "#ffaa51" }, -- bespoke
  status_line = { fg = "#a8a8a8", bg = "#343434" },

  doc_comment = "#a89984",
  comment = { fg = "#949494", italic = true },

  special = "#75b5aa",
  number = "#cc7f40",
  boolean = "#cc7f40",
  string = "#90a959",
  keyword = "#bcbcbc",
  structure = "#aa759f",
  operator = "#a8a8a8",
  func = { fg = "#6a9fbf" },
  preproc = { fg = "#c4956a" },
  type = { italic = true },

  terminal = {
  }
}

local c = vim.o.bg == "light" and light or dark

local hl = function(group, opts)
  -- if c == dark and type(opts) == "table" and #vim.tbl_keys(opts) == 0 then
  --   vim.notify(group .. " has no hl keys!!!")
  -- end
  opts = type(opts) == "string" and { link = opts } or opts
  vim.api.nvim_set_hl(0, group, opts or {})
end

-- == Editor ===
hl("Normal", { fg = c.fg, bg = c.bg })
hl("ColorColumn", { bg = c.bg_column })
hl("Conceal", { fg = c.fg_dim })
hl("CurSearch", { bg = c.search.inc })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = c.bg_column })
hl("CursorIM", { fg = c.bg, bg = c.fg })
hl("CursorLine", { bg = c.bg_column })
hl("CursorLineFold", "FoldColumn")
hl("CursorLineNr", { fg = c.fg, bg = c.bg_column, bold = true })
hl("CursorLineSign", { bg = c.bg_column, bold = true })
hl("DiffAdd", { bg = c.light_green }) -- todo diffs
hl("DiffChange", { bg = c.diff_add_text })
hl("DiffDelete", { fg = c.fg, bg = c.light_red })
hl("DiffText", { bg = c.light_green })
hl("DiffTextAdd", { bg = c.diff_add_text })
hl("Directory", { fg = c.special })
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
hl("ErrorMsg", { fg = c.bg, bg = c.fg })
hl("FloatBorder", { fg = c.fg, bg = c.bg_float })
hl("FloatFooter", "FloatTitle")
hl("FloatTitle", { fg = c.fg, bg = c.bg_float, bold = true })
hl("FoldColumn", { fg = c.fg_dim })
hl("Folded", { fg = c.fg_dim, bg = c.bg })
hl("IncSearch", { bg = c.search.inc })
hl("LineNr", { fg = c.fg_dim2 })
hl("LineNrAbove", "LineNr")
hl("LineNrBelow", "LineNr")
hl("MatchParen", c.match_paren)
hl("ModeMsg", { fg = c.fg, bold = true })
hl("MoreMsg", { fg = c.fg, bold = true })
hl("MsgArea", { fg = c.fg })
hl("MsgSeparator", "StatusLine")
hl("NonText", { fg = c.fg_dim })
hl("NormalFloat", { fg = c.fg, bg = c.bg_float })
hl("NormalNC", {})
hl("OkMsg", { fg = c.green })
hl("Pmenu", { fg = c.fg, bg = c.bg_float })
hl("PmenuExtra", "Pmenu")
hl("PmenuExtraSel", "PmenuSel")
hl("PmenuKind", "Pmenu")
hl("PmenuKindSel", "PmenuSel")
hl("PmenuMatch", { fg = c.special, bold = true })
hl("PmenuMatchSel", { bold = true })
hl("PmenuSbar", { fg = c.none, bg = c.bg_float })
hl("PmenuSel", { bg = c.visual, bold = true })
hl("PmenuThumb", { fg = c.fg, bg = c.special })
hl("Question", { fg = c.fg, bold = true })
hl("QuickFixLine", { bg = c.bg_float })
hl("Search", { fg = c.bg, bg = c.search.hl })
hl("SignColumn", { fg = c.fg_dim })
hl("SnippetTabstop", "Visual")
hl("SpecialKey", { fg = c.number })
hl("SpellBad", { sp = c.red, undercurl = true }) -- todo spells
hl("SpellCap", { sp = c.green, undercurl = true })
hl("SpellLocal", { sp = c.bright_blue, undercurl = true })
hl("SpellRare", { sp = c.cyan, undercurl = true })
hl("StatusLine", c.status_line)
hl("StatusLineNC", "StatusLine")
hl("StatusLineTerm", "StatusLine")
hl("StatusLineTermNC", "StatusLine")
hl("StderrMsg", { fg = c.red })
hl("StdoutMsg", { fg = c.fg })
hl("Substitute", "CurSearch")
hl("TabLine", { fg = c.fg, bg = c.bg })
hl("TabLineFill", { bg = c.bg })
hl("TabLineSel", { fg = c.bg, bg = c.fg, bold = true })
hl("TermCursor", "Cursor")
hl("TermCursorNC", {})
hl("Title", { fg = c.fg, bold = true })
hl("Visual", { bg = c.visual })
hl("VisualNOS", "Visual")
hl("WarningMsg", { fg = c.diag_warn })
hl("Whitespace", { fg = c.fg_dim })
hl("WildMenu", "CurSearch")
hl("WinBar", "StatusLine")
hl("WinBarNC", "StatusLineNC")
hl("WinSeparator", { fg = c.fg })
hl("lCursor", { fg = c.bg, bg = c.fg })

-- == Neovim Syntax ==
hl("Added", { fg = c.green })
hl("Bold", { bold = true })
hl("Boolean", { fg = c.boolean })
hl("Changed", { fg = c.cyan })
hl("Character", "String")
hl("Comment", c.comment)
hl("Conditional", { fg = c.keyword })
hl("Constant", { fg = c.fg, italic = true })
hl("Debug", { fg = c.red, bold = true })
hl("Define", { fg = c.fg })
hl("Delimiter", { fg = c.fg })
hl("Error", { fg = c.red })
hl("Exception", { fg = c.red })
hl("Float", { fg = c.number })
hl("Function", c.func)
hl("Identifier", { fg = c.fg })
hl("Ignore", { fg = c.fg_dim })
hl("Include", c.preproc)
hl("Italic", { italic = true })
hl("Keyword", { fg = c.keyword })
hl("Label", { fg = c.special })
hl("Macro", { fg = c.special })
hl("Number", { fg = c.number })
hl("Operator", { fg = c.fg })
hl("PreCondit", c.preproc)
hl("PreProc", c.preproc)
hl("Removed", { fg = c.red })
hl("Repeat", { fg = c.keyword })
hl("Special", { fg = c.special })
hl("SpecialChar", { fg = c.special })
hl("SpecialComment", { fg = c.doc_comment }) -- todo
hl("Statement", { fg = c.fg })
hl("StorageClass", { fg = c.special })
hl("String", { fg = c.string })
hl("Structure", { fg = c.structure })
hl("Tag", { fg = c.fg, bold = true })
hl("Todo", { bg = c.yellow, fg = c.fg, bold = true })
hl("Type", c.type)
hl("Typedef", { fg = c.structure })
hl("Underlined", { underline = true })

hl("LspCodeLens", { fg = c.fg_dim })
hl("LspCodeLensSeparator", { fg = c.fg_dim })
hl("LspInfoBorder", { fg = c.fg, bg = c.bg })
hl("LspInlayHint", "NonText")
hl("LspReferenceRead", { bg = c.bg_float })
hl("LspReferenceTarget", { fg = c.bg, bg = c.search.hl })
hl("LspReferenceText", { bg = c.bg_float })
hl("LspReferenceWrite", { bg = c.bg_float })
hl("LspSignatureActiveParameter", { underline = true, bold = true })
hl("DiagnosticOk", { fg = c.diag_ok })
hl("DiagnosticHint", { fg = c.purple })
hl("DiagnosticInfo", { fg = c.fg_dim })
hl("DiagnosticWarn", { fg = c.diag_warn })
hl("DiagnosticError", { fg = c.diag_err })
hl("DiagnosticUnderlineOk", { sp = c.diag_ok, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.purple, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.fg_dim, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.diag_warn, undercurl = true })
hl("DiagnosticUnderlineError", { sp = c.diag_err, undercurl = true })
hl("DiagnosticVirualTextOk", { fg = c.diag_ok })
hl("DiagnosticVirualTextHint", { fg = c.purple })
hl("DiagnosticVirualTextInfo", { fg = c.fg_dim })
hl("DiagnosticVirualTextWarn", { fg = c.diag_warn })
hl("DiagnosticVirualTextError", { fg = c.diag_err })

hl("diffAdded", "Added")
hl("diffRemoved", "Removed")
hl("diffChanged", "Changed")
hl("diffFile", { fg = c.fg })
hl("diffLine", { fg = c.fg })

-- == Treesitter ==
hl("@variable", { fg = c.fg })
-- hl("@variable.parameter", { italic = true })
hl("@comment.documentation", "SpecialComment")
hl("@keyword.directive", c.preproc)
hl("@keyword.import", c.preproc)
hl("@type.builtin", "Type")
hl("@function.call", { fg = c.fg })
hl("@function.method.call", { fg = c.fg })
hl("@markup.link.url", { underdotted = true })
hl("@markup.link", { fg = c.blue }) -- sus
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
