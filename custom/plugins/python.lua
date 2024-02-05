return {
    {
        "linux-cultist/venv-selector.nvim",
        cmd = "VenvSelect",
        opts = function(_, opts)
            opts.dap_enabled = true
            return vim.tbl_deep_extend("force", opts, {
                name = {
                    "venv",
                    ".venv",
                    "env",
                    ".env",
                },
            })
        end,
        keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
    },
    {
        "nvim-neotest/neotest-python",
    }
}
