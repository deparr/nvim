local M = {}
local godot_bin = require("util").is_windows and "godot_console" or "godot"

local api = vim.api

local bufnr = -1
local winnr = -1

api.nvim_create_user_command("GodotRun", function(ctx)
  vim.notify "running main scene"
  -- clean up our old buffer
  if api.nvim_buf_is_valid(bufnr) then
    api.nvim_buf_delete(bufnr, { force = true })
  end
  bufnr = api.nvim_create_buf(true, false)

  if not api.nvim_win_is_valid(winnr) then
    vim.cmd "bot split"
    winnr = api.nvim_get_current_win()
    api.nvim_win_set_height(winnr, 20)
  else
    api.nvim_set_current_win(winnr)
  end
  api.nvim_win_set_buf(winnr, bufnr)
  vim.fn.termopen { "godot_console", "." }
  vim.bo.filetype = "godot-console"
  api.nvim_set_option_value("scrolloff", 999, { win = winnr, scope = "local" })
  vim.cmd "startinsert"
end, {})

function M.toggle_console()
  if not api.nvim_buf_is_valid(bufnr) then
    vim.notify(("bufnr %d is invalid"):format(bufnr))
    return
  end

  if api.nvim_win_is_valid(winnr) then
    api.nvim_win_close(winnr, false)
  else
    vim.cmd "bot split"
    winnr = api.nvim_get_current_win()
    api.nvim_win_set_height(winnr, 20)
    api.nvim_win_set_buf(winnr, bufnr)
  end
end

function M.reload()
  package.loaded["dpar.godot"] = nil
  api.nvim_del_user_command "GodotRun"
  -- api.nvim_del_user_command "GodotStop"
  require "dpar.godot"
  vim.notify "reloaded godot"
end

if not vim.g.gdkeymaps then
  vim.keymap.set("n", "<leader>r", M.reload)
  vim.keymap.set("n", "<A-o>", M.toggle_console, { desc = "toggle godot console" })
  vim.keymap.set("n", "<f5>", "<cmd>GodotRun<cr>")
end
vim.g.gdkeymaps = true

return M
