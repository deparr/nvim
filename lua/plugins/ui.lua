return {
  {
    "crispgm/nvim-tabline",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        override_vim_notify = true,
        window = {
          relative = "editor",
        }
      }
    },
  },
  -- heirline config stolen and slightly modified from github/stevearc
  {
    enabled = false,
    "rebelot/heirline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local comp = require "heirline_components"
      local utils = require "heirline.utils"

      vim.o.showmode = false

      require("heirline").load_colors(comp.setup_colors())
      local aug = vim.api.nvim_create_augroup("Heirline", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        desc = "Update Heirline colors",
        group = aug,
        callback = function()
          local colors = comp.setup_colors()
          utils.on_colorscheme(colors)
        end,
      })

      require("heirline").setup {
        statusline = utils.insert(
          {
            static = comp.stl_static,
            hl = { bg = "bg" },
          },
          comp.ViMode,
          comp.lpad(comp.VCBranch),
          comp.lpad(comp.LSPActive),
          comp.lpad(comp.Diagnostics),
          require("statusline").left_components,
          comp.lpad(comp.FullFileName),
          { provider = "%=" },
          require("statusline").right_components,
          comp.rpad(comp.Jolt),
          comp.rpad(comp.FileType),
          comp.Ruler
        ),
      }

      vim.api.nvim_create_user_command("HeirlineResetStatusline", function()
        vim.o.statusline = "%{%v:lua.require'heirline'.eval_statusline()%}"
      end, {})
    end,
  },
}
