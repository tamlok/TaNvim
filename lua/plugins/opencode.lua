return {
  "sudo-tee/opencode.nvim",
  cmd = { "Opencode" },
  keys = {
    { "<leader>ag", function() require("opencode.api").toggle() end, desc = "Toggle opencode" },
    { "<leader>ai", function() require("opencode.api").open_input() end, desc = "Open opencode and focus on the input window in INSERT mode" },
  },
  config = function()
    require("opencode").setup({
      keymap_prefix = "<Leader>a",
      keymap = {
        input_window = {
          ["<esc>"] = false,
          ["C-["] = false,
          ["<cr>"] = { 'submit_input_prompt', mode = { 'n' } }, -- Submit prompt
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
