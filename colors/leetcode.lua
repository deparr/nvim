vim.o.bg = "light"

vim.cmd "hi clear"

vim.g.colors_name = "leetcode"

local c = {
  bg = "#ffffff",
  bg_dark = "#f0f0f0",
  bg_dark2 = "#e5efe5",
  bg_dark3 = "#a8ac94",
  fg = "#000000",
  fg_light = "#3b3b3b",
  fg_light2 = "#585858",

  todo = "#d04080",

  green = "#008000",
  cyan = "#267f99",
  gold = "#795e26",
  bright_blue = "#0000ff",
  blue = "#001080",
  nice_blue = "#0070c1",
  blue_green = "#098658",
  pink = "#af00db",
  purple = "#7929c8",
  red = "#a31515",
  bright_red = "#ee0000",
  maroon = "#811f3f",

  light_orange = "#f8c9ab",
  light_green = "#d7e7b3",
  light_red = "#ffa3a3",

  diff_change_line = "#ebf1dd",
  diff_change_text = "#d7e8b1",

  visual = "#add6ff",

  -- need a red / orange for diags
}

local hl = function(group, opts)
  opts = type(opts) == "string" and { link = opts } or opts
  vim.api.nvim_set_hl(0, group, opts or {})
end

hl("ColorColumn", { bg = c.bg_dark2 })
hl("Conceal", { fg = c.green })
hl("CurSearch", { bg = c.light_yellow })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = c.bg_dark })
hl("CursorIM", { fg = c.bg, bg = c.fg })
hl("CursorLine", {})
hl("CursorLineFold", "FoldColumn")
hl("CursorLineNr", { fg = c.blue })
hl("CursorLineSign", { bold = true })
hl("DiffAdd", { bg = c.light_green }) -- todo diff colors
hl("DiffChange", { bg = c.diff_change_line })
hl("DiffDelete", { fg = c.red, bg = c.light_red })
hl("DiffText", { bg = c.diff_change_text })
hl("DiffTextAdd", { bg = c.diff_change_text })
hl("Directory", { fg = c.bright_blue })
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
hl("ErrorMsg", { fg = c.red, bold = true })
hl("FloatBorder", { fg = c.fg })
hl("FloatFooter", "FloatTitle")
hl("FloatTitle", { fg = c.fg, bold = true })
hl("FoldColumn", { fg = c.fg_light })
hl("Folded", { fg = c.fg_light, bg = c.bg_dark })
hl("IncSearch", { bg = c.light_orange })
hl("LineNr", { fg = c.cyan })
hl("LineNrAbove", "LineNr")
hl("LineNrBelow", "LineNr")
hl("MatchParen", { bg = c.bg_dark2, bold = true }) -- todo
hl("ModeMsg", { fg = c.fg_light2, bold = true })
hl("MoreMsg", { fg = c.fg_light2, bold = true })
hl("MsgArea", { fg = c.fg })
hl("MsgSeparator", "StatusLine")
hl("NonText", { fg = c.fg_light })
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { bg = c.bg_dark })
hl("NormalNC", {})
hl("OkMsg", { fg = c.green })
hl("Pmenu", { fg = c.fg, bg = c.diff_change }) -- todo
hl("PmenuExtra", "Pmenu")
hl("PmenuExtraSel", "PmenuSel")
hl("PmenuKind", "Pmenu")
hl("PmenuKindSel", "PmenuSel")
hl("PmenuMatch", { fg = c.nice_blue, bold = true })
hl("PmenuMatchSel", { bold = true })
hl("PmenuSbar", { fg = c.none, bg = c.bg_dark })
hl("PmenuSel", { bg = c.bg_dark2, bold = true })
hl("PmenuThumb", { fg = c.fg, bg = c.bg_dark })
hl("Question", { fg = c.fg, bold = true })
hl("QuickFixLine", { bg = c.bg_dark })
hl("Search", { bg = c.light_orange })
hl("SignColumn", { fg = c.fg_light })
hl("SnippetTabstop", "Visual")
hl("SpecialKey", { fg = c.green })
hl("SpellBad", { sp = c.red, undercurl = true })
hl("SpellCap", { sp = c.pink, undercurl = true })
hl("SpellLocal", { sp = c.bright_blue, undercurl = true })
hl("SpellRare", { sp = c.cyan, undercurl = true })
hl("StatusLine", { fg = c.fg_light2, bg = c.bg_dark, bold = true })
hl("StatusLineNC", { fg = c.fg_light2, bg = c.bg })
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
hl("Visual", { bg = c.visual })
hl("VisualNOS", "Visual")
hl("WarningMsg", { fg = c.gold })
hl("Whitespace", { fg = c.fg_light })
hl("WildMenu", "CurSearch")
hl("WinBar", "StatusLine")
hl("WinBarNC", "StatusLineNC")
hl("WinSeparator", { fg = c.fg })
hl("lCursor", { fg = c.bg, bg = c.fg })

-- == Neovim Syntax ==
hl("Added", { fg = c.green })
hl("Bold", { bold = true })
hl("Boolean", { fg = c.bright_blue })
hl("Changed", { fg = c.cyan })
hl("Character", "String")
hl("Comment", { fg = c.green })
hl("Conditional", { fg = c.pink })
hl("Constant", { fg = c.fg })
hl("Debug", { fg = c.purple, bold = true })
hl("Define", { fg = c.pink })
hl("Delimiter", { fg = c.fg })
hl("Error", { fg = c.red }) -- todo
hl("Exception", { fg = c.pink })
hl("Float", { fg = c.blue_green })
hl("Function", { fg = c.gold })
hl("Identifier", { fg = c.fg })
hl("Ignore", { fg = c.fg_light })
hl("Include", { fg = c.pink })
hl("Italic", { italic = true })
hl("Keyword", { fg = c.bright_blue })
hl("Label", { fg = c.blue }) -- todo
hl("Macro", { fg = c.pink }) -- todo Also used for fugitive unstaged
hl("Number", { fg = c.blue_green })
hl("Operator", { fg = c.fg })
hl("PreCondit", { fg = c.pink })
hl("PreProc", { fg = c.pink })
hl("Removed", { fg = c.red })
hl("Repeat", { fg = c.pink })
hl("Special", { fg = c.bright_red })
hl("SpecialChar", { fg = c.bright_red })
hl("SpecialComment", { fg = c.nice_blue }) -- todo
hl("Statement", { fg = c.fg })
hl("StorageClass", { fg = c.bright_blue })
hl("String", { fg = c.red })
hl("Structure", { fg = c.bright_blue })
hl("Tag", { fg = c.blue }) -- todo
hl("Todo", { fg = c.gold, bold = true })
hl "Type"
hl("Typedef", { fg = c.cyan })
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
hl("DiagnosticOk", { fg = c.green, bold = true })
hl("DiagnosticHint", { fg = c.fg_light2, bold = true })
hl("DiagnosticInfo", { fg = c.cyan, bold = true })
hl("DiagnosticWarn", { fg = c.gold, bold = true })
hl("DiagnosticError", { fg = c.red, bold = true })
hl("DiagnosticUnderlineOk", { sp = c.green, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.fg_light2, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.cyan, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.gold, undercurl = true })
hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hl("DiagnosticVirualTextOk", { fg = c.green })
hl("DiagnosticVirualTextHint", { fg = c.fg_light2 })
hl("DiagnosticVirualTextInfo", { fg = c.cyan })
hl("DiagnosticVirualTextWarn", { fg = c.gold })
hl("DiagnosticVirualTextError", { fg = c.red })

hl("diffAdded", "Added")
hl("diffRemoved", "Removed")
hl("diffChanged", "Changed")
hl("diffFile", { fg = c.fg })
hl("diffLine", { fg = c.fg })

-- == Treesitter == :h treesitter-highlight-groups
hl("@variable", { fg = c.fg })
hl("@variable.builtin", {})
hl("@variable.parameter", { fg = c.blue })
hl("@variable.parameter.builtin", {})
hl("@variable.member", {}) -- todo maybe blue ?
hl("@constant", "Constant")
hl("@constant.builtin", { fg = c.bright_blue })
hl "@constant.macro"
hl("@module", { fg = c.blue })
hl("@module.builtin", { fg = c.bright_blue })
hl("@label", "Label")
hl("@string", "String")
hl("@string.documentation", "@comment.documentation")
hl("@string.regexp", { fg = c.maroon })
hl("@string.escape", { fg = c.bright_red })
hl("@string.special", { fg = c.fg }) -- todo
hl("@string.special.symbol", { fg = c.cyan }) -- todo
hl("@string.special.path", { fg = c.fg })
hl("@string.special.url", "Underlined")
hl("@character", "Character")
hl("@character.special", { fg = c.bright_blue })
hl("@boolean", "Boolean")
hl("@number", "Number")
hl("@number.float", "Float")
hl "@type"
hl("@type.builtin", { fg = c.cyan })
hl("@type.definition", "TypeDef")
hl("@attribute", { fg = c.blue, bold = true })
hl("@attribute.builtin", { bg = c.todo }) -- todo
hl "@property"
hl("@function", "Function")
hl("@function.builtin", { fg = c.gold })
hl("@function.call", { fg = c.fg })
hl("@function.macro", { fg = c.nice_blue })
hl("@function.method", "Function")
hl("@function.method.call", { fg = c.fg })
hl("@constructor", { fg = c.gold })
hl("@operator", "Operator")
hl("@keyword", "Keyword")
hl("@keyword.conditional", { fg = c.pink })
hl("@keyword.coroutine", { fg = c.pink })
hl("@keyword.import", { fg = c.pink })
hl("@keyword.operator", { fg = c.pink })
hl("@keyword.repeat", { fg = c.pink })
hl("@keyword.return",{ fg = c.pink })
-- .function .type .modifier
-- .debug .exception
-- .directive .directive.define
hl("@punctuation", { fg = c.fg })
-- .delimiter .bracket
hl("@punctuation.special", { fg = c.blue_green })
hl("@comment", "Comment")
hl("@comment.documentation", { fg = c.green }) -- todo not good
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
hl("@markup.link.label", { fg = c.red })
hl("@markup.link.url", { fg = c.fg })
hl("@markup.raw", { fg = c.green }) -- todo
hl("@markup.raw.block", { fg = c.green })
hl("@markup.list", { fg = c.blue })
hl("@markup.list.checked", { fg = c.fg })
hl("@markup.list.unchecked", { fg = c.fg })
hl("@diff.plus", "Added")
hl("@diff.minus", "Removed")
hl("@diff.delta", "Changed")
hl("@tag", "Tag")
-- .builtin
hl("@tag.attribute", { fg = c.fg })
hl("@tag.delimiter", { fg = c.fg })

hl("@type.definition.c", { fg = c.fg })
hl("@constructor.lua", { fg = c.fg_light })
hl("@keyword.import.zig", "@function.builtin")
-- hl("@lsp.type.lifetime.rust", "@attribute") -- todo
hl("@label.vimdoc", { fg = c.blue, bold = true })
hl("@markup.link.vimdoc", { fg = c.bright_blue })

-- for ui 2
hl("@keyword.vim", { fg = c.pink })
hl("@string.vim", { fg = c.green })

-- todo Good fugitive colors ?

hl("fugitiveHeading", { fg = c.pink, bold = true })
hl("fugitiveStagedHeading", { fg = c.pink, bold = true })
hl("fugitiveUnstagedHeading", { fg = c.pink, bold = true })
hl("fugitiveUntrackedHeading", { fg = c.pink, bold = true })
hl("fugitiveHelpHeading", { fg = c.fg_light2 })
hl("fugitiveHelpTag", { fg = c.fg_light2 })
hl("fugitiveSymbolicRef", { fg = c.green, bold = true })
hl("fugitiveUntrackedModifier", { fg = c.red, bold = true })
hl("fugitiveUnstagedModifier", { fg = c.bright_blue, bold = true })
hl("fugitiveStagedModifier", { fg = c.green, bold = true })
hl("fugitiveHash", { fg = c.nice_blue })

hl("gitKeyword", { fg = c.pink })
hl("gitHashAbbrev", { fg = c.nice_blue })
hl("gitEmail", { fg = c.gold })

hl("BlinkCmpGhostText", "Comment")

hl("LazyCommit", { fg = c.gold })
hl("LazyLocal", { fg = c.red })
hl("LazySpecial", { fg = c.nice_blue })

hl("OilDirHidden", "Directory")

hl("TelescopeMultiIcon", { fg = c.blue, bold = true })
hl("TelescopeMultiSelection", { fg = c.blue })
hl("TelescopePromptPrefix", { fg = c.fg, bold = true })
hl("TelescopeTitle", { fg = c.red, bold = true })

vim.treesitter.query.set("go", "highlights", [[
; extends
[ "map" "chan" ] @keyword
[ "continue" "break" ] @keyword.repeat
[ "default" ] @keyword.conditional
]])

vim.treesitter.query.set("python", "highlights", [[
; extends
(class_definition
  name: (identifier) @type.builtin)
]])
