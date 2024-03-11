return {
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local conf = require("nvchad.configs.cmp")
			conf.sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			}

			return conf
		end,
	},
}
