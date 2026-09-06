return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    ---@module 'blink-cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        -- windows eats <C-Space>
        -- just always do this because now I have muscle memory
        ["<C-Bslash>"] = { "show", "show_documentation", "hide_documentation" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
      },
      sources = {
        default = { "lazydev", "lsp", "path", "buffer", "godot_uid", "godot_res" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          godot_res = {
            name = "godot-res",
            module = "godot-tools.blink.res",
            score_offset = 100,
            fallbacks = {},
          },
          godot_uid = {
            name = "godot-uid",
            module = "godot-tools.blink.uid",
            score_offset = 100,
            fallbacks = {},
          },
        },
      },
      cmdline = { enabled = false },
      signature = { enabled = true, window = { show_documentation = false } },
      completion = {
        menu = { auto_show = false, border = "none" },
        accept = { auto_brackets = { enabled = false } },
        ghost_text = { enabled = true, show_with_menu = false },
        documentation = { auto_show = false, auto_show_delay_ms = 300 },
      },
      fuzzy = { implementation = "rust" },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
    end,
  },
}
