return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        --Common
        "prettier",
        --Lua
        "lua-language-server",
        -- C, c++ and cmake
        "codelldb",
        "cmakelint",
        "clangd",
        "cmakelang",
        "cmakelint",
        "neocmakelsp",
        --docker
        "hadolint",
        "dockerfile-language-server",
        "docker-compose-language-service",
        --json files
        "json-lsp",
        "marksman",
        "markdownlint",
        -- Python
        "pyright",
        "ruff-lsp",
        "ruff_format",
        "debugpy",
        -- Rust
        "rust-analyzer",
        -- Latex
        "texlab",
        "ltex-ls",
        --shell
        "shfmt",
        --spelling
        "codespell",
      },
    },
    automatic_install = true,
  },
}
