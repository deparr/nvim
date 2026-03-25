local log = require("util").log
return function(ctx)
  local remote_addr = ctx.args[1] or "127.0.0.1:6004"
  local connected_servers = vim.fn.serverlist()
  if vim.list_contains(connected_servers, remtoe_addr) then
    log.info("Godot: already connected to %s!", remote_addr)
    return
  end
  local actual_addr = vim.fn.serverstart(remote_addr)
  if actual_addr then
    log.info("Godot: connected to %s", actual_addr)
  end
end
