vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require("vim._extui").enable { enable = true }
-- extui sets cursor blink always
vim.cmd.set "guicursor=n:block,i-ci-ve:block-blinkon500-blinkoff500"

require("lazy").setup("plugins", {
  defaults = { lazy = false },
  change_detection = { enabled = true, notify = false },
  install = {
    colorscheme = { "alacritty", "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tutor",
        "netrwPlugin",
        "tarPlugin",
        "zipPlugin",
        require("util").is_windows and "man" or nil,
      },
    },
  },
})

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.0
  vim.g.neovide_scroll_animation_length = 0.0
  vim.g.neovide_hide_mouse_when_typing = true

  -- vim.o.guifont = "Greybeard 18px,Symbols Nerd Font,Segoe UI Emoji:h14:#e-alias"
  vim.o.guifont = "Maple Mono Baked,Symbols Nerd Font,Segoe UI Emoji:h11"

  local toggle = "<cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<cr>"
  vim.keymap.set("n", "<m-cr>", toggle, { desc = "toggle fullscreen" })
  vim.keymap.set("n", "<f11>", toggle, { desc = "toggle fullscreen" })
  vim.keymap.set({ "n", "x" }, "<c-s-v>", '"+p', { desc = "paste clipboard" })
  vim.keymap.set(
    "n",
    "<c-=>",
    "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<cr>",
    { desc = "zoom in" }
  )
  vim.keymap.set(
    "n",
    "<c-->",
    "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<cr>",
    { desc = "zoom out" }
  )
  vim.keymap.set("n", "<c-0>", "<cmd>lua vim.g.neovide_scale_factor = 1.0<cr>", { desc = "reset zoom" })
  if vim.fn.getcwd() == "V:\\.local\\bin" or vim.fn.getcwd() == "C:\\Program Files\\Neovide" then
    vim.cmd.cd "V:/dev"
  end

  -- this does recursive loading
  -- require("util").set_term_colors(require("palettes.alacritty").terminal)
end

--[[
vim.keymap.set("n", "<leader>r", function()
  package.loaded["palettes.alacritty"] = nil
  vim.cmd "Lazy reload tairiki.nvim"
  require("tairiki.dump").colors_file("alacritty", { palette = "alacritty" })
end)
--]]

-- require("tairiki").load()
vim.cmd.colorscheme "alacritty"
-- vim.cmd.colorscheme "notebook"
vim.o.winborder = vim.o.background == "light" and "rounded" or "none"
if require("util").in_gdproj then
  require "dpar.godot"
  require "dpar.godot/editor"
end
