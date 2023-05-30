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
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "window Left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "window Right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "window Down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "window Up" },
  },
}

M.abc = {
  i = {
    -- ["jj"] = { "<ESC>", "exit insert mode", opts = { nowait = true } },
    ["<C-c>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  n = {
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

    -- [";"] = {":", "run command"},

    -- Savings
    ["<leader>ww"] = { "<cmd> w <CR>", "save file" },
    ["<leader>wq"] = { "<cmd> wq <CR>", "save file and exit" },

    -- Managing errors
    ["<leader>ee"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "open error window" },
    ["<leader>et"] = { "<cmd>Telescope diagnostics<CR>", "open error window" },
    ["<leader>en"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "go to next error" },
    ["<leader>ep"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "go to previous error" },
  },

  v = {
    ["<C-c>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },

    -- easier indents
    ["<"] = { "<gv", "indent left again" },
    [">"] = { ">gv", "indent right again" },
  },

  t = {
    ["jj"] = { "<ESC>", "exit insert mode", opts = { nowait = true } },
  },
}
return M
