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
      format_on_save = {
        enabled = false,
      },
    },
    mappings = {
      n = {
        ["<Leader>lc"] = {
          function()
            local params = { uri = vim.uri_from_bufnr(0) }
            vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(err, result)
              if result then vim.cmd("edit " .. vim.uri_to_fname(result)) end
            end)
          end,
          desc = "Switch between source and header files",
          cond = function(client) return client.name == "clangd" end,
        },
      },
    },
  },
}
