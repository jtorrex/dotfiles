"General
syntax on
set number
filetype plugin indent on
set ruler
set wildmenu
set mouse-=a
set shell=/bin/zsh

" Optimize for fast terminal connections
set ttyfast

" Set terminal colors
set t_Co=256

let g:solarized_termtrans = 1
silent! colorscheme solarized
set background=dark

"Code folding
set foldmethod=manual

"Tabs and spacing
set autoindent
set cindent
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
set smartindent
set smartcase
set splitbelow
set conceallevel=1
set laststatus=2
set ruler

" Highlight cursor line
" NOTE: disabled because it makes certain things slower
"set cursorline

" Disable cursorline to make vim faster
set nocursorline
set nocursorcolumn

" Hold Ctr and use movement keys to move around window splits
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Ctr-tab to switch buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

"Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set diffopt +=iwhite

"VUNDLE CONFIGURATION
set runtimepath+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' "Add plugin manager
Plugin 'itchyny/lightline.vim' "Add color to status line
Plugin 'junegunn/fzf' "Fuzzer
Plugin 'tpope/vim-fugitive' "Vim plugin for Git.
Plugin 'tpope/vim-surround' "Surround brackets or quotes
Plugin 'preservim/nerdtree'
Plugin 'vimwiki/vimwiki'
call vundle#end()            " required

map <C-n> :NERDTreeToggle<CR> "Nerd tree maping

" Vim Wiki
let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown'}]
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab
let g:vimwiki_url_maxsave=0

" Do not enter ex mode when I fat finger q with shift pressed
nnoremap Q <nop>
" Do not show me man pages when I'm bad at pressing k
nnoremap K <nop>
" Turn off recording
map q <Nop>

" Make NERDTree pretty
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Start NERDTree if no files were specified
if exists("*NERDTree")
  if has("autocmd")
    augroup aug_nerdtree
      autocmd!
      autocmd vimEnter * if !argc() | NERDTree | endif
    augroup END
  endif

  " Open NERDTree by default when starting vim with no file
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

" NerdTree show hidden files
let NERDTreeShowHidden=1

" Don't close NERDTree pane when opening a file
let NERDTreeQuitOnOpen = 0

" Solarized theme options
let g:solarized_termcolors=256
let g:solarized_termtrans = 1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


