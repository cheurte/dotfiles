let g:polyglot_disabled = ['markdown']
let g:polyglot_disabled = ['markdown.plugin']
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
autocmd Filetype * AnyFoldActivate
set foldlevel=99
hi Folded term=underline
set foldcolumn=3
set number " add line numbers
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set cursorcolumn
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
let g:airline_powerline_fonts = 1
set t_Co=256
" set updatetime=300
" set signcolumn=yes
set nobackup
set nowritebackup
set scrolloff=10
"Menu
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
" set wildchar
set showfulltag
set showcmd
""""""""""""""""""""""""""""""""""""""""""""""""""
                " Overwriting command
""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
" Terminal mode 
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" Buffers
nnoremap <S-Tab> :bprev<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <C-q> :Bclose<CR>

" Space bar to write a command
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing Alt+j, Alt+k, Alt+h, or Alt+l.
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-A-up> <c-w>+
noremap <c-A-down> <c-w>-
noremap <c-A-left> <c-w>>
noremap <c-A-right> <c-w><

" esc bis
inoremap jj <ESC>

" Automatic tab
vnoremap < <gv
vnoremap > >gv

" Center the search iterator
nnoremap n nzz 
nnoremap N Nzz

" Higlights
nnoremap <F7> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
                " PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32')
    autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
else
    autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
                " Json
""""""""""""""""""""""""""""""""""""""""""""""""""
" Json files
autocmd FileType json syntax match Comment +\/\/.\+$+

"""""""""""""""""""""""""""""""""""""""""""""""""""
                " HTML/CSS 
""""""""""""""""""""""""""""""""""""""""""""""""""
" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""
        " Custom general functions
""""""""""""""""""""""""""""""""""""""""""""""""""
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
                " Import Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.vim/plugged")
    " Appearence
        " Theme & ariline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'Yggdroot/indentLine'
    "
    " Tree
    " Plug 'scrooloose/nerdtree'
    " Plug 'PhilRunninger/nerdtree-visual-selection'

    " Starting
    Plug 'mhinz/vim-startify'

    " Auto completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-denite'

    " Comment
    Plug 'tomtom/tcomment_vim'

    " Sudo modifying files
    Plug 'lambdalisue/suda.vim'

    " Battery
    Plug 'lambdalisue/battery.vim'

    " wildmenu
    function! UpdateRemotePlugins(...)
        " Needed to refresh runtime files
        let &rtp=&rtp
        UpdateRemotePlugins
    endfunction

    " Folding
    Plug 'pseewald/vim-anyfold'

    " Language
    Plug 'sheerun/vim-polyglot'

    " search file
    Plug 'ctrlpvim/ctrlp.vim'   
    Plug 'tacahiroy/ctrlp-funky'

    " Handle surrounding more quicly
    Plug 'tpope/vim-surround'

    " Align signs
    Plug 'godlygeek/tabular'

    " Print error on the same line
    Plug 'dense-analysis/ale'    
    
    " Handling latex
    Plug 'lervag/vimtex'

    " Multi cursor
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    
    " Floatin terminal"
    Plug 'voldikss/vim-floaterm'

    Plug 'ryanoasis/vim-devicons'
    set encoding=UTF-8

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
                " Manage theme and colors
""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
syntax enable
" set background=dark 

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'original'
let g:gruvbox_material_disable_italic_comment='-1'
let g:gruvbox_material_enable_bold='0'
colorscheme gruvbox-material
set guifont=DroidSansMono\ Nerd\ Font\ 11

"""""""""""""""""""""""""""""""""""""""""""""""""""
                " Nerd Tree
" """"""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <F5> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" " Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
" " Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" " Open the existing NERDTree on each new tab.
" let NERDTreeMapOpenInTab='t'
" " Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" " Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Have nerdtree ignore certain files and directories.
" let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

""""""""""""""""""""""""""""""""""""""""""""""""""
                " Coc
""""""""""""""""""""""""""""""""""""""""""""""""""
" Extensions
let g:coc_global_extensions = ['coc-pyright', 'coc-rust-analyzer', 'coc-json', 'coc-floaterm', 'coc-highlight', 'coc-vimlsp', 'coc-pairs', 'coc-explorer', 'coc-floatinput']

let g:ctrlp_buffer_func = { 'enter': 'CtrlpMaps' }

func! CtrlpMaps()
    nnoremap <buffer> <silent> <c-q> :call <sid>QuickLook()<cr>
endfunc

func! s:QuickLook()
    let line = getline('.')
    let l:path = getcwd() . substitute(line, '> ', '/', "")
    call system("qlmanage -p 2>/dev/null '" . path . "'")
endfunc
" to switch between completion
inoremap <silent><expr> <Tab>
     \ coc#pum#visible() ? coc#pum#next(1) :
     \ CheckBackspace() ? "\<Tab>" :
     \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" To show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Triger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Triger highlighting
autocmd CursorHold * silent call CocActionAsync('highlight')

" Explorer
:nmap <F5> <Cmd>CocCommand explorer . --position floating --floating-position right-center --floating-width 50  --reveal-when-open<CR>
" autocmd VimEnter * :CocCommand explorer . --no-focus --position floating --floating-position right-center --floating-width 50  --reveal-when-open
"
" coc float input
nmap <silent> <Leader>: <Plug>(coc-floatinput-command)
nmap <silent> <Leader>c: <Plug>(coc-floatinput-coc-command)
autocmd ColorScheme *
    \ hi CocHelperNormalFloatBorder guifg=#dddddd guibg=#575B54
    \ | hi CocHelperNormalFloat guibg=#575B54

""""""""""""""""""""""""""""""""""""""""""""""""
                " commenter
""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-c> :TComment<CR>
vnoremap <C-c> :TComment<CR>
"
""""""""""""""""""""""""""""""""""""""""""""""""""
                " Airline
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='base16'
let g:airline_theme='google_dark'

" let g:airline_theme = 'tender'
" let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_highlighting_cache = 1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols                                                                                                                              
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
                " Battery
""""""""""""""""""""""""""""""""""""""""""""""""""
set tabline=...%{battery#component()}...
set statusline=...%{battery#component()}...
let g:battery#update_tabline = 1    " For tabline.
let g:battery#update_statusline = 1 " For statusline.
let g:airline#extentions#battery#enabled = 1
let g:battery#update_interval = 30000
let g:battery_watch_on_startup = 1
function! Battery_icon() 
  let l:battery_icon = {
    \ 5: " ",
    \ 4: " ",
    \ 3: " ",
    \ 2: " ",
    \ 1: " "}
    
  let l:backend = battery#backend()
  let l:nf = float2nr(round(backend.value / 20.0))
  return printf('%s', get(battery_icon, nf))
endfunction
let g:airline_section_x = airline#section#create(['%{battery#sign()} %{battery#value()}%% %{Battery_icon()}'])

""""""""""""""""""""""""""""""""""""""""""""""""""
                    " Tab show
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

""""""""""""""""""""""""""""""""""""""""""""""""""
            " Number fix and relative
""""""""""""""""""""""""""""""""""""""""""""""""""
:augroup numertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
                " Cursor 
""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Cursor guifg=white guibg=white
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set guicursor+=i-ci:block

""""""""""""""""""""""""""""""""""""""""""""""""""
                " ALE CONFIG 
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_use_neovim_diagnostics_api = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
                " LaTex config
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
" To prevent conceal in LaTeX files
let g:tex_conceal = ''

""""""""""""""""""""""""""""""""""""""""""""""""""
                " Buffer closing
""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""
                " Buffer closing
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <A-i> :FloatermToggle<CR>
tnoremap <A-i> <C-\><C-n>:FloatermToggle<CR>
" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=red
" Set floaterm window foreground to gray once the cursor moves out from it
hi FloatermNC guifg=gray
autocmd User FloatermOpen        " triggered after opening a new/existed floaterm

""""""""""""""""""""""""""""""""""""""""""""""""""
                " Ctrlp Funky
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-m> :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <C-s> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

inoremap <silent><<expr> <Tab>

