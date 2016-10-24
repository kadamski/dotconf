call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'

call plug#end()

set background=dark
colorscheme solarized

set listchars=tab:▸\ ,eol:¬,nbsp:␣,trail:·
set hidden
set showcmd
set ruler
" Briefly jum to matching (
set showmatch
set mouse=a

set number
set relativenumber

set ts=4 sw=4 sts=4 expandtab

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
