require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls","clangd","yamlls","yamlfmt","helm_ls","pylsp","terraformls"}
})

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
 require("lspconfig").yamlfmt.setup {
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

