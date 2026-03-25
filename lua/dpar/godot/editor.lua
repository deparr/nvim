local log = require("util").log

local function parse(args)
  local split = vim.split(vim.trim(args), "%s+")
  -- for completions
  if vim.startswith(args, "Godot") then
    table.remove(split, 1)
  end
  if args:sub(-1) == " " then
    split[#split + 1] = ""
  end
  return table.remove(split, 1) or "", split
end

local commands = {
  connect = {
    fn = function(ctx)
      require "dpar.godot.connect"(ctx)
    end,
    nargs = 0,
    complete = nil,
  },
  edit = {
    fn = function(ctx)
      require "dpar.godot.edit"(ctx)
    end,
    nargs = 1,
    complete = nil,
  },
  main = {
    fn = function(ctx)
      require("dpar.godot.run").main(ctx)
    end,
    nargs = 0,
    complete = nil,
  },
  scene = {
    fn = function(ctx)
      if #ctx.args < 1 and not ctx.bang then
        require "dpar.godot.telescope"(nil, function(uid)
          ctx.args = { uid }
          require("dpar.godot.run").scene(ctx)
        end)
        return
      end
      if ctx.bang then
        require("dpar.godot.run").last(ctx)
      else
        require("dpar.godot.run").scene(ctx)
      end
    end,
    nargs = 0,
    complete = nil,
  },
}

local function run_command(ctx)
  local cmd = commands[ctx.cmd]
  if cmd == nil then
    log.error("Godot: command '%s' does not exist", ctx.cmd)
    return
  end
  if #ctx.args < cmd.nargs then
    log.error("Godot(%s): expected at least %d args, got %d", ctx.cmd, cmd.nargs, #ctx.args)
    return
  end
  cmd.fn(ctx)
end

vim.api.nvim_create_user_command("Godot", function(ctx)
  local cmd, args = parse(ctx.args)
  local sub_ctx = {
    cmd = cmd,
    args = args,
    bang = ctx.bang,
  }
  run_command(sub_ctx)
end, {
  nargs = "+",
  bang = true,
  complete = function(_, line)
    local cmd, args = parse(line)
    if #args > 0 then
      local cmd_info = commands[cmd]
      return cmd_info.complete and cmd_info.complete(args) or {}
    end

    return vim
      .iter(vim.tbl_keys(commands))
      :filter(function(x)
        return vim.startswith(x, cmd)
      end)
      :totable()
  end,
})
