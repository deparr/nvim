local M = {}

local config = require("dpar.godot").config
local log = require("util").log

local api = vim.api
local bufnr = -1
local winnr = -1

local main_scene = nil
local last_scene = nil

local extract_main_uid = require("util").extractor('run/main_scene.*=.*%"(uid://.*)%"')

function M.main(ctx)
  if not main_scene then
    local project_file = vim.fs.joinpath(vim.fn.getcwd(), "project.godot")
    main_scene = extract_main_uid(project_file)
    if not main_scene then
      log.error "Unable to find main scene"
      return
    end
  end
  ctx.args = { main_scene }
  M.scene(ctx)
end

function M.last(ctx)
  if not last_scene then
    if #ctx.args < 1 then
      log.error "No last scene to run!"
      return
    end
    last_scene = ctx.args[1]
  end
  ctx.args = { last_scene }
  M.scene(ctx)
end

function M.scene(ctx)
  -- clean up our old buffer and win
  if api.nvim_buf_is_valid(bufnr) then
    api.nvim_buf_delete(bufnr, { force = true })
  end
  bufnr = api.nvim_create_buf(true, false)

  if not api.nvim_win_is_valid(winnr) then
    vim.cmd "bot split"
    winnr = api.nvim_get_current_win()
    api.nvim_win_set_height(winnr, 20)
  else
    api.nvim_set_current_win(winnr)
  end
  api.nvim_win_set_buf(winnr, bufnr)

  if ctx.args[1] ~= main_scene then
    last_scene = ctx.args[1]
  end

  vim.bo.filetype = "godot-console"
  api.nvim_set_option_value("scrolloff", 999, { win = winnr, scope = "local" })
  -- vim.fn.termopen { "godot_console", "--scene", ctx.args[1] } -- deprecated
  vim.fn.jobstart({ config.godot_bin, "--scene", ctx.args[1] }, { term = true })
  vim.cmd "startinsert"
end

function M.toggle_console()
  if not api.nvim_buf_is_valid(bufnr) then
    log.warn("bufnr %d is invalid", bufnr)
    return
  end

  if api.nvim_win_is_valid(winnr) then
    api.nvim_win_close(winnr, false)
  else
    vim.cmd "bot split"
    winnr = api.nvim_get_current_win()
    api.nvim_win_set_height(winnr, 20)
    api.nvim_win_set_buf(winnr, bufnr)
  end
end

return M
