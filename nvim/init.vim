call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-sleuth'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'troydm/easybuffer.vim'
Plug 'kshenoy/vim-signature'
Plug 'neomake/neomake'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'gregsexton/gitv'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'racer-rust/vim-racer'
Plug 'morhetz/gruvbox'

call plug#end()

if has("termguicolors")
    set termguicolors
endif

set background=dark
"colorscheme gruvbox
colorscheme solarized8_dark
"colorscheme murphy

set listchars=tab:▸\ ,eol:¬,nbsp:␣,trail:·
set hidden
set showcmd
set ruler
" Briefly jum to matching (
set showmatch
set mouse=a
set undofile

set number
set relativenumber

set ts=4 sw=4 sts=4 expandtab

set clipboard=unnamedplus
set path+=**

" bash type tab-completion
set wildmode=longest,list
set completeopt=longest,menu,preview

" Exit from terminal with ESC
tnoremap <Esc> <C-\><C-n>

" PLUGINS CONFIGURATION
let g:airline_theme="solarized"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline_section_y = ''
"let g:airline_section_x = ''
"let g:airline_section_a = ''
let g:airline_mode_map={
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'v'  : 'V',
        \ 'V'  : 'V-L',
        \ 'c'  : 'C',
        \ '' : 'V-B',
        \ 's'  : 'S',
        \ 'S'  : 'S-L',
        \ '' : 'S-B'}

let g:startify_bookmarks = [ '~/dotconf/vimrc' ]
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_files_number = 6
let g:startify_enable_special = 1
let g:startify_session_delete_buffers = 1
let g:startify_list_order = [
        \ ['   Recently opened files'],
        \ 'files',
        \ ['   Sessions:'],
        \ 'sessions',
        \ ['   Recently edited files in current directory:'],
        \ 'dir',
        \ ['   Bookmarks:'],
        \ 'bookmarks',
        \ ]

nnoremap <leader>' :EasyBuffer<cr>

let g:ycm_confirm_extra_conf = 1

let g:ctrlp_max_files = 50000
let g:ctrlp_max_depth = 10
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:30'
nnoremap <leader><leader> :CtrlPBuffer<cr>

" vinegar
let g:netrw_banner = 1

"Bautocmd! BufWritePost * Neomake

let g:ack_autoclose = 1

let g:Gitv_DoNotMapCtrlKey = 1

let g:deoplete#enable_at_startup = 1

"racer
let g:racer_cmd = "~/BUILD/racer/target/release/racer"
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH="~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") |   exe "normal! g'\"" | endif

" Save statrtify session called LAST if closing vim with more than 1 buffer
" open
autocmd VimLeave *  if !v:dying | if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1 | SDelete! LAST | SSave LAST | endif | endif
