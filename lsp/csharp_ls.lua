return {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ "csharp-ls" }, dispatchers, {
      cwd = config.cmd_cwd or config.root_dir,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  root_markers = {
    "*.sln",
    "*.slnx",
    "*.csproj",
  },
  filetypes = { "cs" },
  init_options = {
    AutomaticWorkspaceInit = true,
  },
  get_language_id = function(_, ft)
    if ft == "cs" then
      return "csharp"
    end
    return ft
  end,
}
