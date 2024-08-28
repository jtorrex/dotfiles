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

-- https://www.arthurkoziel.com/json-schemas-in-neovim/
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      validate = true,
      -- disable the schema store
      schemaStore = {
        enable = false,
        url = "",
      },
      -- manually select schemas
      schemas = {
        ['https://json.schemastore.org/kustomization.json'] = 'kustomization.{yml,yaml}',
        ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = 'docker-compose*.{yml,yaml}',
        ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "argocd-application.yaml",
        kubernetes = { 'k8s**.yaml', 'kube*/*.yaml' }
      }
    }
  }
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
