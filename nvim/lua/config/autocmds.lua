-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
-- local augroup = vim.api.nvim_create_augroup
local autopt = vim.api.nvim_set_option

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end
-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

-- toggle number mode
vim.cmd([[
    augroup numertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]])

-- set fat cursor
autopt("guicursor", "i:ver100-iCursor")
autopt("guicursor", vim.api.nvim_get_option("guicursor") .. ",i:blinkwait10")
autopt("guicursor", vim.api.nvim_get_option("guicursor") .. ",i-ci:block")

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
