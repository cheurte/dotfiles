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
