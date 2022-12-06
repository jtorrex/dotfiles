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
set termguicolors "Set terminal
set foldmethod=manual "Code folding
set autoindent "Autoidentation set cindent "Colum identation
" let g:indentLine_char = '⦙' " Set identation line for YAML
set tabstop=4 " number of spaces that a tab character in the file counts for.
set expandtab " allows to replace the tabs by white spaces characters
set shiftwidth=4 "Spacing for tabs
set smarttab " Smart tabbing
set smartindent "Smart indent
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

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Mapping keys settings
" Hold Ctrl and use keys to move around splits
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Create a new tab
map <C-t> :tabnew<cr>
" Ctrl-tab to switch buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
map <C-Pageup> :tabprev <cr>
map <C-Pagedown> :tabnext <cr>
map <C-w>- :new <cr>
map <C-w>_ :vnew <cr>
map <leader>- :split<cr>

" Open new split panes to right and bottom. More natural
set splitbelow
set splitright

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

map <leader>_ :vsplit<cr>
" Do not enter ex mode when I fat finger q with shift pressed
nnoremap Q <nop>
" Do not show me man pages when I'm bad at pressing k
nnoremap K <nop>
" Turn off recording
map q <Nop>

" Vundle settings
set runtimepath+=~/.config/nvim/bundle/Vundle.vim " Set the runtime path to include Vundle and initialize
let path='~/.config/nvim/bundle'
set nocompatible " be iMproved, required
call vundle#begin("~/.config/nvim/bundle") " Start vundle
Plugin 'VundleVim/Vundle.vim' "Add plugin manager
Plugin 'itchyny/lightline.vim' "Add color to status line
Plugin 'junegunn/fzf' "File fuzzer
Plugin 'tpope/vim-fugitive' "Vim plugin for Git.
Plugin 'tpope/vim-surround' "Surround brackets or quotes
Plugin 'preservim/nerdtree' "Browse files from Vim
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' "Browse files from Vim
Plugin 'vimwiki/vimwiki' "Keep notes organized
Plugin 'ryanoasis/vim-devicons' "Icons on Vim
Plugin 'wadackel/vim-dogrun' "Colorscheme
Plugin 'jremmen/vim-ripgrep' "Vim rig-grep to search against text
Plugin 'ghifarit53/tokyonight-vim' "Colorscheme
Plugin 'ful1e5/onedark.nvim' " Coloscheme
Plugin 'whatyouhide/vim-gotham' "Coloscheme Gotham by sudoers
Plugin 'sheerun/vim-polyglot' "A collection of language packs for Vim.
Plugin 'airblade/vim-gitgutter' "A git wrapper so awesome
Plugin 'folke/tokyonight'
call vundle#end() " Stop Vundle

call plug#begin("~/.config/nvim/plug")
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" Plugin Nerdtree settings
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTree | wincmd p " Start NERDTree and put the cursor back in the other window.
let NERDTreeMinimalUI = 1 " Make NERDTree pretty
let NERDTreeDirArrows = 1 " Make NERDTree pretty 2
let NERDTreeShowHidden=1 "NERDTree shows hidden files
let NERDTreeDirArrows=0 "NERDTree shows arrows
let NERDTreeQuitOnOpen = 0 " Don't close NERDTree pane when opening a file

" Plugin tokyonight theming settings
let g:tokyonight_style = 'night' " Tokyonight theme: available: night, storm
let g:tokyonight_enable_italic = 1 " Tokyonight italic enabled
let g:tokyonight_transparent_background = 1 "Tokyonight theme tranp background
" Plugin onedark theming settings
let g:onedark_function_style = "italic"
let g:onedark_sidebars = ["qf", "vista_kind", "terminal", "packer"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:onedark_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
" colorscheme onedark
" colorscheme delek
colorscheme tokyonight
" set background=dark "Dark background disabled

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"Plugin Vimwiki settings
let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown', 'ext': '.md'}] " Define vimwiki path
au FileType vimwiki setlocal shiftwidth=6 tabstop=4 noexpandtab " Define vimwifi format
let g:vimwiki_url_maxsave=0 "Vimwiki url maxsave?`
