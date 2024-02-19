return { {
  "stevearc/aerial.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = function()
    -- local icons = vim.deepcopy(Config.icons.kinds)
    --
    -- -- HACK: fix lua's weird choice for `Package` for control
    -- -- structures like if/else/for/etc.
    -- icons.lua = { Package = icons.Control }
    --
    -- ---@type table<string, string[]>|false
    -- local filter_kind = false
    -- if Config.kind_filter then
    --   filter_kind = assert(vim.deepcopy(Config.kind_filter))
    --   filter_kind._ = filter_kind.default
    --   filter_kind.default = nil
    -- end
    --
    local opts = {
      post_jump_cmd = "normal! zz",
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      layout = {
        resize_to_content = true,
        win_opts = {
          winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
          signcolumn = "yes",
          statuscolumn = " ",
        },
      },
      -- icons = icons,
      -- filter_kind = filter_kind,
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
    }
    return opts
  end,
  keys = {
    { "<F8>", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
  },
} }
