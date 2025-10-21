-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    formatting = {
      format_on_save = false,
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        ["<Leader>lc"] = {
          function()
            local has_cmd = vim.fn.exists(":ClangdSwitchSourceHeader") > 0
              or vim.api.nvim_get_commands({ builtin = false })["ClangdSwitchSourceHeader"] ~= nil
            if has_cmd then
              vim.cmd("ClangdSwitchSourceHeader")
              return
            end
          end,
          desc = "Switch between source and header files",
        },
      },
    },
  },
}
