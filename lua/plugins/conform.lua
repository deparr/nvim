return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        python = { "ruff_fix", "ruff_format" },
        zig = { "zigfmt" },
        gdscript = { "gdfmt" },
      },
      lsp_format = "fallback",
      formatters = {
        gdfmt = {
          command = "gdfmt",
          args = { },
          stdin = true,
          -- cwd = require("conform.utils").root_file({ "project.godot" }),
          require_cwd = false,
        }
      }
    },
  },
}
