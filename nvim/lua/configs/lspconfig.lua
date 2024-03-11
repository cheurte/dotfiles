local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

local servers = {
	"clangd",
	"neocmake",
	"jsonls",
	"dockerls",
	"docker_compose_language_service",
	"dockerls",
	"marksman",
	"pyright",
	"ruff_lsp",
	-- "rust_analyzer",
	"texlab",
	"ltex",
	"bashls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		on_init = on_init,
	})
end

local on_attach_ruff = function(client, _)
	-- Disable hover in favor of Pyright
	client.server_capabilities.hoverProvider = false
end

lspconfig.clangd.setup({
	capabilities = {
		offsetEncoding = { "utf-16" },
	},
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern(
			"Makefile",
			"configure.ac",
			"configure.in",
			"config.h.in",
			"meson.build",
			"meson_options.txt",
			"build.ninja"
		)(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
			"lspconfig.util"
		).find_git_ancestor(fname)
	end,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
})

lspconfig.ruff_lsp.setup({
	on_attach = on_attach_ruff,
})

-- lspconfig.rust_analyzer.setup({
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			diagnostics = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })

lspconfig.texlab.setup({
	keys = {
		{ "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
	},
})
