" Initialize pathogen (load plugin bundles):
call pathogen#infect()
call pathogen#helptags()

" Show command in bottom-right corner when typing it
set showcmd
" Show cursor position
set ruler
" Show current mode in bottom left corner
set showmode
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

" Tabs as 4 spaces
set ts=4 sw=4 sts=4 expandtab

" Set different indent settings for Makefiles
if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType markdown syn region nospellmarkdown1 start="`" end="`" contains=@NoSpell
  autocmd FileType markdown syn region nospellmarkdown2 start="`` " end="`` " contains=@NoSpell
  autocmd FileType markdown setlocal spell
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

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

set hidden
