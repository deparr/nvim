local fg = "#cccccc"
local keyword = "#dddddd"
local string = "#22ee55"
local builtin = "#ff894c"
local comment = "#aaaa77"
local func = "#b1a0f8"
local literal = "#ff8080"
local type = "#6688ff"

local h = {
  Normal = { fg = fg },
  Comment = { fg = comment, italic = true },
  Constant = { fg = literal },
  String = { fg = string },
  Character = { fg = literal },
  Number = { fg = literal },
  Boolean = { fg = literal },
  Float = { fg = literal },
  Identifier = { fg = fg },
  Function = { fg = func },
  Statement = { fg = fg },
  Conditional = { fg = keyword, bold = true },
  Repeat = { fg = keyword, bold = true },
  Label = { fg = fg },
  Operator = { fg = fg },
  Keyword = { fg = keyword, bold = true },
  Exception = { fg = keyword },
  PreProc = { fg = keyword, bold = true },
  Include = { fg = keyword, bold = true },
  Define = { fg = keyword, bold = true },
  Macro = { fg = builtin },
  PreCondit = { fg = keyword, bold = true },
  Type = { fg = fg },
  StorageClass = { fg = type },
  Structure = { fg = type },
  Typedef = { fg = type },
  Special = { fg = builtin, bold = true },
  SpecialChar = { fg = builtin },
  Tag = { fg = type },
  Delimiter = { fg = fg },
  SpecialComment = { fg = comment, italic = true, bold = true },
  Debug = { fg = builtin },
  Underlined = { underline = true },
  Bold = { bold = true },
  Ignore = {},
  Todo = { fg = builtin, bold = true },
}

h["@variable"] = { fg = fg }
h["@variable.builtin"] = { fg = literal }
h["@variable.parameter"] = { fg = fg }
h["@variable.parameter.builtin"] = { fg = fg }
h["@variable.member"] = { fg = fg }
h["@constant"] = h.Constant
h["@constant.builtin"] = h["@constant"]
h["@constant.macro"] = h.Macro
h["@module"] = { fg = fg }
h["@module.builtin"] = { fg = func }
h["@label"] = { fg = fg }
h["@string"] = h.String
h["@string.documentation"] = h.String
h["@string.regexp"] = { fg = literal }
h["@string.escape"] = { fg = literal }
h["@string.special"] = { fg = literal }
h["@string.special.symbol"] = { fg = literal }
h["@string.special.path"] = { fg = literal }
h["@string.special.url"] = { fg = type, underline = true }
h["@character"] = h.Character
h["@character.special"] = h.SpecialChar
h["@boolean"] = h.Boolean
h["@number"] = h.Number
h["@number.float"] = h.Float
h["@type"] = h.Type
h["@type.builtin"] = { fg = type }
h["@type.definition"] = { fg = fg }
h["@attribute"] = h.PreProc
h["@attribute.builtin"] = h.PreProc
h["@property"] = { fg = fg }
h["@function"] = h.Function
h["@function.builtin"] = { fg = builtin }
h["@function.macro"] = h.Macro
h["@constructor"] = { fg = builtin }
h["@operator"] = h.Operator
h["@keyword"] = h.Keyword
h["@keyword.coroutine"] = h.Keyword
h["@keyword.function"] = h.Keyword
h["@keyword.operator"] = h.Keyword
h["@keyword.import"] = h.Keyword
h["@keyword.type"] = h.Keyword
h["@keyword.modifier"] = h.Keyword
h["@keyword.repeat"] = h.Keyword
h["@keyword.return"] = h.Keyword
h["@keyword.debug"] = h.Keyword
h["@keyword.exception"] = h.Keyword
h["@keyword.conditional"] = h.Keyword
h["@keyword.conditional.ternary"] = h.Operator
h["@keyword.directive"] = h.Keyword
h["@keyword.directive.define"] = h.Keyword
h["@punctuation.delimiter"] = { fg = fg }
h["@punctuation.bracket"] = { fg = fg }
h["@punctuation.special"] = { fg = func }
h["@comment"] = h.Comment
h["@comment.error"] = h.Comment
h["@comment.warning"] = h.Comment
h["@comment.todo"] = h.Comment
h["@comment.note"] = h.Comment
h["@markup.strong"] = { bold = true }
h["@markup.italic"] = { italic = true }
h["@markup.strikethrough"] = { strikethrough = true }
h["@markup.underline"] = { underline = true }
h["@markup.heading"] = { fg = fg }
h["@markup.heading.1"] = { fg = fg }
h["@markup.heading.2"] = { fg = fg }
h["@markup.heading.3"] = { fg = fg }
h["@markup.heading.4"] = { fg = fg }
h["@markup.heading.5"] = { fg = fg }
h["@markup.heading.6"] = { fg = fg }
h["@markup.quote"] = { fg = fg }
h["@markup.math"] = { fg = func }
h["@markup.link"] = { fg = type }
h["@markup.link.label"] = { fg = builtin }
h["@markup.link.url"] = { underline = true }
h["@markup.raw"] = h.String
h["@markup.raw.block"] = h.String
h["@markup.list"] = h.Special
h["@markup.list.checked"] = { fg = string }
h["@markup.list.unchecked"] = { fg = fg }
h["@diff.plus"] = h.DiffAdd
h["@diff.minus"] = h.DiffDelete
h["@diff.delta"] = h.DiffChange
h["@tag"] = { fg = type }
h["@tag.builtin"] = { fg = func }
h["@tag.attribute"] = h["@property"]
h["@tag.delimiter"] = h.Delimiter

return h
