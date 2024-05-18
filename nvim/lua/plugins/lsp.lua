return {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
}
