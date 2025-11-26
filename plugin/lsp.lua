vim.lsp.enable({
  "lua_ls",
  "gdscript",
  "gopls",
  -- "vtsls",
  "tsgo",
  "zls",
  -- "rust-analyzer",
})

local disable_semantic_tokens = {
  lua = true,
  zig = true, -- set in zls.json OR lsp/zls.lua
  -- rust = true,
  python = true, -- todo there should be a way to do this in pyright settings
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "invalid lsp client")

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help)
    vim.keymap.set("n", "K", vim.lsp.buf.hover) -- set by default
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition)
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float) -- def is C-W [C-]d
    vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>lf", function()
      require("conform").format { lsp_fallback = true }
    end)

    local ft = vim.bo[bufnr].filetype
    if disable_semantic_tokens[ft] then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.diagnostic.config {
  float = {
    source = "if_many",
    show_header = false,
    severity_sort = true,
  },
  virtual_text = false,
  -- virtual_text = {
  --   enabled = false,
  --   severity = { min = vim.diagnostic.severity.WARN },
  --   source = "if_many",
  -- },
  virtual_lines = false,
  severity_sort = true,
  signs = {
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
    },
  },
}

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump { float = true, count = 1, severity = { min = vim.diagnostic.severity.WARN } }
end)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump { float = true, count = -1, severity = { min = vim.diagnostic.severity.WARN } }
end)

vim.keymap.set("", "<leader>ll", function()
  local config = vim.diagnostic.config() or {}
  if config.virtual_text then
    vim.diagnostic.config { virtual_text = false }
  else
    vim.diagnostic.config { virtual_text = true }
  end
end, { desc = "toggle lsp_virtual_text" })
