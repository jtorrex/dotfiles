-- Set up CMP
-- https://github.com/hrsh7th/nvim-cmp
return {
    {
        "hrsh7th/nvim-cmp", -- The completion plugin
        config = function ()
            local cmp = require ("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
              -- REQUIRED - you must specify a snippet engine
              snippet = {
                expand = function(args)
                  require('luasnip').lsp_expand(args.body)
                end,
              },
              window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
              },
              mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), --Accept current
              }),
              -- Sources for snippets
              sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip'},
                { name = 'buffer' }
              }),
              -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
              cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                  { name = 'buffer' }
                }
              }),
              -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
              cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                  { name = 'path' }
                }, {
                  { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
              }),
            })
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in language server client.
    },
    {
        "L3MON4D3/LuaSnip",
    },
    {
        "saadparwaiz1/cmp_luasnip", -- snippet completions
    },
    {
        "rafamadriz/friendly-snippets",
    },
    {
        "hrsh7th/cmp-buffer", -- buffer completions
    },
    {
        "hrsh7th/cmp-path", -- path completions
    },
    {
        "hrsh7th/cmp-cmdline", -- cmdline completions

    },
    {
        "hrsh7th/cmp-nvim-lua", -- This source will complete neovim's Lua runtime API
    },
    {
        "lukas-reineke/cmp-rg", -- ripgrep source for nvim-cmp
    }
}
