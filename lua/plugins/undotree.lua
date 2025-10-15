return {
  {
    "mbbill/undotree",
    lazy = true,
    enabled = not require("util").is_windows,
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>" },
    },
  },
}
