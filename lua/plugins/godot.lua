return {
  {
    -- "deparr/godot-tools.nvim",
    dir = require("util").dev "deparr/godot-tools.nvim",
    config = function()
      local godot = require "godot-tools"
      godot.setup {
        auto_connect = require("util").in_gdproj,
      }

      vim.keymap.set("n", "<A-o>", function()
        require("godot-tools.run").toggle_console()
      end, { desc = "toggle godot console" })
      vim.keymap.set("n", "<f5>", "<cmd>Godot main<cr>", { desc = "GD: run main" })
      vim.keymap.set("n", "<f6>", "<cmd>Godot! scene<cr>", { desc = "GD: run last scene" })
      vim.keymap.set("n", "<f7>", "<cmd>Godot scene<cr>", { desc = "GD: pick and/or run a scene" })
    end,
  },
  { "CultOfTheBlob/godot-scenetree.nvim", opts = { picker = "telescope" } },
  { "Mathijs-Bakker/godotdev.nvim", opts = {} },
}
