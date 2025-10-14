return {
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
}
