return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        -- for godot
        local m = name:match "%.uid$"
        return m ~= nil
      end,
    },
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
    columns = {},
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = { "actions.open_external", mode = "n" },
    },
    use_default_keymaps = false,
  },
}
