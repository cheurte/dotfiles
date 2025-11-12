-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.search.nvim-hlslens" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.pack.cmake" },
}
