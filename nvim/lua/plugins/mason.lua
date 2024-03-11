return {
	{
		"williamboman/mason.nvim",
		opts = function()
			local conf = require("nvchad.configs.mason")
			conf.ensure_installed = {
				--Common
				"prettier",
				--Lua
				"lua-language-server",
				"stylua",
				-- C, c++ and cmake
				"codelldb",
				"cmakelint",
				"clangd",
				"cmakelang",
				"cmakelint",
				"neocmakelsp",
				--docker
				"hadolint",
				"dockerfile-language-server",
				"docker-compose-language-service",
				--json files
				"json-lsp",
				"marksman",
				"markdownlint",
				-- Python
				"pyright",
				"ruff-lsp",
				"debugpy",
				-- Rust
				"rust-analyzer",
				-- Latex
				"texlab",
				"ltex-ls",
				--shell
				"shfmt",
				--spelling
				"codespell",
				"bash-language-server",
			}
			return conf
		end,

		automatic_install = true,
	},
}
