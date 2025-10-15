return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        python = { "ruff_fix", "ruff_format" },
        zig = { "zigfmt" }
      },
    },
  },
}
