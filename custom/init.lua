-- local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local augroup = vim.api.nvim_create_augroup
local opt = vim.opt

-- General parameters
opt.cursorcolumn = true
opt.cursorline = true

opt.colorcolumn = "80"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 10
opt.foldlevel = 99
opt.signcolumn = "auto"
-- opt.foldmethod='expr'

-- vim.cmd('autocmd FileType * setlocal foldexpr=anyfold#foldexpr()')

vim.cmd [[
    highlight Cursor guifg=black guibg=black
    highlight iCursor guifg=steelblue guibg=steelblue
    " set guicursor=n-v-c:block-Cursor
    " set guicursor+=n-v-c:blinkon0
    set guicursor+=i:ver100-iCursor
    set guicursor+=i:blinkwait10
    set guicursor+=i-ci:block
]]

-- Remove whitespace on save
autocmd('BufWritePre', {
    pattern = '',
    command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})


autocmd(
    { 'BufReadPost' }, {
        pattern = { '*' },
        callback = function()
            local ft = vim.opt_local.filetype:get()
            -- don't apply to git messages
            if (ft:match('commit') or ft:match('rebase')) then
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
        end
    })

local cursorGrp = augroup("cursor_off", { clear = true })

autocmd(
    { "WinLeave" }, {
        pattern = { "*" },
        command = "set nocursorline nocursorcolumn",
        group = cursorGrp,
    }
)

autocmd(
    { "WinEnter" }, {
        pattern = { "*" },
        command = "set cursorline cursorcolumn",
        group = cursorGrp,
    }
)

vim.cmd [[
    augroup numertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]]

-- Auto compile the tex file
autocmd(
    { "FileType" }, {
        pattern = { "tex" },
        command = "map <buffer> <F9> :w<CR>:VimtexCompile<CR>"
    }
)

autocmd(
    { "FileType" }, {
        pattern = { "tex" },
        command = "imap <buffer> <F9> <esc>:w<CR>:VimtexCompile<CR>"
    }
)

-- Auto compile python file
autocmd(
    { "FileType" }, {
        pattern = { "python" },
        command = "map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>",
    }
)

autocmd(
    { "FileType" }, {
        pattern = { "python" },
        command = "imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>",
    }
)

-- Auto compile and run rust
autocmd(
    { "FileType" }, {
        pattern = { "rust" },
        command = "map <buffer> <F9> :w<CR>:exec '!cargo run'<CR>"
    }
)

autocmd(
    { "FileType" }, {
        pattern = { "rust" },
        command = "imap <buffer> <F9> <esc>:w<CR>:exec '!cargo run'<CR>"
    }
)
