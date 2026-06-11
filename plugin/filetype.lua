vim.filetype.add({
  extension = {
    djot = "djot",
    dj = "djot",
    import = "dosini", -- godot import
    gdshaderinc = "gdshader",
    fs = "glsl",
    compute = "glsl",
    comp = "glsl",
    vs = "glsl",
  },
  filename = {
    ["project.godot"] = "dosini",
    blogroll = "badrss",
  }
})
