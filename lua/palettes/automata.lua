local util = require("tairiki.util")

local M = {
  fg = "#1f1f1e",
  bg = "#dad4ba",

  -- terminal only colors
  bright_white = "#000000",
  white = "#1f1f1e",
  black = "#1f1f1e",
  bright_green = "#3fa66f",
  bright_blue = "#1745d5",
  bright_purple = "#8a4adf",

  -- palette
  red = "#732127",
  green = "#406647",
  yellow = "#b67f21",
  blue = "#3a5a67",
  purple = "#5b437a",
  cyan = "#2b797a",
  orange = "#b56121",

  -- extended palette
  dark_red = "#52212c",
  dark_cyan = "#005f5f",
  dark_orange = "#7d441b",

  -- special colors
  orange_red = "#9f4c05",
  olive = "#615700",

  comment = "#9f4c05",
  doc_comment = "#008000", -- todo
}

-- [palette]
-- black="#1F1E1E"
-- light-black="#33251F"
-- red="#52212C"
-- light-red="#732127"
-- green="#1B3B26"
-- light-green="#406647"
-- yellow="#B67F21"
-- light-yellow="#ADAD39"
-- blue="#3A4A67"
-- light-blue="#466A82"
-- purple="#5B437A"
-- light-purple="#8C485A"
-- aqua="#3D6B6B"
-- light-aqua="#2B797A"
-- white="#CDC8B0"
-- light-white="#EBE6D2"
-- bright-white="#DAD4BA"
-- whitespace="#918E82"
-- cursor-line="#D6A45D"

function M.regen_sub_groups(self)
  self.diag = {
    error = self.red,
    info = self.comment,
    warn = self.yellow,
    hint = self.comment,
    ok = self.green,
  }
  self.diff = {
    add = util.blend(self.green, self.bg, 0.26),
    remove = util.blend(self.red, self.bg, 0.18),
    change = util.blend(self.blue, self.bg, 0.16),
    text = util.blend(self.yellow, self.bg, 0.18),
  }
  self.syn = {
    ident = self.fg,
    constant = self.fg,
    literal = self.cyan,
    func = self.blue,
    string = self.green,
    type = self.dark_orange,
    keyword = self.fg,
    keyword_mod = self.fg,
    special = self.purple,
    delim = self.fg,
    exception = self.red,
    operator = self.fg,
  }
  self.terminal = {
    black = self.black,
    red = self.red,
    green = self.green,
    yellow = self.yellow,
    blue = self.blue,
    purple = self.purple,
    cyan = self.cyan,
    white = self.white,

    bright_black = self.olive,
    bright_red = self.orange_red,
    bright_green = self.bright_green,
    bright_yellow = self.yellow,
    bright_blue = self.bright_blue,
    bright_purple = self.bright_purple,
    bright_cyan = self.cyan,
    bright_white = self.bright_white,
  }
  self.highlights = {
    -- NormalFloat = {}, -- todo float stuff
    Character = "String",
    Comment = { fg = self.comment },
    Label = { fg = self.purple },
    MatchParen = { fg = self.bg, bg = self.purple },
    -- Macro = {}, -- todo
    NonText = { fg = self.olive },
    PreProc = { fg = self.olive },
    SpecialChar = { fg = self.orange },
    SpecialComment = { fg = self.doc_comment },

    LazyCommit = { fg = self.red },
    LazySpecial = { fg = self.blue },
    LazyLocal = { fg = self.orange },
    LazyComment = { fg = self.olive },
    LazyDimmed = { fg = self.olive },

    ["@character"] = "Character",
    ["@constant.macro"] = "Constant",
    -- ["@constructor"] = {}, -- todo
    ["@comment.documentation"] = "SpecialComment",
    ["@label"] = "Label",
    ["@markup.link.label"] = {},
    ["@markup.link.url"] = { underdotted = true },
    ["@markup.list"] = { fg = self.red },
    ["@tag"] = { fg = self.olive },
    -- ["@tag.builtin"] = { fg = self.olive }, -- todo

    ["@type"] = "Type",
    ["@type.builtin"] = "@type",

    ["@constructor.lua"] = { fg = self.fg },

    ["@punctuation.special.python"] = { fg = self.orange },

    ["@punctuation.special.bash"] = { fg = self.orange },

    ["@punctuation.special.jsx"] = { fg = self.orange },
    ["@punctuation.special.javascript"] = { fg = self.orange },

    ["@punctuation.special.tsx"] = { fg = self.orange },
    ["@punctuation.special.typescript"] = { fg = self.orange },

    ["@keyword.import.zig"] = "Function",

    ["@lsp.type.lifetime.rust"] = { fg = self.olive },

    ["@label.markdown"] = { fg = self.blue },
  }
end

M:regen_sub_groups()

return M
