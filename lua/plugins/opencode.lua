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
          ["<cr>"] = { 'submit_input_prompt', mode = { 'n' } }, -- Submit promp
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
      context = {
        cursor_data = {
          enabled = true,
        },
      },
    })
  end,
}
