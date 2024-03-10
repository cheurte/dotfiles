-- local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
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

local enable_providers = {
  "python3_provider",
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

autopt("guicursor", "i:ver100-iCursor")
autopt("guicursor", vim.api.nvim_get_option "guicursor" .. ",i:blinkwait10")
autopt("guicursor", vim.api.nvim_get_option "guicursor" .. ",i-ci:block")

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

-- Configure tagbar for Rust
-- g.tagbar_type_rust = {
--   ctagsbin = "/usr/local/bin/ctags",
--   ctagstype = "rust",
--   kinds = {
--     "n:modules",
--     "s:structures:1",
--     "i:interfaces",
--     "c:implementations",
--     "f:functions:1",
--     "g:enumerations:1",
--     "t:type aliases:1:0",
--     "C:constants:1:0",
--     "M:macros:1",
--     "m:fields:1:0",
--     "e:enum variants:1:0",
--     "P:methods:1",
--   },
--   sro = "::",
--   kind2scope = {
--     n = "module",
--     s = "struct",
--     i = "interface",
--     c = "implementation",
--     f = "function",
--     g = "enum",
--     t = "typedef",
--     v = "variable",
--     M = "macro",
--     m = "field",
--     e = "enumerator",
--     P = "method",
--   },
-- }
vim.cmd [[autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon]]
vim.cmd [[autocmd BufNewFile,BufRead *.csv   set nowrap]]

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
cmd [[
    augroup numertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]]

-- Open link with gx
local open_command = 'xdg-open'
if vim.fn.has('mac') == 1 then
  open_command = 'open'
end

local function url_repo()
  local cursorword = vim.fn.expand('<cfile>')
  if string.find(cursorword, '^[a-zA-Z0-9-_.]*/[a-zA-Z0-9-_.]*$') then
    cursorword = 'https://github.com/' .. cursorword
  end
  return cursorword or ''
end

vim.keymap.set('n', 'gx', function()
  vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
end, { silent = true })
