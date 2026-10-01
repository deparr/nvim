vim.filetype.add({
  extension = {
    djot = "djot",
    dj = "djot",
    import = "gdresource", -- godot import
    gdshaderinc = "gdshader",
    fs = "glsl",
    compute = "glsl",
    vs = "glsl",
  },
  filename = {
    ["project.godot"] = "gdresource",
    blogroll = "badrss",
  }
})
