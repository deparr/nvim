-- Misc settings to be shared across plugins
local M = {}

M.is_windows = vim.uv.os_uname().sysname:match ".*[wW]indows.*" ~= nil
M.dev_dir = M.is_windows and "V:\\Code" or "~/dev"
M.in_gdproj = vim.fs.root(0, function(n, _)
  return n == "project.godot" or n == ".godot"
end) ~= nil

M.proj_dirs = M.is_windows and { "V:/Code" } or { "~/dev", "~/build" } -- hmm, duped

function M.dev(path)
  local si = path:find "/"
  if si then
    path = path:sub(si)
  end
  return vim.fs.joinpath(M.dev_dir, path)
end

function M.dump_highlight_groups(path, cterm_pass_through)
  if not path or #path == 0 then
    print "hl_dump: must give out path"
    return
  end
  cterm_pass_through = not not cterm_pass_through
  local highlight_groups = vim.api.nvim_get_hl(0, {})
  local results = {}
  local xc = require("util.xterm_colors").hex

  for name, def in pairs(highlight_groups) do
    local fg = def.fg and string.format("#%06x", def.fg) or "none"
    local bg = def.bg and string.format("#%06x", def.bg) or "none"
    local sp = def.sp and string.format("#%06x", def.sp) or "none"
    local ctermfg = def.ctermfg and string.format("ctermfg=%d", def.ctermfg) or ""
    local ctermbg = def.ctermbg and string.format("ctermbg=%d", def.ctermbg) or ""
    local res
    if def.link then
      res = string.format("%s -> %s", name, def.link)
    else
      if cterm_pass_through and (def.ctermfg or ctermbg) then
        res = string.format(
          "%s: fg=%s, bg=%s, sp=%s",
          name,
          def.ctermfg and xc[def.ctermfg + 1] or "none",
          def.ctermbg and xc[def.ctermbg + 1] or "none",
          sp
        )
      else
        res = string.format("%s: fg=%s, bg=%s, sp=%s %s %s", name, fg, bg, sp, ctermfg, ctermbg)
      end
    end
    table.insert(results, res)
  end

  local file = io.open(path, "w")
  if not file then
    print(("hl_dump: unable to open '%s'"):format(path))
    return
  end
  for _, result in ipairs(results) do
    file:write(result, "\n")
  end
  file:close()
  print(("hl_dump: current highlight groups saved to '%s'"):format(path))
end

return M
