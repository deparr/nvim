-- slightly modfied from https://github.com/vim-scripts/terse/
vim.o.bg = "light"
vim.cmd "hi clear"
vim.cmd "syntax reset"
vim.g.colors_name = "terse"

local c = {
  bg = "#ecebe7",
  bg1 = "#e2e1dd",
  bg2 = "#d2d1cd",
  bg3 = "#e2e1d6",
  bg0 = "#fcfbf7",
  fg = "#00011f",
  dark_red = "#c80f3f",
  red = "#e4115b",
  yellow = "#fbf285",
  dark_gray = "#38362b",
  gray = "#58595b",
  green = "#acd58e",
  light_blue = "#93d2f3",
  darker_red = "#820056",
  light_red = "#edb2d1",
  dark_blue = "#00254f",
  dark_cyan = "#006363",
  orange = "#efbf28",
  white = "#ffffff",
  none = "NONE",
  todo = "#1010a0",
  dark_green = "#005f00",
  dark_yellow = "#916f00",
}

-- [x] remove endofbuffer tildes
-- [x] make linenr and signcolumn a single color
-- [x] function a dark blue, currently a slightly darker cyan than NvimDarkCyan
-- [x] try ident as underdot
-- [x] colorcolumn
-- [ ] maybe a lighter statusline
-- [ ] constant should remove underline/dot, this is harder than it's worth most likely
-- [x] diag colors, theyre okay at best
-- [x] attributes could be a little diff, hard to read gdscript attrs
-- [x] dark blue or background for types, dark blue is okay for now
-- [x] TabSel and friends
-- [x] NormalFloat and friends
-- [ ] Pmenu


local hl = function(group, opts)
  opts = type(opts) == "string" and { link = opts } or opts
  vim.api.nvim_set_hl(0, group, opts or {})
end

-- original Text Elements
hl("Normal", { fg = c.fg, bg = c.bg })
hl("Statement", { bg = c.bg3 })
hl("Comment", { fg = c.dark_gray, italic = true })
hl("Type")
hl("Special", { bold = true })
hl("Identifier", { underdotted = true })
hl("PreProc", {  fg = c.dark_blue, bold = true, italic = true })
hl("Constant", { italic = true, underdotted = false })
hl("String", { bg = c.bg1, italic = true })
hl("StatusLine", { fg = c.bg, bg = c.fg, italic = true })
hl("StatusLineNC", { fg = c.bg, bg = c.fg, italic = true })
hl("Error", { fg = c.white, bg = c.dark_red})
hl("Todo", { fg = c.red, bg = c.bg1, bold = true, italic = true })
hl("Underlined", { underline = true })

-- orginal Non-Text Elements
hl("NonText", { fg = c.gray })
hl("Search", { bg = c.yellow })
hl("IncSearch", { bg = c.yellow })
hl("CurSearch", { bg = c.orange })
hl("Directory", { bold = true })
hl("MoreMsg", { bg = c.bg1, italic = true })
hl("LineNr", { fg = c.gray, italic = true })
hl("Question")
hl("Title", { bold = true, italic = true })
hl("WarningMsg", { fg = c.white, bg = c.dark_red })
hl("Folded", { bg = c.bg1 })
hl("FoldColumn", { bg = c.bg1 })
hl("DiffAdd", { bg = c.green })
hl("DiffChange", { fg = c.dark_blue, bg = c.light_blue })
hl("DiffDelete", { fg = c.darker_red, bg = c.light_red })
hl("DiffText", { fg = c.dark_blue, bg = c.light_blue })
hl("Visual", { bg = c.orange })
hl("MatchParen", { fg = c.red, bold = true })

-- Customs
hl("@variable")
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
hl("CursorLine", { bg = c.bg2 })
hl("CursorLineNr", { bg = c.bg2, bold = true })
hl("CursorLineSign", { bg = c.bg2, bold = true })
hl("CursorColumn", { bg = c.bg2 })
hl("ColorColumn", { bg = c.bg2 })
hl("Function", { fg = c.dark_cyan })
hl("Type", { fg = c.dark_blue })
hl("@type.builtin", "Type")
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("NormalFloat", { fg = c.fg, bg = c.bg0 })
hl("FloatTitle", { fg = c.fg, bg = c.bg0, bold = true, italic = true })
hl("DiagnosticOk", { fg = c.dark_green })
hl("DiagnosticHint", { fg = c.gray })
hl("DiagnosticInfo", { fg = c.gray })
hl("DiagnosticWarn", { fg = c.dark_yellow })
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticUnderlineOk", { sp = c.dark_green, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.gray, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.gray, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.dark_yellow, undercurl = true })
hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
