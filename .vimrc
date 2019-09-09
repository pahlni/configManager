set number
set relativenumber

let &colorcolumn=join(range(81,82),",")
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Set the width of the tab to 4 wide
" This gets overridden by vim-sleuth, so that's nice
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

set scrolloff=5

set noswapfile

" color desert

" map jj to <Esc>
inoremap jj <Esc>

" Disable Ex mode
map Q <Nop>

" Always use spaces instead of tab characters
set expandtab

" leave files without saving
set hidden

" Highlight trailing whitespace, spaces before tabs, and tabs in green.
highlight ExtraWhiteSpace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$\| \+\ze\t\|\t/

" last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Plugin management: Vim-plug
call plug#begin('~/.vim/plugged')

" syntax checking
"Plug 'scrooloose/syntastic'

" git wrapper
Plug 'tpope/vim-fugitive'

" language syntax highlighter
Plug 'sheerun/vim-polyglot'

" go to next prev keybinds and such
Plug 'tpope/vim-unimpaired'

" status line formatter
Plug 'vim-airline/vim-airline'

" tags
Plug 'ludovicchabant/vim-gutentags'

" smart tabs
Plug 'tpope/vim-sleuth'

" cscope
Plug 'antiagainst/cscope-macros.vim'

" markdown viewer
" Usage: Ctrl + p
Plug 'JamshedVesuna/vim-markdown-preview'

" latex viewer
" Usage: :VimtexCompile
Plug 'lervag/vimtex'

" comment blocks
Plug 'tpope/vim-commentary'

call plug#end()

" gutentags settings
set statusline+=%{gutentags#statusline()}
let g:gutentags_project_root = ['.git']

" airline settings
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_remove_include_errors = 1

" Fins cscope database looking up towards root
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
        " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != "" 
        cs add $CSCOPE_DB
    endif
endfunction
au BufEnter /* call LoadCscope()
