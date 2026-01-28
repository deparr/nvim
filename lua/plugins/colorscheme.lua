-- highlight-groups group-name -> syntax.txt
return {
  {
    "deparr/tairiki.nvim",
    lazy = true,
    -- dir = require("util").dev "deparr/tairiki.nvim",
    -- config = false,
    config = function()
      -- require("tairiki.palette").register("gruvbuddy", require "palettes.gruvbuddy")
      -- require("tairiki.palette").register("gruvbox", require "palettes.gruvbox")
      require("tairiki.palette").register("alacritty", require "palettes.alacritty")
      require("tairiki").setup {
        palette = "alacritty",
        plugins = { auto = true, vim_syntax = true },
        -- plugins = { all = true },
        code_style = { comments = { italic = false } },
        colors = function(c, _)
          local util = require "tairiki.util"
          c.dark_cyan = util.blend_bg(c.cyan, 0.9, c.bg)
        end,
        highlights = function(hl, c, _)
          hl["Title"] = { fg = c.fg, bold = false }
          hl["Special"] = { fg = c.syn.special, bold = false }

          hl["@string.special.url.gdscript"] = { fg = c.dark_cyan }

          hl["@string.special.url.gomod"] = { fg = c.dark_cyan, underline = false }
          hl["@string.special.url.gosum"] = { fg = c.dark_cyan, underline = false }

          hl["@string.special.url.svelte"] = { fg = c.syn.string }

          hl["@constructor.ocaml"] = { fg = c.orange }
          -- hl["@module.ocaml"] = { fg = c.orange }
          -- hl["@label.ocaml"] = { fg = c.yellow }

          hl["@operator.gleam"] = { fg = c.light_purple or c.purple }

          hl["@variable.powershell"] = { fg = c.syn.constant }
          hl["@operator.powershell"] = { fg = c.yellow }

          -- consider upstream
          hl["@lsp.type.variable"] = {}
          hl["@variable.member"] = {}
          if c.doc_comment then
            hl["SpecialComment"] = { fg = c.doc_comment }
          end
        end,
      }
    end,
  },
  {
    dir = require("util").dev "deparr/scuffed-sonokai",
    opts = { better_diff_colors = true, match_paren_color = "purple", high_contrast_win_separator = true },
  },
  { "killitar/obscure.nvim", opts = { styles = { keywords = { italic = false } } } },
  { "sainnhe/sonokai" },
  { "ribru17/bamboo.nvim" },
  { "oskarnurm/koda.nvim" },
  { "e-q/okcolors.nvim" },
  {
    "webhooked/kanso.nvim",
    opts = {
      keywordStyle = { italic = false },
      overrides = function(c)
        return {
          WinSeparator = { fg = c.theme.syn.comment },
          StatusLine = { fg = c.theme.ui.fg_dim, bg = c.theme.ui.bg_p1 },
        }
      end,
      foreground = {
        light = "saturated",
      },
    },
  },
  { "projekt0n/github-nvim-theme" },
  { "verf/deepwhite.nvim" },
  { "Mofiqul/adwaita.nvim" },
}
