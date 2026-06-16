-- Servers
-- Aligned with what Mason installs (see lua/plugins/mason.lua)
local servers = {
  "lua_ls",
  "clangd",
  "gopls",
  "rust_analyzer",
  "pylsp",
  "dockerls",
  "helm_ls",
  "terraformls",
  "tflint",
  "yamlls",
  "ansiblels",
}

-- Make sure cmp-nvim-lsp is loaded first
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
  vim.notify("cmp-nvim-lsp not installed", vim.log.levels.ERROR)
  return
end
-- Enable nvim-cmp capabilities for all LSPs
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
  vim.lsp.config(server, { capabilities = capabilities })
end

vim.lsp.enable(servers)

-- Diagnostic UI configuration
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN]  = "󰀪 ",
      [vim.diagnostic.severity.INFO]  = "󰋽 ",
      [vim.diagnostic.severity.HINT]  = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN]  = "WarningMsg",
    },
  },
})
