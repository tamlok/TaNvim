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
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    cond = function() return vim.fn.executable("opencode") == 1 end,
    keys = {
      {
        "<Leader>aa",
        function() require("opencode").ask("@this: ", { submit = true }) end,
        desc = "Ask opencode",
        mode = { "n", "v" },
      },
      {
        "<Leader>ax",
        function() require("opencode").select() end,
        desc = "Execute opencode action",
        mode = { "n", "v" },
      },
      {
        "<Leader>ag",
        function() require("opencode").toggle() end,
        desc = "Toggle opencode",
        mode = { "n", "v" },
      },
      {
        "go",
        function() return require("opencode").operator("@this ") end,
        desc = "Add range to opencode",
        mode = { "n", "v" },
        expr = true,
      },
      {
        "goo",
        function() return require("opencode").operator("@this ") .. "_" end,
        desc = "Add line to opencode",
        mode = { "n" },
        expr = true,
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}
      vim.o.autoread = true
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    opts = {
      at_edge = "stop",
    },
  },
}
