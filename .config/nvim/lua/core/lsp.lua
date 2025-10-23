vim.lsp.enable({
    "dockerls",
    "lua_ls",
    "clangd",
    "dockerls",
    "yamlls",
    "helm_ls",
    "pylsp",
    "terraformls",
    "tflint",
    "yamlls"
})

--vim.lsp.enable({
--    "dockerls",
--    "lua_ls",
--    "clangd",
--    "dockerls",
--    "yamlls",
--    "helm_ls",
--    "pylsp",
--    "terraformls",
--    "tflint",
--    "yamlls",
--    "helm-ls",
--    "terraform-ls",
--    "yaml-language-server",
--    "dockerfile-language-server",
--    "ansible-language-server",
--    "bash-language-server",
--    "copilot-language-server",
--    "gopls",
--    "html-lsp",
--    "lua-language-server",
--    "nextflow-language-server",
--    "python-lsp-server",
--    "typescript-language-server",
--    "zls"
--})

-- LSP serves are managed by Mason
-- Us :MasonVerify to check which tools are Mason managed

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.lsp.config("dockerls", {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
})

vim.lsp.config("clangd", {
  capabilities = capabilities,
})

vim.lsp.config("helm_ls", {
  capabilities = capabilities,
})

vim.lsp.config("pylsp", {
  capabilities = capabilities,
})

vim.lsp.config("terraformls", {
  capabilities = capabilities,
})

vim.lsp.config("tflint", {
  capabilities = capabilities,
})

vim.lsp.config("yamlls", {
  capabilities = capabilities,
  settings = {
    yaml = {
      validate = true,
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = {
        ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
        ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] =
          "docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] =
          "argocd-application.yaml",
        kubernetes = { "k8s**.yaml", "kube*/*.yaml" },
      },
    },
  },
})

