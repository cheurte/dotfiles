local M = {}
M.disabled = {
  n = {
    ["<leader>/"] = "",
    ["<C-c>"] = "",
    ["<leader>e"] = "",
  },
  v = {
    ["<leader>/"] = "",
  },
}

M.general = {
  i = {
    ["<C-c>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "window Left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "window Right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "window Down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "window Up" },
    ["U"] = { "<C-r>" },
    [";"] = { "'", "Mark" },

    -- Create lines automatically
    ["o"] = { "o<ESC>", "insert below" },
    ["O"] = { "O<ESC>", "insert above" },

    -- toggle comment
    ["<C-c>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
    ["<F4>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },

    -- Savings
    ["<leader>ww"] = { "<cmd> w <CR>", "save file" },
    ["<leader>wq"] = { "<cmd> wq <CR>", "save file and exit" },

    -- Managing errors
    ["<leader>ee"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "open error window" },
    ["<leader>et"] = { "<cmd>Telescope diagnostics<CR>", "open error window" },
    ["<leader>en"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "go to next error" },
    ["<leader>ep"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "go to previous error" },

    ["<F2>"] = { "<<", "Indent back" },
    ["<F3>"] = { ">>", "Indent" },

    ["vA"] = {"ggvG$", "Select everythin"},

    -- ["W"] =
  },

  v = {
    ["<C-c>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
    ["<F4>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
    ["<F2>"] = { "<gv", "Indent back" },
    ["<F3>"] = { ">gv", "Indent" },
  },

  t = {},
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breaakpoint",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}
M.flash = {
  n = {
    ["s"] = {
      function()
        require("flash").jump()
      end,
      "Flash",
    },
    ["S"] = {
      function()
        require("flash").treesitter()
      end,
      "Flash treesitter",
    },
  },
}
M.tagbar = {
  n = {
    ["<F8>"] = {
      "<cmd> TagbarToggle <CR>",
      "",
    },
  },
}
M.neogen = {
  n = {
    ["<leader>g"] = {
      function()
        require("neogen").generate()
      end,
      "Automatic doc",
    },
  },
}
return M
