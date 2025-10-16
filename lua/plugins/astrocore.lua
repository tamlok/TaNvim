-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        wrap = true, -- sets vim.opt.wrap
        guifont = { "SauceCodePro Nerd Font Mono:h13" }, -- sets guifont for nvy
        clipboard = {}, -- do not connect to the system clipboard
        laststatus = 2, -- local statusline
        scrolloff = 3, -- number of lines to keep above or below the cursor line
        colorcolumn = "101",
        list = true,
        listchars = { tab = "▸ ", trail = "●", extends = "❯", precedes = "❮", nbsp = "␣" },
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>r"] = { desc = "Run" },
        ["<leader>ra"] = {
          function()
            if vim.fn.exists(":AsyncRun") > 0 then
                -- Prefill command-line with ":AsyncRun " so you can type arguments
                local keys = vim.api.nvim_replace_termcodes(":AsyncRun ", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", false)
            end
          end,
          desc = "Run an async command",
        },

        -- windows management
        ["<Leader>w"] = { desc = "Windows" },
        ["<Leader>ww"] = { "<cmd>w<cr>", desc = "Save" },
        ["<Leader>wq"] = { "<cmd>confirm q<cr>", desc = "Quit" },
        ["<Leader>wQ"] = { "<cmd>confirm qall<cr>", desc = "Quit all" },
        ["<Leader>wt"] = { "<cmd>tabedit<cr>", desc = "New tab" },
        ["<Leader>wT"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
        ["<Leader>wz"] = {
          function()
            if vim.t.zoomed == true then
              vim.cmd("execute t:zoom_winresetcmd")
              vim.t.zoomed = false
            else
              vim.t.zoom_winresetcmd = vim.fn.winrestcmd()
              vim.cmd("resize")
              vim.cmd("vertical resize")
              vim.t.zoomed = true
            end
          end,
          desc = "Zoom/Restore current window" },
        ["<Leader>wc"] = {
          function()
            local beforeCnt = vim.call("winnr", "$")
            vim.cmd("copen")
            if beforeCnt == vim.call("winnr", "$") then
              vim.cmd("cclose")
            end
          end,
          desc = "Toggle quickfix list"
        },
        ["<Leader>wl"] = {
          function()
            local beforeCnt = vim.call("winnr", "$")
            vim.cmd("lopen")
            if beforeCnt == vim.call("winnr", "$") then
              vim.cmd("lclose")
            end
          end,
          desc = "Toggle location list"
        },
        -- NeoTree
        ["<Leader>we"] = { "<cmd>Neotree toggle reveal<cr>", desc = "Toggle explorer" },
        ["<Leader>wo"] = {
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end,
          desc = "Toggle explorer focus",
        },

        -- tag navigation
        ["]o"] = { "<cmd>tnext<cr>", desc = "Next tag" },
        ["[o"] = { "<cmd>tprevious<cr>", desc = "Previous tag" },
        ["]O"] = { "<cmd>tlast<cr>", desc = "Last tag" },
        ["[O"] = { "<cmd>tfirst<cr>", desc = "First tag" },

        -- copy/paste
        ["<Leader>="] = { '"+', desc = "Use the selection register" },
        ["<Leader>-"] = { '"_', desc = "Use the black hole register" },
        ["<Leader>."] = { '<cmd>"+yiw<cr>', desc = "Yank the word under cursor" },
        ["<Leader><Space>"] = { "<cmd>nohlsearch<cr>", desc = "No highlight search" },

        -- picker
        ["<Leader>fd"] = {
          function()
            local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
            require("snacks").picker.files({ cwd = dir })
          end,
          desc = "Find files in current buffer's directory"
        },
        ["<Leader>fa"] = {
          function()
            require("ctags-outline").snacks_ctags_outline()
          end,
          desc = "Find CTags outlines in current buffer"
        },
        ["<Leader>fA"] = {
          function()
            require("ctags-outline").snacks_ctags_outline({ buf = "all" })
          end,
          desc = "Find CTags outlines in all open buffers"
        },

        -- AI
        ["<Leader>a"] = { desc = "🤖AI Agent" },

        -- setting a mapping to false will disable it
        ["j"] = false,
        ["k"] = false,
        ["<Leader>e"] = false,
        ["<Leader>o"] = false,
      },
      v = {
        -- AI
        ["<Leader>a"] = { desc = "🤖AI Agent" },

        -- copy/paste
        ["<Leader>="] = { '"+', desc = "Use the selection register" },
        ["<Leader>-"] = { '"_', desc = "Use the black hole register" },
      },
    },
  },
}
