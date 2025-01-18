local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup ({
  -- Plugins Start Here
  "wbthomason/packer.nvim", -- Have packer manage itself
  "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "antonk52/bad-practices.nvim",

  -- Telescope
  {
    "nvim-telescope/telescope.nvim", -- Extendable fuzzy finder over lists
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  "nvim-telescope/telescope-media-files.nvim",
  
  -- ToogleTerm
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  -- Autopairs for vim
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Telekasten Wiki
  {
    "renerocksai/telekasten.nvim",
    config = function()
      require('telekasten').setup({ home = vim.fn.expand("~/Sync/wiki") })
    end,
  },

  "renerocksai/calendar-vim",

  -- File explorer Tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons" },
    config = function ()
      require("nvim-tree").setup({})
    end,
  },

  -- Colorschemes
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",

  -- Statusline
  "nvim-lualine/lualine.nvim",

  -- Git:
  -- Super fast git decorations implemented purely in Lua.
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup({})
    end,
  },
  -- Call LazyGit from Nvim
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },

  -- Syntax
  "nvim-treesitter/nvim-treesitter",

  -- LSP: Language Service Provider
  "neovim/nvim-lspconfig", -- Setup LSP configurations
  "williamboman/mason.nvim", -- Package manager for LSP server
  "williamboman/mason-lspconfig.nvim",

  -- Completion Plugins and Snippets
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in language server client.
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "rafamadriz/friendly-snippets",
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/cmp-nvim-lua", -- This source will complete neovim's Lua runtime API 
  "lukas-reineke/cmp-rg", -- ripgrep source for nvim-cmp

  -- Better Scroll
  {
    "karb94/neoscroll.nvim",
    config = function ()
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      })
    end,
  },

  -- Indentation
  "lukas-reineke/indent-blankline.nvim"
})

