vim.g.zig_fmt_autosave = 0
local vp = vim.api.nvim_get_hl(0, { name = "@variable.parameter" })
vp.italic = nil
if vp.cterm then
  vp.cterm.italic = nil
end
vim.api.nvim_set_hl(0, "@variable.parameter.zig", vp)
