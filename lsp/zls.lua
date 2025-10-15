return {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "build.zig", "build.zig.zon", "zls.json" },
  settings = {
    zls = {
      semantic_tokens = "none",
      enable_argument_placeholders = false,
    }
  }
}
