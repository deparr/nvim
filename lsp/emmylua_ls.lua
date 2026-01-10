return {
  cmd = { "emmylua_ls" },
  filetypes = { "lua" },
  root_markers = {
    ".emmyrc.json",
    ".emmyrc.jsonc",
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
  },
  settings = {
    Lua = {
      workspace = {
        library = {
          vim.fn.expand "~/.local/share/prise/lua",
        },
      },
    },
  },
}
