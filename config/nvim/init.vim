"General
syntax on
set number
filetype plugin indent on
set ruler
set wildmenu
set mouse-=a
set shell=/bin/zsh
let mapleader=","
" Optimize for fast terminal connections
set ttyfast

" Set terminal colors
set t_Co=256
set termguicolors

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

map <C-t> :tabnew<cr>

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
" Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim' "Add color to status line
Plugin 'junegunn/fzf' "Fuzzer
Plugin 'tpope/vim-fugitive' "Vim plugin for Git.
Plugin 'tpope/vim-surround' "Surround brackets or quotes
Plugin 'preservim/nerdtree' "Browse files from Vim
Plugin 'vimwiki/vimwiki' "Keep notes organized
Plugin 'ryanoasis/vim-devicons' "Icons on Vim
Plugin 'wadackel/vim-dogrun' "Colorscheme
Plugin 'ghifarit53/tokyonight-vim' "Colorscheme
Plugin 'whatyouhide/vim-gotham' "Coloscheme Gotham by sudoers
Plugin 'sheerun/vim-polyglot' "A collection of language packs for Vim.
call vundle#end()            " required

" Nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Make NERDTree pretty
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NerdTree show hidden files
let NERDTreeShowHidden=1
" Nerdree Hide Arrows
let NERDTreeDirArrows=0

" Don't close NERDTree pane when opening a file
"let NERDTreeQuitOnOpen = 1

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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1

colorscheme tokyonight
"set background=dark
let g:lightline = {'colorscheme' : 'tokyonight'}

" Set identation line for YAML
" let g:indentLine_char = '⦙'
