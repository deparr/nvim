return {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {
            "E203", -- whitespace around :
            "E302", -- two blank lines inbetween func/blocks
            "E303", -- too many blank lines
          },
          maxLineLength = 120,
        },
      },
    },
  },
}
