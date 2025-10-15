local set = vim.keymap.set

set("n", "<leader>pv", vim.cmd.Oil or vim.cmd.Ex)

-- easier begin/end
set("n", "H", "^")
set("n", "L", "$")

-- move lines
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in center
set("n", "J", "mzJ`z")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("v", "<leader>e", ":lua<cr>")

-- think about these
-- set("n", "<M-j>", function()
--   if vim.opt.diff:get() then
--     vim.cmd [[normal! ]c]]
--   else
--     vim.cmd [[m .+1<CR>==]]
--   end
-- end)
--
-- set("n", "<M-k>", function()
--   if vim.opt.diff:get() then
--     vim.cmd [[normal! [c]]
--   else
--     vim.cmd [[m .-2<CR>==]]
--   end
-- end)

set("x", "<leader>p", [["_dP]])

set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", [["_d]])

set("n", "<Left>", "gT")
set("n", "<Right>", "gt")

set("n", "<Down>", "<nop>")
set("n", "<Up>", "<nop>")
set("i", "<Down>", "<nop>")
set("i", "<Up>", "<nop>")
set("i", "<Left>", "<nop>")
set("i", "<Right>", "<nop>")

set("n", "Q", "<nop>")
set("n", "q:", "<nop>")

set("n", "<A-,>", "<C-W>5<")
set("n", "<A-.>", "<C-W>5>")
set("n", "<A-->", "<C-W>5-")
set("n", "<A-=>", "<C-W>5+")
-- set("n", "<C-h>", "<C-W><C-h>")
-- set("n", "<C-j>", "<C-W><C-j>")
-- set("n", "<C-k>", "<C-W><C-k>")
-- set("n", "<C-l>", "<C-W><C-l>")

-- open new file adjacent to current file
set("n", "<leader>o", ':e <C-R>=expand("%:p:h") . "/" <cr>')

set("n", "<M-l>", "<cmd>silent nohlsearch<cr>")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- set("n", "<leader>x", "<cmd>silent !chmod +x %<CR>", { silent = true })

set("n", "<leader>move", '<cmd>cd <C-R>=expand("%:h")<cr> && echo move', { desc = "cd to %:h" })

set("n", "<leader>i", "<cmd>Inspect<cr>")
set("x", "<leader>e", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", false)
  local _, rs, cs = unpack(vim.fn.getpos "'<")
  local _, re, ce = unpack(vim.fn.getpos "'>")

  rs, re, cs, ce = rs - 1, re - 1, cs - 1, ce

  local mode = vim.fn.visualmode()
  local ok, lines = pcall(function()
    local lines
    if mode == "V" then
      lines = vim.api.nvim_buf_get_lines(0, rs, re + 1, false)
      cs, ce = 0, #(lines[#lines] or "")
    else
      local last_line = vim.api.nvim_buf_get_lines(0, re, re + 1, false)[1] or ""
      local last_col = #last_line
      if ce > last_col then
        ce = last_col
      end
      lines = vim.api.nvim_buf_get_text(0, rs, cs, re, ce, {})
    end
    return lines
  end)
  if not ok then
    vim.print("failed to get lines('%s'): %s"):format(mode, lines)
    return
  end
  -- vim.print(lines)
  -- vim.print { rs, re, cs, ce }
  local expr = vim
    .iter(lines)
    :map(function(l)
      return (vim.trim(l):gsub("(%d)_(%d)", "%1%2"))
    end)
    :join(" ")

  -- vim.print(expr)

  local ok, result = pcall(vim.fn.luaeval, expr)
  if not ok then
    vim.notify("Lua eval error: " .. result, vim.log.levels.ERROR)
    return
  end

  local ok, res = pcall(vim.api.nvim_buf_set_text, 0, rs, cs, re, ce, { tostring(result) })
  if not ok then
    vim.print("failed to set text with given idxs:" .. res .. " " .. vim.inspect { rs, re, cs, ce })
  end
end, { desc = "evaluate and replace lua expr under selection" })
