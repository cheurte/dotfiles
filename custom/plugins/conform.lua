return {
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        --  for users those who want auto-save conform + lazyloading!
        event = "BufWritePre",
        config = function()
            require "custom.configs.conform"
        end,
    },
}
