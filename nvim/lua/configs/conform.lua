local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    svg = { "prettier" },
    json = { "fixjson" },
    markdown = { "markdownlint" },
    python = { "ruff" },
    rust = { "rustfmt" },
    ["_"] = { "trim_whitespace" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
