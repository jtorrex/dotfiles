"General settings
syntax on "Sintax enabled
set number "Set nummberlines
filetype plugin indent on "Identation based on file type
set wildmenu "Wildmenu?
set mouse-=a "Mouse
set shell=/bin/zsh "Default shell
let mapleader="," "Master KEY for vim
set ttyfast "Optimize for fast terminal connections
set t_Co=256 " Set terminal colors
set termguicolors "Set terminal colors
set foldmethod=manual "Code folding
set autoindent "Autoidentation
set cindent "Colum identation
" let g:indentLine_char = '⦙' " Set identation line for YAML
set tabstop=4 "Tab spacing
set expandtab "Something abot tab :P
set shiftwidth=4 "Spacing
set smarttab "Tab
set smartindent "Identation
set smartcase "Smar casing enabled
set splitbelow "splitting
set conceallevel=1 "Leveling, identation
set laststatus=2 "Status
set ruler "Set ruler
"set cursorline "Hinglight cursor line. Disabled because is slower
set nocursorline "Disabled cursor line to make vim faster
set nocursorcolumn "Disabled cursor linen to make vim faster
set updatetime=300  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user exp

"Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
set diffopt +=iwhite

" Mapping keys settings
" Hold Ctrl and use keys to move around splits
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" This toogles Nerdtree...
map <C-t> :tabnew<cr>
" Ctrl-tab to switch buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
" Do not enter ex mode when I fat finger q with shift pressed
nnoremap Q <nop>
" Do not show me man pages when I'm bad at pressing k
nnoremap K <nop>
" Turn off recording
map q <Nop>

" Vundle settings
set runtimepath+=~/.vim/bundle/Vundle.vim " Set the runtime path to include Vundle and initialize
set nocompatible " be iMproved, required
call vundle#begin() " Start vundle
Plugin 'VundleVim/Vundle.vim' "Add plugin manager
Plugin 'itchyny/lightline.vim' "Add color to status line
Plugin 'junegunn/fzf' "File fuzzer
Plugin 'tpope/vim-fugitive' "Vim plugin for Git.
Plugin 'tpope/vim-surround' "Surround brackets or quotes
Plugin 'preservim/nerdtree' "Browse files from Vim
Plugin 'vimwiki/vimwiki' "Keep notes organized
Plugin 'ryanoasis/vim-devicons' "Icons on Vim
Plugin 'wadackel/vim-dogrun' "Colorscheme
Plugin 'jremmen/vim-ripgrep' "Vim rig-grep to search against text
Plugin 'ghifarit53/tokyonight-vim' "Colorscheme
Plugin 'whatyouhide/vim-gotham' "Coloscheme Gotham by sudoers
Plugin 'sheerun/vim-polyglot' "A collection of language packs for Vim.
call vundle#end() " Stop Vundle

" Plugin Nerdtree settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" autocmd VimEnter * NERDTree | wincmd p " Start NERDTree and put the cursor back in the other window.
let NERDTreeMinimalUI = 1 " Make NERDTree pretty
let NERDTreeDirArrows = 1 " Make NERDTree pretty 2
let NERDTreeShowHidden=1 "NERDTree shows hidden files
let NERDTreeDirArrows=0 "NERDTree shows arrows
"let NERDTreeQuitOnOpen = 1 " Don't close NERDTree pane when opening a file

" Plugin tokyonight theming settings
let g:tokyonight_style = 'night' " Tokyonight theme: available: night, storm
let g:tokyonight_enable_italic = 1 " Tokyonight italic enabled
let g:tokyonight_transparent_background = 1 "Tokyonight theme tranp background
colorscheme tokyonight " Colorscheme selected
"set background=dark "Dark background disabled
let g:lightline = {'colorscheme' : 'tokyonight'} " Lightline colorscheme theme

"Plugin Vimwiki settings
let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown'}] " Define vimwiki path
au FileType vimwiki setlocal shiftwidth=6 tabstop=4 noexpandtab " Define vimwifi format
let g:vimwiki_url_maxsave=0 "Vimwiki url maxsave?`

