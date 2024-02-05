return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "codelldb",
                "clangd",
                "cmakelang",
                "cmakelint",
                "neocmakelsp",
                "cmakelint",
                "hadolint",
                "dockerfile-language-server",
                "docker-compose-language-service",
                "json-lsp",
                "marksman",
                "markdownlint",
                "pyright",
                "ruff-lsp",
                "debugpy",
                "rust-analyzer",
                "texlab",
                "ltex-ls"
            },
        },
        automatic_install = true,
    },
}
