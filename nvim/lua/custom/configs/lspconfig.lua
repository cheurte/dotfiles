local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
}

require("lspconfig").texlab.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require("lspconfig").pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern "pyproject.toml",
}

require("lspconfig").ltex.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ltex = {
      dictionary = {},
    },
  },
}
