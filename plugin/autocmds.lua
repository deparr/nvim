vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 30 }
  end,
})

local afgroup = vim.api.nvim_create_augroup("autoformatopts", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2"
  end,
  group = afgroup,
})

local text = vim.api.nvim_create_augroup("text", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
  pattern = { "text", "markdown", "mail", "gitcommit", "djot" },
  group = text,
  command = "setlocal spell tw=72 colorcolumn=73",
})
