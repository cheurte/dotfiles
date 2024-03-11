local options = {
	lsp_fallback = true,
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		python = { "ruff_format" },
		sh = { "shfmt" },
		["json"] = { "prettier" },
		["jsonc"] = { "prettier" },
		["yaml"] = { "prettier" },
		["markdown"] = { "prettier" },
		["markdown.mdx"] = { "prettier" },
		["*"] = { "codespell" },
		-- Use the "_" filetype to run formatters on filetypes that don't
		-- have other formatters configured.
		["_"] = { "trim_whitespace" },
	},

	-- adding same formatter for multiple filetypes can look too much work for some
	-- instead of the above code you could just use a loop! the config is just a table after all!

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

require("conform").setup(options)
