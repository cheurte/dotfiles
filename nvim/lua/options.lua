require("nvchad.options")
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local augroup = vim.api.nvim_create_augroup
local autopt = vim.api.nvim_set_option
local opt = vim.opt
-- local g = vim.g
local cmd = vim.cmd
--
-- General parameters
opt.cursorcolumn = true
opt.cursorline = true
-- opt.colorcolumn = "80"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 10
-- opt.signcolumn = "auto"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.termguicolors = true
vim.o.termguicolors = true

local enable_providers = {
	"python3_provider",
}

for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end

autopt("guicursor", "i:ver100-iCursor")
autopt("guicursor", vim.api.nvim_get_option("guicursor") .. ",i:blinkwait10")
autopt("guicursor", vim.api.nvim_get_option("guicursor") .. ",i-ci:block")

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

-- Get to last position
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		local ft = vim.opt_local.filetype:get()
		-- don't apply to git messages
		if ft:match("commit") or ft:match("rebase") then
			return
		end
		-- get position of last saved edit
		local markpos = vim.api.nvim_buf_get_mark(0, '"')
		local line = markpos[1]
		local col = markpos[2]
		-- if in range, go there
		if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
			vim.api.nvim_win_set_cursor(0, { line, col })
		end
	end,
})

vim.cmd([[autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon]])
vim.cmd([[autocmd BufNewFile,BufRead *.csv   set nowrap]])

-- deactivate cursor when out of window
local cursorGrp = augroup("cursor_off", { clear = true })
autocmd({ "WinLeave" }, {
	pattern = { "*" },
	command = "set nocursorline nocursorcolumn",
	group = cursorGrp,
})

autocmd({ "WinEnter" }, {
	pattern = { "*" },
	command = "set cursorline cursorcolumn",
	group = cursorGrp,
})

-- Number lines
cmd([[
    augroup numertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]])

-- Open link with gx
local open_command = "xdg-open"
if vim.fn.has("mac") == 1 then
	open_command = "open"
end

local function url_repo()
	local cursorword = vim.fn.expand("<cfile>")
	if string.find(cursorword, "^[a-zA-Z0-9-_.]*/[a-zA-Z0-9-_.]*$") then
		cursorword = "https://github.com/" .. cursorword
	end
	return cursorword or ""
end

vim.keymap.set("n", "gx", function()
	vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
end, { silent = true })

-- add yours here!
-- Close nvim tree authomatically
local function tab_win_closed(winnr)
	local api = require("nvim-tree.api")
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w)
		return w ~= winnr
	end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
			api.tree.close()
		end
	else -- else closed buffer was normal buffer
		if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
				vim.schedule(function()
					if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
						vim.cmd("quit") -- then close all of vim
					else -- else there are more tabs open
						vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
					end
				end)
			end
		end
	end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true,
})

-- LSP config
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
