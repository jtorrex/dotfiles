-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts) keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- " Mapping keys settings
-- " Hold Ctrl and use keys to move around splits
-- map <C-k> <C-w><Up>
-- map <C-j> <C-w><Down>
-- map <C-l> <C-w><Right>
-- map <C-h> <C-w><Left>
-- " Create a new tab
-- map <C-t> :tabnew<cr>
-- " Ctrl-tab to switch buffers
-- map <C-Tab> :bnext<cr>
-- map <C-S-Tab> :bprevious<cr>
-- map <C-Pageup> :tabprev <cr>
-- map <C-Pagedown> :tabnext <cr>
-- map <C-w>- :new <cr>
-- map <C-w>_ :vnew <cr>
-- map <leader>- :split<cr>
-- 
-- " Open new split panes to right and bottom. More natural
-- set splitbelow
-- set splitright
-- 
-- " session management
-- nnoremap <leader>so :OpenSession<Space>
-- nnoremap <leader>ss :SaveSession<Space>
-- nnoremap <leader>sd :DeleteSession<CR>
-- nnoremap <leader>sc :CloseSession<CR>
-- 
-- map <leader>_ :vsplit<cr>
-- " Do not enter ex mode when I fat finger q with shift pressed
-- nnoremap Q <nop>
-- " Do not show me man pages when I'm bad at pressing k
-- nnoremap K <nop>
-- " Turn off recording
-- map q <Nop>
