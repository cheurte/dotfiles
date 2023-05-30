local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
    formatting.rustfmt,
    formatting.latexindent,
    lint.pylint,
    formatting.autopep8,
    -- null_ls.builtins.completion.luasnip
    formatting.stylua,
}

null_ls.setup {
    debug = true,
    sources = sources,
}
