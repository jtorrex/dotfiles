return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate", -- keep installed parsers in sync with the plugin
    lazy = false, -- the plugin does not support lazy-loading
    config = function()
        local parsers = {
          "c",
          "cpp",
          "lua",
          "python",
          "rust",
          "vim",
          "go",
          "markdown",
          "markdown_inline",
          "json",
          "yaml",
          "bash",
          "hcl"
        }

        require("nvim-treesitter").install(parsers)

        local filetypes = {}
        for _, lang in ipairs(parsers) do
          for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
            filetypes[#filetypes + 1] = ft
          end
        end

        vim.api.nvim_create_autocmd("FileType", {
          pattern = filetypes,
          callback = function(args)
            pcall(vim.treesitter.start, args.buf)
          end,
        })
    end,
}
