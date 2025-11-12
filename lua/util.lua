-- Misc settings to be shared across plugins
local M = {}

M.is_windows = vim.uv.os_uname().sysname:match ".*[wW]indows.*" ~= nil
vim.g.is_windows = M.is_windows
M.dev_dir = vim.env.DEV_ROOT and vim.env.DEV_ROOT or (M.is_windows and "V:\\dev" or "~/dev")
M.plug_dir = M.dev_dir .. "/deparr"
M.in_gdproj = vim.fs.root(0, function(n, _)
  return n == "project.godot" or n == ".godot"
end) ~= nil

-- default to windows paths since this should only get used in neovide
M.proj_dirs = { vim.env.DEV_ROOT or "v:\\dev" }

function M.dev(path)
  local si = path:find "/"
  if si then
    path = path:sub(si)
  end
  return vim.fs.joinpath(M.plug_dir, path)
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

function M.is_loaded(k)
  return vim.tbl_filter(function(key)
    return key:match((".*%s.*"):format(k))
  end, vim.tbl_keys(package.loaded))
end
vim.g.is_loaded = M.is_loaded

function M.set_term_colors(c)
  vim.g.terminal_color_0 = c.black
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.purple
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.white
  vim.g.terminal_color_8 = c.bright_black
  vim.g.terminal_color_9 = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_purple
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white
end

return M
