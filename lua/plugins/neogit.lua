return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "folke/snacks.nvim",             -- optional
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    { "<leader>gf",
      function() require('neogit').open({ kind = "floating" }) end,
      desc = "Show Neogit UI float"
    }
  },
  opts = {
    auto_refresh = false,
    sections = {
      recent = {
        folded = true,
        hidden = true,
      }
    }
  }
}
