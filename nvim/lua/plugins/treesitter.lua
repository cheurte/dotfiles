return {
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
		opts = function()
			local conf = require("nvchad.configs.treesitter")
			conf.ensure_installed = {
				"vim",
				"lua",
				"rust",
				"python",
				"markdown",
				"c",
				"cpp",
				"csv",
				"toml",
				"json",
				"json5",
				"jsonc",
				"dockerfile",
				"markdown",
				"markdown_inline",
				"ninja",
				"python",
				"rst",
				"toml",
				"ron",
				"rust",
				"latex",
			}
			conf.incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			}
			return conf
		end,
	},
}
