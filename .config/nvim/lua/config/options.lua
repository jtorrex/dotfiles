local options = {
  encoding = "utf-8",
  title = true,
  backspace = { "start", "eol", "indent"},
  joinspaces = true,
  laststatus = 2,
  lazyredraw = true,
  breakindent = true,
  list = true, -- Show some invisible characters (tabs...
  pumblend = 10, -- Popup blend
  smarttab = true,
  showcmd = true,
  backup = false,
  clipboard = "unnamed,unnamedplus", -- Sync with system clipboard
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0, -- Hide * markup for bold and italic
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "",
  pumheight = 10, -- Maximum number of entries in a popup
  showmode = false, -- Dont show mode since we have a statusline
  showtabline = 2,
  smartcase = true, -- Don't ignore case with capitals
  smartindent = true, -- Insert indents automatically
  autoindent = true, -- Insert indents automatically
  splitbelow = true, -- Put new windows below current
  splitright = true, -- Put new windows right of current
  splitkeep = "cursor", -- Put new windows right of current
  swapfile = false,
  termguicolors = true, -- True color support
  timeout = true,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 250, -- Save swap file and trigger CursorHold
  writebackup = false,
  expandtab = true, -- Use spaces instead of tabs
  cursorline = true, -- Enable highlighting of the current line
  number = true,
  relativenumber = true, -- Relative line numbers
  shiftwidth = 2, -- Size of an indent
  tabstop = 2, -- Number of spaces tabs count for
  numberwidth = 4,
  signcolumn = "yes", -- Always show the signcolumn, otherwise it would shift the text each time
  linebreak = true,
  showbreak = "↳",
  scrolloff = 8, -- Lines of context
  sidescrolloff = 8, -- Columns of context
  confirm = true, -- Confirm to save changes before exiting modified buffer
  grepprg = "rg --vimgrep",
  inccommand = "split", -- preview incremental substitute
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
  shiftround = true, -- Round indent
  wildmode = "longest:full,full", -- Command-line completion mode
  winminwidth = 5, -- Minimum window width
  wrap = false, -- Disable text wrap
  autoread = true,
  shell= "zsh",
  foldcolumn = "0",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  foldnestmax = 5,
  foldtext = " ",
  foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  incsearch = true,
  hlsearch = true
}

if not vi then
  vim.opt.softtabstop = -1 -- use 'shiftwidth' for tab/bs at end of line
end

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.scriptenconding = "utf-8"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]


if vim.fn.filereadable('/usr/local/bin/python3') == 1 then
  -- speeding up start-up.
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end
