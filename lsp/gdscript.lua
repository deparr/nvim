-- local cmd = is_windows and { "ncat", "127.0.0.1", "6005" } or vim.lsp.rpc.connect("127.0.0.1", 6005)

return {
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
  filetypes = { "gd", "gdscript", "gdscript3" },
  root_markers = { "project.godot" },
}
