return {
	{
		"lervag/vimtex",
		enabled = true,
		lazy = false, -- lazy-loading will disable inverse search
		keys = {
			{
				"<F9>",
				ft = "tex",
				"<cmd>VimtexCompile<cr>",
				desc = "Vimtex compile toggle",
			},
		},
		config = function()
			vim.api.nvim_create_autocmd({ "FileType" }, {
				group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
				pattern = { "bib", "tex" },
				callback = function()
					vim.wo.conceallevel = 2
				end,
			})

			vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
			vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
		end,
		init = function()
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}
