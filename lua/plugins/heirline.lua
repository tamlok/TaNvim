-- Prepend buffer number to the left side of AstroNvim's Heirline statusline
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astroui.status")

    -- Ensure we have a statusline table (use AstroNvim's defaults if not present)
    opts.statusline = opts.statusline or {
      hl = { fg = "fg", bg = "bg" },
    }

    table.insert(opts.statusline, 1, {
      provider = function() return ("%d "):format(vim.fn.bufnr()) end,
    })

    return opts
  end,
}
