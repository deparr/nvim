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
        plugins = { auto = true },
        -- plugins = { all = true },
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
  { "jnz/studio98" },
  { "oskarnurm/koda.nvim" },
  -- { "rebelot/kanagawa.nvim"},
  -- { "nyoom-engineering/oxocarbon.nvim" },
}
