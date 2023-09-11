local plugins = {
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
    "pseewald/vim-anyfold",
    event = "InsertEnter",
    -- lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
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
  {
    "yamatsum/nvim-cursorline",
    lazy = false,
    config = function()
      require("nvim-cursorline").setup {
        cursorline = {
          enable = true,
          timeout = 1000,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
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
  {
    "mfussenegger/nvim-dap",
  },
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      return require "custom.configs.alpha"
    end,
  },
  -- {
  --   "folke/drop.nvim",
  --   config = function()
  --     require("drop").setup()
  --   end,
  -- },
  {
    "chrisbra/csv.vim",
    ft = { "csv" },
    config = function() end,
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   lazy = false,
  --   config = function()
  --     require("notify").setup {
  --       stages = "fade_in_slide_out",
  --       background_colour = "floatshadow",
  --       timeout = 3000,
  --     }
  --     vim.notify = require "notify"
  --   end,
  -- },
  {
    "chentoast/marks.nvim",
    lazy = false,
    config = function()
      require("marks").setup {
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        refresh_interval = 250,
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        excluded_filetypes = {},
        bookmark_0 = {
          sign = "⚑",
          annotate = false,
        },
        mappings = {},
      }
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = "<esc>",
      }
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
     -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
}
return plugins
