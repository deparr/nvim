--[[ matklad css
.hl-keyword, .hl-literal {
  color: #000000;
  font-weight: bold;
}
.hl-type {
  color: #0086b3;
}
.hl-tag {
  color: #000080;
}
.hl-title.function_ {
  color: #990000;
  font-weight: bold;
}
.hl-title.class_ {
  color: #445588;
  font-weight: bold;
}
.hl-comment {
  color: #008000;
  font-style: italic;
}
.hl-built_in, .hl-meta {
  color: #3c5d5d;
  font-weight: bold;
}
.hl-number {
  color: #009999;
}
.hl-string {
  color: #d14;
}
.hl-output {
  color: #2156a5;
}
.hl-subst {
  color: rgba(0, 0, 0, 0.9);
}
.hl-attr, .hl-symbol {
  color: #008080;
}
.hl-line {
  background-color: #ffc;
}
--]]

vim.o.bg = "light"

vim.cmd "hi clear"

vim.g.colors_name = "notebook"

local c = {
  fg = "#101010",
  fg_light = "#484848",
  fg_light2 = "#cccccc",
  bg = "#f2f2f2",
  bg_dark = "#e6e6e6",

  muted_red = "#990000",
  red = "#dd1144",
  muted_blue = "#445588",
  blue = "#000080",
  bright_blue = "#2156a5",
  green = "#008000",
  muted_cyan = "#3c5d5d",
  cyan = "#008080",
  bright_cyan = "#009999",
  off_cyan = "#0086b3",
  yellow = "#f9eab3",
  orange = "#b37f02",

  todo = "#ff9920",

  diff_green = "#dfeacc",
  diff_red = "#edc7c7",
  diff_yellow = "#f9eab3",
  diff_change = "#ececec"
}

local hl = function(group, opts)
  opts = type(opts) == "string" and { link = opts } or opts
  vim.api.nvim_set_hl(0, group, opts or {})
end

-- == Neovim ==

hl("ColorColumn", { bg = c.bg_dark })
hl("Conceal", { fg = c.green })
hl("CurSearch", { fg = c.fg, bg = c.yellow })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = c.bg_dark })
hl("CursorIM", { fg = c.bg, bg = c.fg })
hl("CursorLine", { bg = c.bg_dark })
hl("CursorLineFold", "FoldColumn")
hl("CursorLineNr", { fg = c.fg, bg = c.bg_dark, bold = true })
hl("CursorLineSign",{ bg = c.bg_dark, bold = true })
hl("DiffAdd", { bg = c.diff_green })
hl("DiffChange", { bg = c.diff_change })
hl("DiffDelete", { fg = c.muted_red, bg = c.diff_red })
hl("DiffText", { bg = c.diff_yellow })
hl("Directory", { fg = c.off_cyan, bold = true  })
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
hl("ErrorMsg", { fg = c.red, bold = true })
hl("FloatBorder", { fg = c.fg_light2 })
hl("FloatFooter", "FloatTitle")
hl("FloatTitle", { fg = c.fg, bold = true })
hl("FoldColumn", { fg = c.fg_light })
hl("Folded", { fg = c.fg_light, bg = c.bg_dark })
hl("IncSearch", { fg = c.fg, bg = c.yellow })
hl("LineNr", { fg = c.fg_light })
hl("LineNrAbove", "LineNr")
hl("LineNrBelow", "LineNr")
hl("MatchParen", { bold = true })
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
hl("PmenuMatch", { fg = c.orange, bold = true })
hl("PmenuMatchSel", { bold = true })
hl("PmenuSbar", { fg = c.none, bg = c.bg_dark })
hl("PmenuSel", { bg = c.bg_dark, bold = true })
hl("PmenuThumb", { fg = c.fg, bg = c.bg_dark })
hl("Question", { fg = c.fg, bold = true })
hl("QuickFixLine", { bg = c.bg_dark })
hl("Search", { fg = c.fg, bg = c.yellow })
hl("SignColumn", { fg = c.fg_light })
hl("SnippetTabstop", "Visual")
hl("SpecialKey", { fg = c.cyan })
hl("SpellBad", { sp = c.red, underline = true })
hl("SpellCap", { sp = c.orange, underline = true })
hl("SpellLocal", { sp = c.bright_blue, underline = true })
hl("SpellRare", { sp = c.bright_cyan, underline = true })
hl("StatusLine", { fg = c.fg, bg = c.bg_dark })
hl("StatusLineNC", { fg = c.fg, bg = c.bg })
hl("StatusLineTerm", { fg = c.fg_light, bg = c.bg_dark })
hl("StatusLineTermNC", { fg = c.fg, bg = c.bg })
hl("StderrMsg", { fg = c.muted_red });
hl("StdoutMsg", { fg = c.fg });
hl("Substitute", "CurSearch")
hl("TabLine", { fg = c.fg, bg = c.bg_dark })
hl("TabLineFill", { bg = c.bg_dark })
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("TermCursor", "Cursor")
hl("TermCursorNC", {})
hl("Title", { fg = c.fg, bold = true })
hl("Visual", { bg = c.fg_light2 })
hl("VisualNOS", "Visual")
hl("WarningMsg", { fg = c.orange })
hl("Whitespace", { fg = c.fg_light })
hl("WildMenu", "CurSearch")
hl("WinBar", "StatusLine")
hl("WinBarNC", "StatusLineNC")
hl("WinSeparator", { fg = c.fg_light })
hl("lCursor", { fg = c.bg, bg = c.fg })

-- == Neovim Syntax ==
hl("Added", { fg = c.green })
hl("Bold", { bold = true })
hl("Boolean", { fg = c.fg, bold = true })
hl("Changed", { fg = c.cyan })
hl("Character", { fg = c.red })
hl("Comment", { fg = c.green })
hl("Conditional", { fg = c.fg, bold = true })
hl("Constant", { fg = c.fg })
hl("Debug", { fg = c.orange })
hl("Define", { fg = c.fg })
hl("Delimiter", { fg = c.fg })
hl("Error", { fg = c.red })
hl("Exception", { fg = c.red })
hl("Float", { fg = c.bright_cyan })
hl("Function", { fg = c.muted_red, bold = true })
hl("Identifier", { fg = c.fg })
hl("Ignore", { fg = c.fg_light })
hl("Include", { fg = c.fg, bold = true })
hl("Italic", { italic = true })
hl("Keyword", { fg = c.fg, bold = true })
hl("Label", { fg = c.muted_cyan }) -- todo
hl("Macro", { fg = c.muted_cyan })
hl("Number", { fg = c.bright_cyan })
hl("Operator", { fg = c.fg })
hl("PreCondit", { fg = c.orange })
hl("PreProc", { fg = c.fg })
hl("Removed", { fg = c.muted_red })
hl("Repeat", { fg = c.fg, bold = true })
hl("Special", { fg = c.bright_blue })
hl("SpecialChar", { fg = c.bright_blue })
hl("SpecialComment", "Comment")
hl("Statement", { fg = c.fg, bold = true })
hl("StorageClass", { fg = c.muted_cyan, bold = true })
hl("String", { fg = c.red })
hl("Structure", { fg = c.fg }) -- never know what to use this for
hl("Tag", { fg = c.bright_blue })
hl("Todo", { fg = c.muted_cyan, bold = true })
hl("Type", { fg = c.off_cyan })
hl("Typedef", { fg = c.muted_cyan })
hl("Underlined", { underline = true })

hl("LspCodeLens", { fg = c.fg_dark2 })
hl("LspCodeLensSeparator", { fg = c.fg_light })
hl("LspInfoBorder", { fg = c.fg_light, bg = c.bg })
hl("LspInlayHint", "NonText")
hl("LspReferenceRead", { bg = c.bg_dark })
hl("LspReferenceTarget", { bg = c.bg_dark })
hl("LspReferenceText", { bg = c.bg_dark })
hl("LspReferenceWrite", { bg = c.bg_dark })
hl("LspSignatureActiveParameter", { underline = true, bold = true })
hl("DiagnosticOk", { fg = c.green, bold = true })
hl("DiagnosticHint", { fg = c.muted_blue, bold = true })
hl("DiagnosticInfo", { fg = c.bright_blue, bold = true })
hl("DiagnosticWarn", { fg = c.orange, bold = true })
hl("DiagnosticError", { fg = c.muted_red, bold = true })
hl("DiagnosticUnderlineOk", { sp = c.green, underline = true })
hl("DiagnosticUnderlineHint", { sp = c.muted_blue, underline = true })
hl("DiagnosticUnderlineInfo", { sp = c.muted_cyan, underline = true })
hl("DiagnosticUnderlineWarn", { sp = c.orange, underline = true })
hl("DiagnosticUnderlineError", { sp = c.muted_red, underline = true })
hl("DiagnosticVirualTextOk", { fg = c.green })
hl("DiagnosticVirualTextHint", { fg = c.muted_blue })
hl("DiagnosticVirualTextInfo", { fg = c.muted_blue })
hl("DiagnosticVirualTextWarn", { fg = c.orange })
hl("DiagnosticVirualTextError", { fg = c.muted_red })

hl("diffAdded", "Added")
hl("diffRemoved", "Removed")
hl("diffChanged", "Changed")
hl("diffFile", { fg = c.fg })
hl("diffLine", { fg = c.fg })


-- == Treesitter == :h treesitter-highlight-groups
hl("@variable", {})
hl("@variable.builtin", {})
hl("@variable.parameter", {})
hl("@variable.parameter.builtin", {})
hl("@variable.member", {})
hl("@constant", "Constant")
hl("@constant.builtin", { fg = c.muted_red, bold = true })
hl("@constant.macro", { fg = c.fg })
hl("@module", {})
hl("@module.builtin", { bg = c.todo });
hl("@label", "Label")
hl("@string", "String")
hl("@string.documentation", "@comment.documentation")
hl("@string.regexp", { fg = c.orange })
hl("@string.escape", { fg = c.fg })
hl("@string.special", { fg = c.fg })
hl("@string.special.symbol", { fg = c.cyan })
hl("@string.special.path", { fg = c.fg })
hl("@string.special.url", "Underlined")
hl("@character", "Character")
hl("@character.special", {})
hl("@boolean", "Boolean")
hl("@number", "Number")
hl("@number.float", "Float")
hl("@type", { fg = c.muted_blue })
hl("@type.builtin", "Type")
hl("@type.definition") -- todo
hl("@attribute", { fg = c.cyan })
hl("@attribute.builtin", { bg = c.todo })
hl("@property")
hl("@function", { fg = c.muted_red, bold = true })
hl("@function.builtin", { fg = c.muted_cyan, bold = true })
hl("@function.call")
hl("@function.macro", { fg = c.muted_cyan })
hl("@function.method", { fg = c.muted_red, bold = true })
hl("@function.method.call")
hl("@constructor", { fg = c.cyan, bold = true }) -- todo
hl("@operator", "Operator")
hl("@keyword", "Keyword")
-- .coroutine .function .operator
-- .import .type .modifier
-- .repeat .return .debug
-- .exception .conditional .conditional.ternary
-- .directive .directive.define
hl("@punctuation", { fg = c.fg })
-- .delimiter .bracket
hl("@punctuation.special")
hl("@comment", "Comment")
hl("@comment.documentation", "Comment")
hl("@comment.error", "DiagnosticError")
hl("@comment.warning", "DiagnosticWarn")
hl("@comment.todo", "Todo")
hl("@comment.note", "DiagnosticInfo")
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@markup.heading", "Title")
hl("@markup.quote", { fg = c.fg})
hl("@markup.math", { fg = c.bright_blue })
hl("@markup.link", { fg = c.fg })
hl("@markup.link.label", { fg = c.fg })
hl("@markup.link.url", { fg = c.fg })
hl("@markup.raw", { fg = c.bright_blue })
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

hl("@constructor.lua")
hl("@keyword.import.zig", "@function.builtin")
hl("@lsp.type.lifetime.rust", "@attribute")
hl("@string.typst", { fg = c.green })
hl("@label.vimdoc", { fg = c.fg, bold = true })
hl("@markup.link.vimdoc", { fg = c.bright_blue, bold = true })

hl("LazySpecial", { fg = c.bright_blue })
