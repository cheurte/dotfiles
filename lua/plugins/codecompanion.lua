return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("codecompanion").setup {
      memory = {
        claude = {
          description = "Memory files for Claude Code users",
          files = {
            { path = "~/.config/claude/groovy-CLAUDE.md", parser = "claude" },
            -- { path = "~/.config/claude/bash-CLAUDE.md", parser = "claude" },
          },
        },
        opts = {
          chat = {
            enabled = true,
          },
        },
      },
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = "vertical", -- vertical|horizontal split for default provider
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "default", -- default|mini_diff
        },
      },
      strategies = {
        chat = {
          adapter = {
            name = "copilot",
            model = "claude-sonnet-4",
            opts = {
              timeout = 60000, -- Increase timeout to 60 seconds
              retry_count = 5, -- More retries
              stream = false, -- Disable streaming to avoid partial transfers
            },
          },
          slash_commands = {
            ["buffer"] = {
              keymaps = {
                modes = {
                  i = "<C-b>",
                  n = { "<C-b>", "gb" },
                },
              },
            },
          },
        },
        inline = {
          adapter = {
            name = "copilot",
            opts = {
              timeout = 60000,
              retry_count = 5,
              stream = false,
            },
          },
        },
      },
    }

    local keymap_opts = { noremap = true, silent = true }
    vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", keymap_opts)
    vim.keymap.set({ "n", "v" }, "<Leader>a", "<cmd>CodeCompanionChat Toggle<cr>", keymap_opts)
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
