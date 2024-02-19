return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "Saecki/crates.nvim",
                event = { "BufRead Cargo.toml" },
                opts = {
                    src = {
                        cmp = { enabled = true },
                    },
                },
            },
            -- { "hrsh7th/cmp-emoji" },
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, { name = "emoji" })
            table.insert(opts.sources, { name = "crates" })
        end,
    }
}
