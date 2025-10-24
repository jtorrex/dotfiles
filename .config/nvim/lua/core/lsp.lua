-- Servers

local servers = {
  "dockerls",
  "lua_ls",
  "clangd",
  "helm_ls",
  "terraformls",
  "tflint",
  "yamlls",
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

-- -- Helper for defining configs
-- local function setup_native_lsp(name, opts)
--   vim.lsp.config(name, opts)
-- end
-- 
-- -- ── Individual LSP configurations ──────────────────────────────────
-- setup_native_lsp("lua_ls", {
--   cmd = { "lua-language-server" },
--   capabilities = capabilities,
--   filetypes = { "lua" },
--   root_markers = { ".luarc.json", ".git" },
--   settings = {
--     Lua = {
--       diagnostics = { globals = { "vim" } },
--       workspace = { checkThirdParty = false },
--     },
--   },
-- })
-- 
-- setup_native_lsp("pylsp", {
--   cmd = { "pylsp" },
--    filetypes = { "python" },
--   root_markers = { ".git", "pyproject.toml", "setup.py" },
--   capabilities = capabilities,
-- })
-- 
-- setup_native_lsp("clangd", {
--   cmd = { "clangd", "--background-index" },
--     filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
--   root_markers = { "compile_commands.json", ".git" },
--   capabilities = capabilities,
-- })
-- 
-- setup_native_lsp("dockerls", {
--   cmd = { "docker-langserver", "--stdio" },
--   filetypes = { "dockerfile" },
--   capabilities = capabilities,
-- })
-- 
-- setup_native_lsp("helm_ls", {
--   cmd = { "helm_ls", "serve" },
--   filetypes = { "helm" },
--   capabilities = capabilities,
-- })
-- 
-- setup_native_lsp("terraformls", {
--   cmd = { "terraform-ls", "serve" },
--   filetypes = { "terraform", "tf", "hcl" },
--   capabilities = capabilities,
-- })
-- 
-- setup_native_lsp("tflint", {
--   cmd = { "tflint", "--langserver" },
--   filetypes = { "terraform" },
--   capabilities = capabilities,
-- })
-- 
-- setup_native_lsp("yamlls", {
--   cmd = { "yaml-language-server", "--stdio" },
--     filetypes = { "yaml", "yml" },
--   capabilities = capabilities,
--   settings = {
--     yaml = {
--       validate = true,
--       schemaStore = { enable = false, url = "" },
--       schemas = {
--         ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
--         ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] =
--           "docker-compose*.{yml,yaml}",
--         ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] =
--           "argocd-application.yaml",
--         kubernetes = { "k8s**.yaml", "kube*/*.yaml" },
--       },
--     },
--   },
-- })
-- 
-- -- ── Enable all servers ─────────────────────────────────────────────
-- vim.lsp.enable({
--   "lua_ls",
--   "pylsp",
--   "clangd",
--   "dockerls",
--   "helm_ls",
--   "terraformls",
--   "tflint",
--   "yamlls",
-- })
-- 
