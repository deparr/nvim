return {
  {
    dir = require("util").dev "deparr/jolt.nvim",
    name = "jolt",
    cmd = { "Jolt" },
    opts = {
      default_title = "David Parrott",
      blog = {
        enable = true,
        page_template =
[[```=meta
title = Blog | deparr
description = A tech blog(?)
template = base
```

{.post-list}
::posts::
]],
        post_item_template =
[[- ```=html
  <time class="text-alt">::date::</time>
  ```
  ## [::title::](::url::){.text-grad}]]
      },
      code_style = function(style, groups)
        local style_groups = require("palettes.blog-" .. style)
        local ret = {}
        for _, name in ipairs(groups) do
          ret[name] = style_groups[name]
        end
        return ret
      end,
      -- code_style = {
      --   light = "bamboo-light",
      --   dark = "alacritty",
      --   restore = "alacritty",
      -- }
    },
    keys = {
      {
        "<leader>jc",
        function()
          package.loaded["palettes.blog-dark"] = nil
          package.loaded["palettes.blog-light"] = nil
          local jolt = require "jolt.build"
          local sheet = jolt.build_highlight_sheet()
          if sheet == "" then
            vim.notify "no cached styles, run build first!"
            return
          end
          local static = { ["css/highlight.css"] = sheet }
          jolt.write_static(static)
          vim.notify "updated site highlights!"
        end,
      },
      {
        "<leader>jf",
        function()
          local jolt = require "jolt.build"
          local opts = require("jolt.config").extend()
          local content_dir = opts.content_dir
          local current_file = vim.fn.expand "%"

          if vim.fn.isabsolutepath(current_file) == 0 then
            content_dir = vim.fs.basename(content_dir)
          end

          if vim.startswith(current_file, content_dir) then
            local url = current_file:sub(#content_dir + 2)
            jolt.build_changeset({ [url] = true }, opts)
          else
            vim.notify "this file not in content dir"
          end
        end,
      },
    },
  },
}
