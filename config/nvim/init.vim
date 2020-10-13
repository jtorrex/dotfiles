"General
syntax on
set number
filetype plugin indent on
set ruler
set wildmenu
set mouse-=a
set shell=/bin/zsh

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
set splitbelow
set relativenumber
set conceallevel=1
set laststatus=2
set cursorline

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
