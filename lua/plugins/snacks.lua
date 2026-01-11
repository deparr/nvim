return {
  "folke/snacks.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    vim.api.nvim_set_hl(0, "SnacksPicker", { link = "TelescopeNormal" })
    vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "TelescopeBorder" })
    vim.api.nvim_set_hl(0, "SnacksPickerTitle", { link = "TelescopeTitle" })
    require("snacks").setup {
      image = {
        enabled = true,
      },
      picker = {
        prompt = "> ",
        layout = { preset = "telescope" },
        icons = {
          files = { enabled = false },
          git = { enabled = false }, -- this just doesn't work for git_log
        },
      },
    }
  end,
}
