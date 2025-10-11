-- Expand 'cc' to 'CodeCompanion' in command mode
vim.cmd([[cab cc CodeCompanion]])

return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        name = "copilot",
        model = "gemini-2.5-pro",
        opts = {
          prompt_decorator = function(message, adapter, context)
            return string.format([[<prompt>%s</prompt>]], message)
          end,
        }
      },
      inline = {
        adapter = "copilot",
        model = "gemini-2.5-pro",
      },
      cmd = {
        adapter = "copilot",
        model = "gpt-4.1",
      },
    },
    display = {
      chat = {
        auto_scroll = false,
      },
    },
    memory = {
      default = {
        description = "Collection of common files for all projects",
        files = {
          ".clinerules",
          ".cursorrules",
          ".goosehints",
          ".rules",
          ".windsurfrules",
          ".github/copilot-instructions.md",
          "AGENT.md",
          "AGENTS.md",
          { path = "CLAUDE.md", parser = "claude" },
          { path = "CLAUDE.local.md", parser = "claude" },
          { path = "~/.claude/CLAUDE.md", parser = "claude" },
        },
        is_default = true,
      },
      opts = {
        chat = {
          enabled = true,
        },
      },
    },
  },
}
