require('packer').startup(function()
  -- Use Packer
  use 'wbthomason/packer.nvim'

  -- Old config plugins
  use 'itchyny/lightline.vim' -- Add color to status line
  use 'junegunn/fzf' --File fuzzer
  use 'ryanoasis/vim-devicons' --Icons on Vim
  use 'wadackel/vim-dogrun' --Colorscheme
  use 'jremmen/vim-ripgrep' --Vim rig-grep to search against text
  use 'sheerun/vim-polyglot' --A collection of language packs for Vim.
  use 'airblade/vim-gitgutter' --A git wrapper so awesome

  -- Common new
  use 'tpope/vim-fugitive' -- Git commands
  use 'vim-airline/vim-airline' -- powerline
  use 'vim-airline/vim-airline-themes'
  use 'rhysd/vim-grammarous' -- grammar check
  use 'andymass/vim-matchup' -- matching parens and more
  use 'bronson/vim-trailing-whitespace' -- highlight trailing spaces
  use 'rhysd/git-messenger.vim'
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugi
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Visual
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'folke/tokyonight.nvim'
  use 'edluffy/hologram.nvim'

  require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
  }

  -- General dev
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use 'nvim-treesitter/nvim-treesitter'
  use 'scrooloose/nerdcommenter' -- commenting shortcuts
  use 'lewis6991/gitsigns.nvim'

  -- LSP

  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = { "ruby" }
    }
  }

  -- Search
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-eunuch' -- wrappers UNIX commands
  use 'tpope/vim-surround' -- surround characters shortcuts
  use 'tpope/vim-vinegar' -- file browser
  use 'kyazdani42/nvim-web-devicons' -- icons when searching

  -- Personal Knowledge Management
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Sync/wiki',
          syntax = 'markdown',
          ext  = '.md',
        }
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end
  }

  use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Sync/neorg",
                        },
                    },
                },
            },
        }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }

end)
