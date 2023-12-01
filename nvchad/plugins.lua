local plugins = {
  --- Handle language stuff
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- low levels
        "rust",

        --high levels
        "python",

        -- latex
        "latex",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    -- config = function()
    --   require("custom.configs.telescope").setup()
    -- end,
    opts = function(_, opts)
      local function flash(prompt_bufnr)
        require("flash").jump {
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        }
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          n = { s = flash },
          i = { ["<c-s>"] = flash },
        },
      })
    end,
  },
  --- Highlight words and lines on the cursor for Neovim
  -- {
  --   "yamatsum/nvim-cursorline",
  --   lazy = false,
  --   config = function()
  --     require("nvim-cursorline").setup {
  --       cursorline = {
  --         enable = true,
  --         timeout = 1000,
  --         number = false,
  --       },
  --       cursorword = {
  --         enable = true,
  --         min_length = 3,
  --         hl = { underline = true },
  --       },
  --     }
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimtools/none-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Rust
        "rust-analyzer",
        -- rust
        "lua-language-server",
        "stylua",
        --python
        "pyright",
        -- "pylint",
        "mypy",
        "ruff",
        "black",
        -- latex
        "latexindent",
        "texlab",
        "ltex-ls",
        -- "pylint",
        -- "autopep8",
        -- "csv",
      },
    },
    automatic_install = true,
  },
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
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  --- Debugger
  {
    "mfussenegger/nvim-dap",
  },
  --- For latex file
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  --- Read CSV in a correct manner
  {
    "chrisbra/csv.vim",
    ft = { "csv" },
    config = function() end,
  },
  --- Show marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup {}
    end,
  },
  --- Better escape
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = true,
        keys = "<esc>",
      }
    end,
  },
  --- Allow vim navigator for tmux
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = 'VeryLazy',
  --   config = function()
  --     require("nvim-surround").setup {
  --       -- Configuration here, or leave empty to use defaults
  --     }
  --   end,
  -- },
  --- Allow custom moving commands
  {
    "folke/flash.nvim",
    lazy = true,
  },
  --- Generate comments and doc
  {
    "danymat/neogen",
    lazy = true,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("custom.configs.neogen").setup()
    end,
  },
  --- Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. It does this by creating a sidebar that displays the ctags-generated tags of the current file, ordered by their scope. This means that for example methods in C++ are displayed under the class they are defined in.
  {
    "preservim/tagbar",
    lazy = true,
    event = "VeryLazy",
  },
  --- Highlight arguments' definitions and usages, asynchronously, using Treesitter
  {
    "m-demare/hlargs.nvim",
    lazy = false,
    config = function()
      require("hlargs").setup()
    end,
  },
  --- Print different colors for delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
    config = function()
      return require "custom.configs.rainbow"
    end,
  },
  --- Create a context if the start of the function/class is not on the screen
  {
    "wellle/context.vim",
    lazy = false,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   version = "3.3.7", -- Specify the version you want
  --   main = "ibl",
  --   config = function() end,
  -- },
}
return plugins
