-- Silent keymap option
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap , as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tab open
keymap("n", "<C-t>", ":tabedit<CR>", opts)

-- NvimTree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- LazyGit
keymap("n", "<leader>gg", ":LazyGitCurrentFile<CR>", opts)

-- ToggleTerm
keymap("n", "<leader>tt", ":ToggleTerm direction=horizontal size=20<CR>", opts)

-- Opencode/Copilot
vim.keymap.set("n", "<leader>cc", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({
    cmd = "opencode",
    direction = "float",
  })
  t:toggle()
  -- vim.cmd("vertical resize 50")
end, { noremap = true, silent = true })

-- Telekasten
-- Keymaps
keymap("n", "<leader>z", "<cmd>Telekasten panel<CR>", opts)
-- Most used functions
keymap("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", opts)
keymap("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", opts)
keymap("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", opts)
keymap("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", opts)
keymap("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", opts)
keymap("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", opts)
keymap("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", opts)
keymap("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", opts)
-- All insert link automatically when we start typing a link
keymap("i", "[[", "<cmd>Telekasten insert_link<CR>", opts)


