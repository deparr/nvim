return {
  {
    "mbbill/undotree",
    lazy = true,
    config = function()
      if vim.g.is_windows then
        vim.g.undotree_DiffCommand = "C:\\Program Files\\Git\\usr\\bin\\diff.exe"
      end
    end,
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>" },
    },
  },
}
