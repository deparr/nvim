return {
  {
    -- "deparr/godot-tools.nvim",
    dir = require("util").dev "deparr/godot-tools.nvim",
    config = function()
      local godot = require "godot-tools"
      local util = require "util"
      local bin = util.gd_proj_is_mono and "godot-mono" or "godot"
      -- if util.is_windows then
      --   bin = bin .. "_console"
      -- end
      godot.setup {
        godot_bin = bin,
        editor = {
          auto_connect = util.in_gdproj
        },
      }

      vim.keymap.set("n", "<A-o>", function()
        require("godot-tools.run").toggle_console()
      end, { desc = "toggle godot console" })
      vim.keymap.set("n", "<f5>", "<cmd>Godot main<cr>", { desc = "GD: run main" })
      vim.keymap.set("n", "<f6>", "<cmd>Godot! run<cr>", { desc = "GD: run last scene" })
      vim.keymap.set("n", "<f7>", "<cmd>Godot run<cr>", { desc = "GD: pick and run a scene" })
      vim.keymap.set("n", "<leader>ps", "<cmd>Godot preview<cr>", { desc = "GD: preview current scene" })
    end,
  },
}
