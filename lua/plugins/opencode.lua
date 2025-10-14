return {
  "sudo-tee/opencode.nvim",
  config = function()
    require("opencode").setup({
      keymap_prefix = "<Leader>a",
      ui = {
        completion = {
          file_sources = {
            preferred_cli_tool = "rg",
          }
        }
      },
    })
  end,
}
