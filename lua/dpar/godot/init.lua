local M = {}

M.config = {
  godot_bin = require("util").is_windows and "godot_console" or "godot",
  set_keymaps = true,
  auto_connect = true,
  godot_addr = "127.0.0.1:6004",
}
M.config = vim.tbl_deep_extend("force", M.config, opts or {})

-- sets up the :Godot command
require "dpar.godot.editor"
if M.config.auto_connect then
  require "dpar.godot.connect" { args = { M.config.godot_addr } } -- this sucks
end

if M.config.set_keymaps and not vim.g.gdkeymaps then
  if not vim.g.gdkeymaps then
    vim.keymap.set("n", "<A-o>", function() require("dpar.godot.run").toggle_console() end, { desc = "toggle godot console" })
    vim.keymap.set("n", "<f5>", "<cmd>Godot main<cr>", { desc = "GD: run main" })
    vim.keymap.set("n", "<f6>", "<cmd>Godot! scene<cr>", { desc = "GD: run last scene" })
    vim.keymap.set("n", "<f7>", "<cmd>Godot scene<cr>", { desc = "GD: pick and/or run a scene" })
  end
  vim.g.gdkeymaps = true
end

return M
