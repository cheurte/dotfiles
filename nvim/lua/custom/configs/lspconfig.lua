local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {"rust"},
--     root_dir = lspconfig.util.root_pattern("Cargo.toml")
-- })

require'lspconfig'.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"lua"},
}

require'lspconfig'.texlab.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("pyproject.toml")
}
