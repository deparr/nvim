local M = {}

local api = vim.api

local bufnr = -1
local winnr = -1
local tabpage = -1
local job = nil
local came_from_win = -1

local handle_exit = vim.schedule_wrap(function(ctx)
  if ctx.code ~= 0 then
    vim.notify("godot didn't exit with 0 status", vim.log.levels.ERROR)
    return
  end

  if api.nvim_win_is_valid(came_from_win) then
    api.nvim_set_current_win(came_from_win)
  end
end)

api.nvim_create_user_command("GodotRun", function(ctx)
  vim.notify "Running main scene..."
  local ok, baleia_mod = pcall(require, "baleia")
  if not ok then
    vim.notify("unable to require baleia", vim.log.levels.ERROR)
    return
  end
  local baleia = baleia_mod.setup {}
  came_from_win = api.nvim_get_current_win()
  local newtab_bufnr = nil
  if not api.nvim_win_is_valid(winnr) then
    vim.cmd "tabnew"
    winnr = api.nvim_get_current_win()
    newtab_bufnr = api.nvim_get_current_buf()
  else
    api.nvim_set_current_win(winnr)
  end

  if not api.nvim_buf_is_valid(bufnr) then
    bufnr = api.nvim_create_buf(false, true)
    api.nvim_buf_set_name(bufnr, "Godot Console")
  else
    api.nvim_buf_set_lines(bufnr, 0, -1, false, {})
  end

  api.nvim_win_set_buf(winnr, bufnr)
  api.nvim_buf_set_lines(bufnr, 0, -1, false, {})

  if newtab_bufnr ~= nil then
    api.nvim_buf_delete(newtab_bufnr, { force = true })
  end

  baleia.automatically(bufnr)
  local on_stdout = vim.schedule_wrap(function(err, data)
    if err then
      vim.notify("godot run: " .. err, vim.log.levels.ERROR)
      return
    end
    if data and #data > 0 then
      data = vim.trim(data)
      data = data:gsub("\r\n", "\n")
      local split_data = vim.split(data, "\n")
      api.nvim_buf_set_lines(bufnr, -2, -2, false, split_data)
    end
  end)
  job = vim.system({ "godot_console", "." }, {
    text = true,
    stdout = on_stdout,
    stderr = on_stdout,
  }, handle_exit)
end, {})

api.nvim_create_user_command("GodotStop", function(ctx)
  if job == nil then
    return
  end
  job:kill(15)
end, {})

function M.reload()
  package.loaded["dpar.godot"] = nil
  api.nvim_del_user_command "GodotRun"
  api.nvim_del_user_command "GodotStop"
  require "dpar.godot"
  vim.notify "reloaded godot"
end

if not vim.g.gdkeymaps then
  vim.keymap.set("n", "<leader>r", M.reload)
  vim.keymap.set("n", "<f5>", "<cmd>GodotRun<cr>")
end
vim.g.gdkeymaps = true

return M

-- api.nvim_create_user_command("GodotScene", function(ev)
--   print "running godot..."
--   local pickers = require "telescope.pickers"
--   local finders = require "telescope.finders"
--   local conf = require("telescope.config").values
--   local actions = require "telescope.actions"
--   local action_state = require "telescope.actions.state"
--
--   local theme = require("telescope.themes").get_dropdown { layout_config = { height = 25 } }
--   local scene_to_run = ""
--   local scene_picker = function(opts)
--     opts = opts or {}
--     pickers
--       .new(opts, {
--         prompt_title = "Run scene",
--         finder = finders.new_oneshot_job({ "fd", "-t", "f", "-c", "never", "-e", "tscn", "." }, {}),
--         sorter = conf.file_sorter(opts),
--         attach_mappings = function(pbufnr, _)
--           actions.select_default:replace(function()
--             actions.close(pbufnr)
--             local selection = action_state.get_selected_entry()
--             scene_to_run = selection[1]
--             local baleia = require("baleia").setup {}
--             if bufnr == nil then
--               bufnr = api.nvim_create_buf(false, false)
--             end
--             if winnr == nil then
--               winnr = api.nvim_open_win(bufnr, false, { split = "right" })
--             end
--             baleia.automatically(bufnr)
--             local job = vim.system({ "godot_console", "--scene", "res://" .. scene_to_run }, {
--               text = true,
--               stdout = function(err, data)
--                 if err then
--                   vim.schedule(function()
--                     vim.notify("godot run: " .. err, vim.log.levels.ERROR)
--                   end)
--                   return
--                 end
--
--                 if data and #data > 0 then
--                   vim.schedule(function()
--                     api.nvim_buf_set_lines(bufnr, -2, -2, false, { vim.trim(data) })
--                   end)
--                 end
--               end,
--             }, function(eva)
--               if eva.code ~= 0 then
--                 vim.schedule(function()
--                   vim.notify("godot didn't exit with 0 status", vim.log.levels.ERROR)
--                 end)
--                 return
--               end
--             end)
--           end)
--           return true
--         end,
--       })
--       :find()
--   end
--   scene_picker(theme)
-- end, {})
