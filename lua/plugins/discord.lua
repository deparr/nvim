return {
  {
    "vyfor/cord.nvim",
    enabled = false,
    event = "VeryLazy",
    build = ":Cord update",
    opts = {
      text = {
        workspace = function(opts)
          return "in " .. vim.fn.fnamemodify((vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd()), ":t")
        end,
        docs = function(opts)
          return "reading " .. opts.filename
        end,
        file_browser = "browsing files",
        terminal = "terminal",
        plugin_manager = false,
        lsp = true,
      },
    },
  },
}
