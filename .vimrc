set number


" Set the width of the tab to 4 wide
" This gets overridden by vim-sleuth, so that's nice
set tabstop=4
set shiftwidth=4
set softtabstop=4

color desert

" map jj to <Esc>
inoremap jj <Esc>

" Always use spaces instead of tab characters
set expandtab

" leave files without saving
set hidden

" last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Plugin management: Vim-plug
call plug#begin('~/.vim/plugged')

" syntax checking
Plug 'scrooloose/syntastic'

" git wrapper
Plug 'tpope/vim-fugitive'

" language syntax highlighter
Plug 'sheerun/vim-polyglot'

" go to next prev keybinds and such
Plug 'tpope/vim-unimpaired'

" fonts for airline
Plug 'powerline/fonts'

" status line formatter
Plug 'vim-airline/vim-airline'

" tags
Plug 'ludovicchabant/vim-gutentags'

" smart tabs
Plug 'tpope/vim-sleuth'

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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
