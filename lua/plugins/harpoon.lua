return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependecies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }

    local nav_opts = { ui_nav_wrap = true }

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "harpoonadd" })
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), {
        ui_width_ratio = 0.40,
        title_pos = "center",
        border = "rounded",
      })
    end, { desc = "harpoon menu" })

    local prev = function()
      harpoon:list():prev(nav_opts)
    end
    local next = function()
      harpoon:list():next(nav_opts)
    end
    vim.keymap.set("n", "<C-P>", prev, { desc = "harpoon prev" })
    vim.keymap.set("n", "<C-N>", next, { desc = "harpoon next" })
    vim.keymap.set("n", "<C-K>", prev, { desc = "harpoon prev" })
    vim.keymap.set("n", "<C-J>", next, { desc = "harpoon next" })
    vim.keymap.set("n", "[w", prev, { desc = "harpoon prev" })
    vim.keymap.set("n", "]w", next, { desc = "harpoon prev" })
  end,
}
