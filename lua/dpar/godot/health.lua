local M = {}

function M.check()
  vim.health.start("godot")
  vim.health.info("this doesn't do any real checks yet")
end

return M
