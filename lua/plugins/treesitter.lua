return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    opts = {
      select = {
        lookahead = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    dependencies = {},
    build = ":TSUpdate",
    config = function()
      -- stylua: ignore
      local ensure_installed = {
        "go", "zig", "typescript", "tsx", "javascript", "markdown",
        "markdown_inline", "gdscript", "gdshader", "hlsl", "glsl",
        "python", "djot", "gomod", "gosum", "lua", "vimdoc",
      }
      require("nvim-treesitter").install(ensure_installed)

      local function textobj_map(key, query)
        local qbase = "@" .. query
        local outer = qbase .. ".outer"
        local inner = qbase .. ".inner"
        local opts = {
          desc = "TexObj select for @" .. query,
          silent = true,
        }
        vim.keymap.set({ "x", "o" }, "i" .. key, function()
          require("nvim-treesitter-textobjects.select").select_textobject(inner)
        end, opts)
        vim.keymap.set({ "x", "o" }, "a" .. key, function()
          require("nvim-treesitter-textobjects.select").select_textobject(outer)
        end, opts)
      end

      textobj_map("f", "function")
      textobj_map("F", "call")
      textobj_map("c", "conditional")
      textobj_map("L", "loop")
      textobj_map("a", "parameter")
      textobj_map("r", "return")

      local installed_fts = vim.iter(ensure_installed):map(vim.treesitter.language.get_filetypes):flatten():totable()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = installed_fts,
        callback = function(ev)
          vim.treesitter.start(ev.buf)
        end,
      })
    end,
  },
}
