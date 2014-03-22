" Initialize pathogen (load plugin bundles):
"call pathogen#infect()
"call pathogen#helptags()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim.git'
Bundle 'tpope/vim-surround.git'
Bundle 'bling/vim-airline.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'gtags.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'scrooloose/syntastic'
Bundle 'mhinz/vim-signify'
Bundle 'kshenoy/vim-signature'
Bundle 'mhinz/vim-startify'
Bundle 'ivalkeen/vim-ctrlp-tjump'
Bundle 'takac/vim-hardtime'
Bundle 'tpope/vim-repeat'
Bundle 'matze/vim-move'

"Experiments:
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'Shougo/neocomplcache.vim'

Bundle 'troydm/easybuffer.vim'
nnoremap <leader>' :EasyBuffer<cr>
Bundle 'wikitopian/hardmode'
let g:HardMode_level='wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"Checkout:
"Bundle 'vim-scripts/YankRing.vim'
"Bundle 'basilgor/vim-autotags'
"Bundle 'embear/vim-localvimrc'
"Bundle 'artemave/slowdown.vim'
"Bundle 'khorser/vim-qfnotes'
"Bundle 'glts/vim-textobj-indblock'
"Bundle 'kana/vim-textobj-user'
"Bundle 'chrisbra/Recover.vim'
"Bundle 'tpope/vim-sensible'
"Bundle 'sjl/clam.vim'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'tpope/vim-obsession'
"Bundle 'kablamo/vim-git-log'
"Bundle 'tpope/vim-dispatch'
"Bundle 'sirver/ultisnips'
"Bundle 'jceb/vim-editqf'

function! FoldToggle()
    if &foldenable
        setlocal nofoldenable
        setlocal foldcolumn=0
    else
        setlocal foldenable
        setlocal foldcolumn=2
    endif
endfunction

function! PreviewClose()
    for nr in range(1, winnr('$'))
        if getwinvar(nr, "&pvw") == 1
            execute ":bdelete " . winbufnr(nr)
            pclose
            return nr
        endif
    endfor
    return 0
endfunction

function! PTagNext()
    try
        call PreviewClose()
        ptnext
    catch
    endtry
endfunction

function! PTagPrev()
    try
        call PreviewClose()
        ptprev
    catch
    endtry
endfunction

function! TagNext()
    try
        tnext
        execute ":bdelete " . bufnr('#')
    catch
    endtry
endfunction

function! TagPrev()
    try
        tprev
        execute ":bdelete " . bufnr('#')
    catch
    endtry
endfunction

" Show command in bottom-right corner when typing it
set showcmd
" Show cursor position
set ruler
" Always show status line
set laststatus=2
" Incremental search
set incsearch
" Set case sensitive search
set noignorecase

" Syntax highlight when in GUI mode or in console with more than one color
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Highlight search matches
set showmatch

" Commands wildcards
set wildmenu
set wildignore=*.bak,*.o,*.e,*~

" Use settings from modeline
set modeline

set number

" Tabs as 4 spaces
set ts=4 sw=4 sts=4 expandtab

" allow backspace to previous insert
set backspace=2

" Set different indent settings for Makefiles
if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

  autocmd FileType markdown syn region nospellmarkdown1 start="`" end="`" contains=@NoSpell
  autocmd FileType markdown syn region nospellmarkdown2 start="`` " end="`` " contains=@NoSpell
  autocmd FileType markdown setlocal spell

  autocmd FileType c setlocal noexpandtab foldmethod=syntax colorcolumn=80
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType c,python nnoremap zi :call FoldToggle()<cr>
  autocmd FileType gitcommit setlocal colorcolumn=72 tw=72 wrap
endif

" Save tabs in session
set sessionoptions+=tabpages

"""""" BUILDIN PLUGINS
" man support - "Man" command and \K
runtime! ftplugin/man.vim

"""""" BINDS
map <F2> :set list!<CR>

set listchars=tab:▸\ ,eol:¬,nbsp:␣,trail:·
" bash type tab-completion
set wildmode=longest,list
set completeopt=longest,menu,preview

set hidden
set history=2000
set scrolloff=4

try
    set undofile
    set undodir=$HOME/.vim/undo/
catch
endtry

let g:airline_theme="solarized"
"let g:airline#extensions#tabline#fnamemod = ':t'
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

" if &t_Co == 256
"   let base16colorspace=256
"   let g:solarized_termcolors=256
" endif
set background=dark
colorscheme solarized
set background=dark

" Folding
nnoremap <Space> za
set foldnestmax=2
set nofoldenable
set foldminlines=2

let g:ctrlp_max_files = 50000
let g:ctrlp_max_depth = 10
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:30'

map Q <Plug>(easymotion-prefix)
nnoremap <leader><leader> :CtrlPBuffer<cr>
nnoremap <leader>t :TagbarToggle<cr>

let g:tcommentInlineC = "// %s"

nnoremap <leader>] <C-W>}
nnoremap <leader>p :ptselect<CR>
nnoremap ]p :call PTagNext()<CR>
nnoremap [p :call PTagPrev()<CR>

command! -bar -nargs=0 SudoW   :setl nomod|silent exe 'write !sudo tee %>/dev/null'|let &mod = v:shell_error
if executable("gtags-cscope")
    set csprg=gtags-cscope
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

    " find definition
    nmap <C-\>t :execute "cs find g " . expand("<cword>")<cr>
    " find callers
    nmap <C-\>r :execute "cs find c " . expand("<cword>")<cr>
    " find symbol
    nmap <C-\>s :execute "cs find s " . expand("<cword>")<cr>
    " find pattern
    nmap <C-\>g :execute "cs find e " . expand("<cword>")<cr>

    nnoremap ]t :call TagNext()<CR>
    nnoremap [t :call TagPrev()<CR>
endif

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nnoremap gs :call search('\s\+', 'W')<cr>
nnoremap gS :call search('\s\+', 'bW')<cr>

nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

let g:hardtime_default_on = 1
let g:list_of_normal_keys = ['h', 'j', 'k', 'l', '-', '+']

let g:move_map_keys = 1
let g:move_key_modifier = 'C'
