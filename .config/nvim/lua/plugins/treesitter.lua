return {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        require'nvim-treesitter.configs'.setup {
          -- A list of parser names or all
          ensure_installed = {
              "python",
              "vim",
              "go",
              "markdown",
              "yaml",
              "hcl"
          },
          -- Install parsers synchronously
          sync_install = false,
          auto_install = true,
          highlight = {
            enable = true,
          }
        }
    end
}
