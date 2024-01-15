return {
  {
    "lervag/vimtex",
    lazy = false,
    keys = {
      { "<F9>", ft = "tex", "<cmd>w<cr><cmd>VimtexCompile<CR>", desc = "VimtexCompile" },
      { "<F9>", ft = "tex", "<esc><cmd>w<cr><cmd>VimtexCompile<CR>", desc = "VimtexCompile" },
    },
    config = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}
