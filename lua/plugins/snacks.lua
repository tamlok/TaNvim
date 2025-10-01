return {
  "folke/snacks.nvim",
  opts = {
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
