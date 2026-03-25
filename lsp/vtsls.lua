return {
  cmd = { "bun", "x", "--bun", "vtsls", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    "tsconfig.json", "package.json", "jsconfig.json",
  },
}
