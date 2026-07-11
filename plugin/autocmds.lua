vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.hl.hl_op { higroup = "IncSearch", timeout = 30 }
  end,
})

local afgroup = vim.api.nvim_create_augroup("autoformatopts", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
  callback = function()
    -- #39849 lua option handling was cleaned up but now doesnt support chained infix ops
    vim.opt.formatoptions = vim.opt.formatoptions - "a"
    vim.opt.formatoptions = vim.opt.formatoptions - "t"
    vim.opt.formatoptions = vim.opt.formatoptions + "c"
    vim.opt.formatoptions = vim.opt.formatoptions + "q"
    vim.opt.formatoptions = vim.opt.formatoptions - "o"
    vim.opt.formatoptions = vim.opt.formatoptions + "r"
    vim.opt.formatoptions = vim.opt.formatoptions + "n"
    vim.opt.formatoptions = vim.opt.formatoptions + "j"
    vim.opt.formatoptions = vim.opt.formatoptions - "2"
  end,
  group = afgroup,
})

local text = vim.api.nvim_create_augroup("text", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown", "mail", "djot" },
  group = text,
  command = "setlocal spell textwidth=72",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  group = text,
  command = "setlocal spell textwidth=50"
})
