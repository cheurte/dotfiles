return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Add our custom sources
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.npm_groovy_lint.with {
        generator_opts = {
          command = "npm-groovy-lint",
          args = {
            "--failon",
            "none",
            "--format",
            "--config",
            "/home/hce6rt/.config/groovy/groovylintrc.json",
            "--no-insight", -- Disable telemetry/analytics
            "--silent", -- Suppress non-essential output
            "-",
          },
          timeout = 5000,
          to_stdin = true,
        },
      },
      null_ls.builtins.diagnostics.npm_groovy_lint.with {
        generator_opts = {
          command = "npm-groovy-lint",
          args = {
            "--failon",
            "none",
            "--config",
            "/home/hce6rt/.config/groovy/groovylintrc.json",
            "--no-insight", -- Disable telemetry/analytics
            "--silent", -- Suppress non-essential output
            "-",
          },
          timeout = 5000,
          to_stdin = true,
        },
      },
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt.with {
        args = { "-i", "2" }, -- Use tabs instead of spaces (-i 0 means tab indentation)
      },
    })
  end,
}
