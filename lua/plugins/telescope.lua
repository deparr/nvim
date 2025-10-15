return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- { "natecraddock/telescope-zf-native.nvim" },
    },
    config = function()
      local ts = require "telescope"
      ts.setup {
        -- windows eats <C-Space>
        pickers = require("util").is_windows and {
          live_grep = { mappings = { i = { ["<C-BSlash>"] = "to_fuzzy_refine" } } },
        } or nil,
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          -- ["zf-native"] = {
          --   file = {
          --     match_filename = false,
          --   }
          -- }
        },
      }
      ts.load_extension "fzf"
      -- ts.load_extension "zf-native"
    end,
    keys = function()
      local builtin = require "telescope.builtin"
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"
      local harpoon = require "harpoon"

      local lookup_ctx = function(name)
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          local buf = vim.fn.getbufinfo(bufnr)[1]
          if buf and buf.loaded and buf.name:find(name, -#name, true) then
            if #buf.windows > 0 then
              local wininfo = vim.fn.getcursorcharpos(buf.windows[1])
              return { row = wininfo[2], col = wininfo[3] }
            end
            break
          end
        end
        return nil
      end

      local harpoon_add = function(pbufnr, map)
        map({ "i", "n" }, "<C-h>", function()
          local picker = action_state.get_current_picker(pbufnr)
          actions.close(pbufnr)
          local sel = picker:get_selection()
          local context = lookup_ctx(sel[1]) or { row = 1, col = 1 }
          local item = { value = sel[1], context = context }
          harpoon:list():add(item)
        end)

        map({ "i", "n" }, "<M-h>", function()
          local picker = action_state.get_current_picker(pbufnr)
          actions.close(pbufnr)
          local multi_sel = picker:get_multi_selection()
          for _, file in ipairs(multi_sel) do
            local context = lookup_ctx(file[1]) or { row = 1, col = 1 }
            local item = { value = file[1], context = context }
            harpoon:list():add(item)
          end
        end)

        return true
      end

      local util = require "util"
      local ff = util.in_gdproj
          and function()
            builtin.fd {
              find_command = {
                "fd",
                "--type",
                "f",
                "--color",
                "never",
                "-E",
                "{addons,aseprite,assets}*",
                "-E",
                "*.uid",
                "-E",
                "*.import",
              },
              attach_mappings = harpoon_add,
            }
          end
        or function()
          builtin.find_files { attach_mappings = harpoon_add }
        end

      local fl = util.in_gdproj
          and function()
            builtin.live_grep {
              glob_pattern = { "!addons*", "!aseprite*", "!assets*", "!*.uid", "!*.import" },
            }
          end
        or builtin.live_grep

      local maybe_project_finder = nil
      if vim.g.neovide then
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values

        local theme = require("telescope.themes").get_dropdown { layout_config = { height = 25 } }

        local project_picker = function(opts)
          opts = opts or {}
          pickers
            .new(opts, {
              prompt_title = "Switch Project",
              finder = finders.new_oneshot_job(
                { "fd", "-d", "1", "-t", "d", "-c", "never", "-a", ".", unpack(util.proj_dirs) },
                {}
              ),
              sorter = conf.file_sorter(opts),
              attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  if vim.cmd.Oil then vim.cmd.Oil(selection[1]) end
                  vim.cmd.cd(selection[1])
                  vim.cmd "silent! wincmd o"
                end)
                return true
              end,
            })
            :find()
        end

        maybe_project_finder = {
          "<leader>fp",
          function()
            project_picker(theme)
          end,
        }
      end

      return {
        { "<leader>fr", builtin.resume },
        { "<leader>ff", ff },
        { "<leader>fg", builtin.git_files },
        { "<leader>fl", fl },
        { "<leader>fd", builtin.diagnostics },
        { "<leader>fh", builtin.help_tags },
        { "<leader>fk", builtin.keymaps },
        {
          "<leader>fc",
          function()
            builtin.find_files { cwd = vim.fn.stdpath "config" }
          end,
        },
        {
          "<leader>fs",
          function()
            builtin.grep_string { search = vim.fn.input "grep > " }
          end,
        },
        maybe_project_finder,
      }
    end,
  },
}
