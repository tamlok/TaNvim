return {
  "sudo-tee/opencode.nvim",
  event = "VeryLazy",
  config = function()
    require("opencode").setup({
      keymap_prefix = "<Leader>a",
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
