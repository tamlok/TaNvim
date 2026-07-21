---@type LazySpec
return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.everforest_enable_italic = true
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
      picker = {
        win = {
          input = {
            keys = {
              ["<c-u>"] = { "list_scroll_up", mode = { "n" } },
            },
          },
        },
      },
    },
  },
  { "max397574/better-escape.nvim", enabled = false },
  {
    "fcying/telescope-ctags-outline.nvim",
    lazy = true,
    config = function() require("ctags-outline").setup {} end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.g = opts.options.g or {}
      opts.options.g.ai_accept = function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
          return true
        end
      end
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.statusline = opts.statusline or {
        hl = { fg = "fg", bg = "bg" },
      }

      table.insert(opts.statusline, 1, {
        provider = function() return ("%d "):format(vim.fn.bufnr()) end,
      })

      return opts
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_normal_mode_for_inputs = true,
      window = {
        mappings = {
          ["<space>"] = "none",
          ["h"] = "none",
          ["j"] = "none",
          ["k"] = "none",
          ["l"] = "none",
          ["w"] = "none",
          ["e"] = "none",
          ["b"] = "none",
          ["W"] = "none",
          ["E"] = "none",
          ["B"] = "none",
          ["y"] = "none",
          ["Y"] = "none",
        },
      },
    },
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "folke/snacks.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<Leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
      {
        "<Leader>gf",
        function() require("neogit").open { kind = "floating" } end,
        desc = "Show Neogit UI float",
      },
    },
    opts = {
      auto_refresh = false,
      sections = {
        recent = {
          folded = true,
          hidden = true,
        },
      },
    },
  },
  {
    -- Pin to a tagged release: untagged "main" commits require the separate
    -- `blink.lib` native module + cargo, which breaks startup when unavailable.
    "saghen/blink.cmp",
    version = "v1.*",
  },
  {
    "olimorris/codecompanion.nvim",
    version = "v19.20.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "HakonHarnes/img-clip.nvim",
    },
    config = function()
      require("codecompanion").setup({
        interactions = {
          chat = {
            adapter = {
              name = "copilot",
              model = "claude-opus-4.8",
            },
          },
          inline = {
            adapter = {
              name = "copilot",
              model = "claude-opus-4.8",
            },
          },
        },
      })
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    opts = {
      at_edge = "stop",
    },
  },
}
