require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls","clangd","yamlls","helm_ls","pylsp","terraformls"}
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
local capabilities = require('cmp_nvim_lsp').default_capabilities

require("lspconfig").clangd.setup {
  capabilities = capabilities
}
require("lspconfig").lua_ls.setup {
  capabilities = capabilities
}
require("lspconfig").yamlls.setup {
  capabilities = capabilities
}
require("lspconfig").helm_ls.setup {
  capabilities = capabilities
}
require("lspconfig").pylsp.setup {
  capabilities = capabilities
}
require("lspconfig").terraformls.setup {
  capabilities = capabilities
}
