return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			local conf = require("nvchad.configs.nvimtree")
			conf.git.enable = true
			conf.renderer.icons.glyphs.folder = {
				default = "",
				empty = "",
				empty_open = "",
				open = "",
				symlink = "",
				symlink_open = "",
				arrow_open = "",
				arrow_closed = "",
			}
			return conf
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
