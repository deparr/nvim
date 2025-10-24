-- highlight-groups group-name -> syntax.txt
return {
  {
    "deparr/tairiki.nvim",
    lazy = false,
    -- dir = require("util").dev "deparr/tairiki.nvim",
    -- config = function()end,
    -- priority = 1000,
    -- config = false,
    config = function()
      require("tairiki.palette").register("gruvbuddy", require "palettes.gruvbuddy")
      require("tairiki.palette").register("gruvbox", require "palettes.gruvbox")
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

          hl["@operator.gleam"] = { fg = c.light_purple and c.light_purple or c.purple }

          hl["@variable.powershell"] = { fg = c.syn.constant }
          hl["@operator.powershell"] = { fg = c.yellow }

          -- consider upstream
          hl["@lsp.type.variable"] = {}
        end,
      }
    end,
  },
  -- { "chriskempson/vim-tomorrow-theme" },
  {
    "sainnhe/sonokai",
    config = function() -- if you actually use this, rewrite as a real theme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "sonokai",
        callback = function(ev)
          vim.o.termguicolors = false
          vim.api.nvim_set_hl(0, "VertSplit", { ctermfg = 240 })
          vim.api.nvim_set_hl(0, "MatchParen", { ctermfg = 176, ctermbg = 237, bold = true })
        end,
      })
    end,
  },
  { "ribru17/bamboo.nvim" },
  -- { "rebelot/kanagawa.nvim"},
  { "folke/tokyonight.nvim" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  { "Verf/deepwhite.nvim" },
  { "yorickpeterse/vim-paper" },
  { "yorickpeterse/nvim-grey" },
}
