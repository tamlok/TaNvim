return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  cond = function() return vim.fn.executable("opencode") == 1 end,
  keys = {
    { "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end, desc = "Ask opencode", mode = { "n", "v" } },
    { "<leader>ax", function() require("opencode").select() end, desc = "Execute opencode action", mode = { "n", "v" } },
    { "<leader>ag", function() require("opencode").toggle() end, desc = "Toggle opencode", mode = { "n", "v" } },
    { "go", function() return require("opencode").operator("@this ") end, desc = "Add range to opencode", mode = { "n", "v" }, expr = true },
    { "goo", function() return require("opencode").operator("@this ") .. "_" end, desc = "Add line to opencode", mode = { "n" }, expr = true },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true
  end,
}
