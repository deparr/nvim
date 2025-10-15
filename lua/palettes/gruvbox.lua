local util = require("tairiki.util")

local M = {
  bg       = "#1d2021",
  fg       = "#fbf1cc",
  purple   = "#d3869b",
  green    = "#b8bb26",
  orange   = "#fe8019",
  blue     = "#83a598",
  yellow   = "#fabd2f",
  cyan     = "#8ec07c",
  red      = "#fb4934",
  comment  = "#fe8019",
  rust     = "#d65d0e",
  black    = "#000000",
  none     = "none",
}

M.bg_light  = "#3c3836"
M.bg_light2 = "#504945"
M.bg_light3 = "#665c54"
M.fg_dark   = "#ebdbb2"
M.fg_dark2  = "#d5c4a1"
M.fg_dark3  = "#bdae93"

function M.regen_sub_groups(self)
  self.diag     = {
    error = self.red,
    info  = self.fg_dark3,
    warn  = self.orange,
    hint  = self.fg_dark3,
    ok    = self.cyan,
  }
  self.diff     = {
    add    = util.blend(self.cyan, self.bg, 0.3),
    remove = util.blend(self.red, self.bg, 0.1),
    change = util.blend(self.fg_dark3, self.bg, 0.3),
    text   = util.blend(self.blue, self.bg, 0.35),
  }
  self.syn      = {
    ident       = self.fg,
    constant    = self.orange,
    literal     = self.orange,
    func        = self.blue,
    string      = self.green,
    type        = self.yellow,
    keyword     = self.purple,
    keyword_mod = self.yellow,
    special     = self.cyan,
    delim       = self.fg_dark,
    exception   = self.red,
    operator    = self.fg_dark,
  }
  self.terminal = {
    black = "#1d2021",
    red = "#fb4934",
    green = "#b8bb26",
    yellow = "#fabd2f",
    blue = "#83a598",
    purple = "#de869b",
    cyan = "#8ec07c",
    white = "#d5c4a1",

    bright_black = "#665c54",
    bright_red = "#fe8019",
    bright_green = "#3c3836",
    bright_yellow = "#504945",
    bright_blue = "#bdae93",
    bright_purple = "#ebdbb2",
    bright_cyan = "#d65d0e",
    bright_white = "#fbf1c7",
  }

  self.highlights = {
    NormalFloat = { bg = self.black },
    FloatTitle = { fg = self.fg, bg = self.black, bold = true  },
    FloatBorder = { fg = self.fg_dark, bg = self.black },
    Debug = { fg = self.red },
    Character = { fg = self.red },
    Comment = { fg = self.comment },
    Include = { fg = self.blue },
    Label = { fg = self.yellow },
    Macro = { fg = self.red },
    PreProc = { fg = self.yellow },
    Repeat = { fg = self.yellow },
    SpecialChar = { fg = self.rust },
    Statement = { fg = self.purple },
    Structure = { fg = self.purple },
    Tag = { fg = self.yellow },
    Todo = { fg = self.yellow },

    ["@character"] = "Character",
    ["@comment.documentation"] = { fg = self.cyan },
    ["@constructor"] = { fg = self.blue },
    ["@label"] = "Label",
    ["@type"] = "Type",
    ["@type.builtin"] = "@type",

    ["@keyword.import.zig"] = "@function.builtin",

    rustIdentifier = { fg = self.red },
    rustCommentLineDoc = { fg = self.cyan },
    rustModPathSep = { fg = self.rust },
    rustPubScopeDelim = { fg = self.rust },
  }
end

M:regen_sub_groups()

return M
