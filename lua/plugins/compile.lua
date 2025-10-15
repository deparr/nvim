return {
  { "m00qek/baleia.nvim", lazy = true },
  {
    "ej-shafran/compile-mode.nvim",
    enabled = false,
    version = "^5.0.0",
    dependencies = { "nvim-lua/plenary.nvim", "m00qek/baleia.nvim" },
    config = function()
      vim.g.compile_mode = {
        baleia_setup = true,
      }

      vim.keymap.set("n", "<leader>c", function()
        vim.cmd "below Compile"
      end)
    end,
  },
}
