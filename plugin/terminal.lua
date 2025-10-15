vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("deparr.TermOpen", {}),
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.scrolloff = 0
  end,
})

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<S-Space>", "<Space>")
vim.keymap.set("t", "<C-Space>", "<Space>")

vim.keymap.set("n", "<leader>tt", "<cmd>tabnew | term<cr>")
vim.keymap.set("n", "<leader>ts", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
