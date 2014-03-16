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

" Use fugitive statusline addon
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Highlight search matches
set showmatch

" Commands wildcards
set wildmenu
set wildignore=*.bak,*.o,*.e,*~

" Use settings from modeline
set modeline

" Set colorscheme
colorscheme desert
"colorscheme pablo

set number

" Tabs as 4 spaces
set ts=4 sw=4 sts=4 expandtab

" Set different indent settings for Makefiles
if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

  autocmd FileType markdown syn region nospellmarkdown1 start="`" end="`" contains=@NoSpell
  autocmd FileType markdown syn region nospellmarkdown2 start="`` " end="`` " contains=@NoSpell
  autocmd FileType markdown setlocal spell

  autocmd FileType c setlocal noexpandtab foldmethod=syntax
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType c,python nnoremap zi :call FoldToggle()<cr>
  autocmd FileType gitcommit setlocal colorcolumn=72 tw=72 wrap
endif

" Pretty symbols when showing white chars (:set list)
set listchars=tab:▸\ ,eol:¬

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

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

set hidden

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
"let g:airline_section_y = ''
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

if &t_Co == 256
  let base16colorspace=256
  let g:solarized_termcolors=256
endif
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
nnoremap <leader><leader> :CtrlPBuffer<cr>

nnoremap <leader>t :TagbarToggle<cr>

let g:tcommentInlineC = "// %s"

nnoremap <leader>] <C-W>}
nnoremap <leader>p :ptselect<CR>
nnoremap ]p :call PTagNext()<CR>
nnoremap [p :call PTagPrev()<CR>

command! -bar -nargs=0 SudoW   :setl nomod|silent exe 'write !sudo tee %>/dev/null'|let &mod = v:shell_error
