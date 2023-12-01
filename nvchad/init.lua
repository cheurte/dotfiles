-- local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local augroup = vim.api.nvim_create_augroup
local autopt = vim.api.nvim_set_option
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
--
-- General parameters
opt.cursorcolumn = true
opt.cursorline = true
opt.colorcolumn = "80"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 10
-- opt.signcolumn = "auto"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

autopt("guicursor", "i:ver100-iCursor")
autopt("guicursor", vim.api.nvim_get_option "guicursor" .. ",i:blinkwait10")
autopt("guicursor", vim.api.nvim_get_option "guicursor" .. ",i-ci:block")

-- autocmd VimEnter * :highlight CursorColumn guibg=#000000
-- autocmd VimEnter * :highlight CursorLine guibg=#000000
-- autocmd VimEnter * :highlight CursorLine ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold gui=reverse
--
-- autocmd VimEnter * :highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold gui=reverse
-- Highlight Line
cmd [[
   augroup ilikecursorline
        autocmd VimEnter * :highlight Comment cterm=bold
    augroup END

]]
-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

autocmd("WinEnter", {
  command = "ContextEnable",
})

autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    local ft = vim.opt_local.filetype:get()
    -- don't apply to git messages
    if ft:match "commit" or ft:match "rebase" then
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

local cursorGrp = augroup("cursor_off", { clear = true })

-- Enable custom ctags definitions for Rust
g.rust_use_custom_ctags_defs = 1

-- Configure tagbar for Rust
g.tagbar_type_rust = {
  ctagsbin = "/usr/local/bin/ctags",
  ctagstype = "rust",
  kinds = {
    "n:modules",
    "s:structures:1",
    "i:interfaces",
    "c:implementations",
    "f:functions:1",
    "g:enumerations:1",
    "t:type aliases:1:0",
    "C:constants:1:0",
    "M:macros:1",
    "m:fields:1:0",
    "e:enum variants:1:0",
    "P:methods:1",
  },
  sro = "::",
  kind2scope = {
    n = "module",
    s = "struct",
    i = "interface",
    c = "implementation",
    f = "function",
    g = "enum",
    t = "typedef",
    v = "variable",
    M = "macro",
    m = "field",
    e = "enumerator",
    P = "method",
  },
}

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

cmd [[
    augroup numertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]]

-- Auto compile the tex file
autocmd({ "FileType" }, {
  pattern = { "tex" },
  command = "map <buffer> <F9> :w<CR>:VimtexCompile<CR>",
})

autocmd({ "FileType" }, {
  pattern = { "tex" },
  command = "imap <buffer> <F9> <esc>:w<CR>:VimtexCompile<CR>",
})

-- Auto compile python file
autocmd({ "FileType" }, {
  pattern = { "python" },
  command = "map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>",
})

autocmd({ "FileType" }, {
  pattern = { "python" },
  command = "imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>",
})

-- Auto compile and run rust
autocmd({ "FileType" }, {
  pattern = { "rust" },
  command = "map <buffer> <F9> :w<CR>:exec '!cargo run'<CR>",
})

autocmd({ "FileType" }, {
  pattern = { "rust" },
  command = "imap <buffer> <F9> <esc>:w<CR>:exec '!cargo run'<CR>",
})
