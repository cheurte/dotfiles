return { {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    opts = function()
        -- Util.on_load("telescope.nvim", function()
        --   require("telescope").load_extension("aerial")
        -- end)
    end,
    keys = {
        {
            "<leader>ss",
            "<cmd>Telescope aerial<cr>",
            desc = "Goto Symbol (Aerial)",
        },
    },
} }
