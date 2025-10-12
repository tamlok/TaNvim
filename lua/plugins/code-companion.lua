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
    prompt_library = {
      ["project_summary"] = {
        strategy = "chat",
        description = "Summarize current project architecture and conventions into Markdown memory",
        opts = {
          contains_code = true,
        },
        prompts = {
          {
            role = "system",
            content = [[
You are an expert software architect. Produce a concise, accurate Markdown summary of the project:
- High-level architecture & modules
- Data flow & key dependencies
- Coding conventions, patterns, and pitfalls
- Build/test/deploy workflows
- Glossary of internal terms
Keep it maintainable: use headings, lists, code fences for examples, and link filenames/paths.
If information is missing, ask for specific files next.
            ]],
          },
          {
            role = "user",
            content = [[
Please analyze the current project context, then output an updated Markdown section.
Target output file: docs/PROJECT_MEMORY.md
If needed, request specific files via follow-up.
            ]],
          },
        },
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
