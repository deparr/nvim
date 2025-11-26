return {
  cmd = { "bun", "x", "--bun", "tsgo", "--lsp", "-stdio" },

  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },

  root_markers = { "tsconfig.json", "jsconfig.json", "package.json" },
}
