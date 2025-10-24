-- Set up CMP
-- https://github.com/hrsh7th/nvim-cmp
return {
    {"hrsh7th/cmp-nvim-lsp"},
    {"L3MON4D3/LuaSnip"},
    {"saadparwaiz1/cmp_luasnip"},
    {"rafamadriz/friendly-snippets"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/cmp-nvim-lua"},
    {"lukas-reineke/cmp-rg"},
    {
        "hrsh7th/nvim-cmp", -- The completion plugin
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "lukas-reineke/cmp-rg",
        },
        event = "InsertEnter",
        config = function ()
            local cmp = require ("cmp")
            local luasnip = require("luasnip")

            -- Load VSCode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Native LSP capability extension for cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.config.capabilities = capabilities  -- global default for native LSPs

            cmp.setup({
              snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
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
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                      luasnip.expand_or_jump()
                    else
                      fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                      luasnip.jump(-1)
                    else
                      fallback()
                    end
                end, { "i", "s" }),
              }),
              -- Sources for snippets
            sources = cmp.config.sources({
              { name = "nvim_lsp" },   -- LSP completions
              { name = "luasnip" },    -- Snippet completions
              { name = "nvim_lua" },   -- Neovim Lua API
              { name = "path" },       -- File paths
              { name = "buffer" },     -- Words from open buffers
              { name = "rg" },         -- Ripgrep source
            }),
            formatting = {
              format = function(entry, vim_item)
                local icons = {
                  Text = "󰉿", Method = "󰆧", Function = "󰊕", Constructor = "",
                  Field = "󰇽", Variable = "󰂡", Class = "󰠱", Interface = "",
                  Module = "", Property = "󰜢", Unit = "", Value = "󰎠",
                  Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
                  File = "󰈙", Reference = "󰈇", Folder = "󰉋", EnumMember = "",
                  Constant = "󰏿", Struct = "", Event = "", Operator = "󰆕",
                  TypeParameter = "󰅲",
                }
                vim_item.kind = string.format("%s %s", icons[vim_item.kind] or "", vim_item.kind)
                vim_item.menu = ({
                  nvim_lsp = "[LSP]",
                  luasnip = "[Snip]",
                  buffer = "[Buf]",
                  path = "[Path]",
                  rg = "[RG]",
                })[entry.source.name]
                return vim_item
              end,
            },
        })

        -- Enable cmdline completions
        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        })
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
        })
    end,
  },
}
