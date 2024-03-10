local M = {}
M.disabled = {
    n = {
        ["<leader>e"] = "",
    }
}
M.general = {
    n = {
        ["ù"] = { "%", "change mapping" },

        ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "window Left" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "window Right" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "window Down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "window Up" },
        ["U"] = { "<C-r>" },

        -- Create lines automatically
        ["o"] = { "o<ESC>", "insert below" },
        ["O"] = { "O<ESC>", "insert above" },

        -- Savings
        ["<leader>ww"] = { "<cmd> w <CR>", "save file" },
        ["<leader>wq"] = { "<cmd> wq <CR>", "save file and exit" },

        ["<F2>"] = { "<<", "Indent back" },
        ["<F3>"] = { ">>", "Indent" },

        ["vA"] = { "ggvG$", "Select everything" },

      },

    v = {
        ["<F2>"] = { "<gv", "Indent back" },
        ["<F3>"] = { ">gv", "Indent" },
    },

    t = {},
}
M.trouble = {
    n = {
        ["<leader>en"] = {
            function()
                require("trouble").next({ skip_groups = true, jump = true })
            end,
        },
        ["<leader>ep"] = {
            function()
                require("trouble").previous({ skip_groups = true, jump = true })
            end,
        },
    }
}
return M
