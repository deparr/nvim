return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = false,
    },
    keys = {
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
      { "<leader>gi", "<cmd>Gitsigns toggle_signs<cr>" },
      { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>" },
      { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>" },
      -- { "<leader>gd", "<cmd>Gitsigns diffthis<cr>" },
    },
  },
  {
    "esmuellert/codediff.nvim",
    lazy = false,
    keys = { { "<leader>gd", "<cmd>CodeDiff<cr>" } },
  },
  {
    "sindrets/diffview.nvim",
    enabled = false,
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = { use_icons = false },
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>" } },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    keys = {
      { "<leader>gs", "<cmd>vert topleft Git<cr>" },
      { "<leader>gl", "<cmd>vert topleft Git log<cr>" },
    },
  },
}
