-- load defaults i.e lua_lsp
local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "jsonls", "marksman", "dockerls", "bashls", "ruff" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

require("lspconfig").pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
}

require("lspconfig").groovyls.setup {
  on_attach = on_attach,
  filetypes = { "groovy" },
  cmd = { "java", "-jar", "/home/hce6rt/.local/groovy-language-server/groovy-language-server-all.jar" },
}
