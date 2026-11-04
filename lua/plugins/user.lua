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
        adapters = {
          http = {
            copilot_astra = function()
              return require("codecompanion.adapters").extend("copilot", {
                schema = {
                  model = {
                    default = "gpt-6-astra",
                    choices = {
                      ["gpt-6-astra"] = {
                        -- Keep Responses routing independent of the model-list cache.
                        endpoint = "responses",
                        formatted_name = "GPT-6 Astra (1M)",
                        vendor = "OpenAI",
                        meta = { context_window = 1000000, max_prompt_tokens = 922000 },
                        opts = { can_stream = true, can_use_tools = true, has_vision = true },
                      },
                    },
                  },
                },
                parameters = {
                  reasoning = { effort = "high" },
                },
              })
            end,
          },
        },
        interactions = {
          chat = {
            adapter = "copilot_astra",
          },
          inline = {
            adapter = "copilot_astra",
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
