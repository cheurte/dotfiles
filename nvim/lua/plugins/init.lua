return {

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        filters = { git_ignored = false },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        enabled = true,
        opts = { mode = "cursor", max_lines = 3 },
      },
    },
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "rust",
        "json",
        "json5",
        "cmake",
        "python",
        "rust",
        "dockerfile",
        "groovy",
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
      },
    },
    config = function()
      local _, dapui = require "dap", require "dapui"
      dapui.setup()
    end,
  },

  {
    "folke/trouble.nvim",
    enabled = true,
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<F7>", "<cmd>Trouble diagnostics toggle<cr>", desc = "Document Diagnostics (Trouble)" },
      {
        "<F8>",
        "<cmd>Trouble symbols toggle<cr>",
        desc = "Trouble symbols (Trouble)",
      },
      {
        "<leader>ep",
        function()
          if require("trouble").is_open() then
            require("trouble").previous { skip_groups = true, jump = true }
          else
            require("trouble").toggle()
            require("trouble").previous { skip_groups = true, jump = true }
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "<leader>en",
        function()
          if require("trouble").is_open() then
            require("trouble").next { skip_groups = true, jump = true }
          else
            require("trouble").toggle()
            require("trouble").next { skip_groups = true, jump = true }
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      conf.pickers = {
        find_files = {
          hidden = false,
        },
      }
      return conf
    end,
  },

  {
    "nmassardot/nvim-preview-svg",
    lazy = false,
    config = function()
      require("nvim-preview-svg").setup {
        browser = "sensible-browser", -- it can be any browser you want!
        args = false, -- macOS versions newer than BigSur may not work with --args
      }
    end,
  },

  { "akinsho/git-conflict.nvim", version = "*", config = true, lazy = false },

  {
    "github/copilot.vim",
    -- Make the configuration very lazy
    -- so that it doesn't load until you actually use it
    event = "VeryLazy", -- if you want it to load lazily
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = true, -- disable copilot for all filetypes
        [".*"] = false,
      }
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set("i", "<C-x>", "copilot#Dismiss()", {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set("i", "<C-n>", "copilot#Next()", {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set("i", "<C-p>", "copilot#Previous()", {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set("i", "<C-s>", "<Plug>(copilot-accept-word)", {
        expr = false,
        replace_keycodes = false,
      })
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("codecompanion").setup {
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
            adapter = "copilot",
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
            adapter = "copilot",
          },
        },
        prompt_library = {
          ["AutoDoc"] = {
            strategy = "inline",
            description = "Automatically generate documentation for the selected code block",
            opts = {
              index = 12, -- Unique index for this prompt
              is_slash_cmd = false,
              auto_submit = true, -- Automatically submit the prompt
              short_name = "autodoc",
            },
            prompts = {
              {
                role = "system",
                content = [[You are an expert code documentation generator. Write clear and concise documentation for the selected code block.]],
              },
              {
                role = "user",
                content = "<user_prompt>Write down documentation on top of the selected block code. Return comments only.</user_prompt>",
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
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
