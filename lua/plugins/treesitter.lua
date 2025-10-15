return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    dependencies = {
      -- { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    build = ":TSUpdate",
    config = function()
      -- all of these options aren't implemented yet on main
      -- require("nvim-treesitter.config").setup {
      --   ensure_installed = {
      --     "vimdoc",
      --     "lua",
      --     "vim",
      --     "bash",
      --     "c",
      --     "go",
      --     "javascript",
      --     "zig",
      --     "gdscript",
      --     "python",
      --   },
      --   highlight = {
      --     enable = true,
      --     disable = { "rust" },
      --   },
      --   textobjects = {
      --     select = {
      --       enable = true,
      --       lookahead = true,
      --       keymaps = {
      --         ["af"] = "@function.outer",
      --         ["if"] = "@function.inner",
      --         ["ai"] = "@conditional.outer",
      --         ["ii"] = "@conditional.inner",
      --         ["ab"] = "@block.outer",
      --         ["ib"] = "@block.inner",
      --         ["aa"] = "@parameter.outer",
      --         ["ia"] = "@parameter.inner",
      --       },
      --       include_surrounding_whitespace = false,
      --     },
      --   },
      -- }
      -- if require("util").is_windows then
      --   require("nvim-treesitter.install").compilers = { "zig", "gcc" }
      -- end
      --
      -- require("nvim-treesitter.install").prefer_git = false

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*" },
        callback = function(ev)
          if
            vim.list_contains(require("nvim-treesitter").get_installed(), ev.match)
            or ev.match == "typescriptreact"
          then
            vim.treesitter.start()
          end
        end,
      })
    end,
  },
}
