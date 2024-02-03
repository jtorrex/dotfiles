local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)

  -- Plugins Start Here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  -- Telescope
  use("nvim-telescope/telescope.nvim") -- Extendable fuzzy finder over lists
  use('nvim-telescope/telescope-media-files.nvim')

  -- Autopairs for vim
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- Telekasten Wiki
  use ({
    'renerocksai/telekasten.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
    config = function ()
      require('telekasten').setup({home = vim.fn.expand("~/Sync/wiki")})
    end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  use("renerocksai/calendar-vim")

  -- File explorer Tree
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  })

  -- Colorschemes
  use("ellisonleao/gruvbox.nvim")
  use("folke/tokyonight.nvim")

  -- Statusline
  use("nvim-lualine/lualine.nvim")

  -- Git:
  -- Super fast git decorations implemented purely in Lua.
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  })

  -- Syntax
  use("nvim-treesitter/nvim-treesitter")

  -- LSP: Language Service Provider
  use("neovim/nvim-lspconfig") -- Setup LSP configurations
  use("williamboman/mason.nvim") -- Package manager for LSP server
  use("williamboman/mason-lspconfig.nvim")

  -- Completion Plugins and Snippets
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in language server client.
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("rafamadriz/friendly-snippets")
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("hrsh7th/cmp-nvim-lua") -- This source will complete neovim's Lua runtime API 
  use "lukas-reineke/cmp-rg" -- ripgrep source for nvim-cmp

  -- Better Scroll
  use({
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      })
    end,
  })

  -- Indentation
  use "lukas-reineke/indent-blankline.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- plugins end here
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
