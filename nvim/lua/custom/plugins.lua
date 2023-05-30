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
    lazy = false,
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
        "rust-analyzer",
        "lua-language-server",
        "pyright",
        "texlab",
        "latexindent",
        "pylint",
        "stylua",
        "autopep8",
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
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      return require "custom.configs.alpha"
    end,
  },
  {
    "folke/drop.nvim",
    -- event = "VimEnter",
    config = function()
      require("drop").setup()
    end,
    -- config = function()
    --     math.randomseed(os.time())
    --     local theme = ({ "stars", "snow", "xmas" })[math.random(1, 3)]
    --     require("drop").setup { theme = theme }
    -- end,
  },
  {
    "chrisbra/csv.vim",
    ft = { "csv" },
    config = function() end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup {
        stages = "fade_in_slide_out",
        background_colour = "FloatShadow",
        timeout = 3000,
      }
      vim.notify = require "notify"
    end,
  },
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
        -- how often (in ms) to redraw signs/recompute mark positions.
        --  higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "⚑",
          -- virt_text = "hello world",
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          -- defaults to false.
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
        mapping = { "jk", "jj" }, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "justinhj/battery.nvim",
    requires = { { "kyazdani42/nvim-web-devicons" }, { "nvim-lua/plenary.nvim" } },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
return plugins
