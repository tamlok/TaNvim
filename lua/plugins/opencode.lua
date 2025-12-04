return {
  "sudo-tee/opencode.nvim",
  cond = function() return vim.fn.executable("opencode") == 1 end,
  cmd = "Opencode",
  keys = {
    { "<leader>ag", desc = "Toggle Opencode", mode = { "n", "v" } },
    { "<leader>ai", desc = "Open Opencode and focus on the input window", mode = { "n", "v" } },
    { "<leader>aI", desc = "Start a new session and focus on the input window", mode = { "n", "v" } },
    { "<leader>as", desc = "Select and load an Opencode session", mode = { "n", "v" } },
  },
  config = function()
    require("opencode").setup({
      keymap_prefix = "<Leader>a",
      default_mode = "plan",
      keymap = {
        input_window = {
          ["<esc>"] = false,
          ["C-["] = false,
          ["<cr>"] = { "submit_input_prompt", mode = { "n" } }, -- Submit promp
        },
        output_window = {
          ["<esc>"] = false,
          ["<C-[>"] = false,
        },
      },
      ui = {
        input = {
          text = {
            wrap = true, -- Wraps text inside input window
          },
        },
        completion = {
          file_sources = {
            preferred_cli_tool = "rg",
          }
        }
      },
      server = {
        startup_timeout_ms = 15000,
      },
      context = {
        cursor_data = {
          enabled = true,
        },
      },
    })
  end,
}
