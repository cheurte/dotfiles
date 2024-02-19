return {
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities

      local options = {
        server = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      }
      return options
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  }
}
