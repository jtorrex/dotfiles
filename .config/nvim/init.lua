-- Enable Lua module caching for faster startup (must run before any require;
-- cache invalidates automatically on file mtime changes)
vim.loader.enable()

require("config.options")
require("config.keymaps")
--
require("core.lazy")
--require("core.cmp")
require("core.lsp")
--
require("config.colorscheme")
require("config.icons")
--
-- require("snippets.markdown")
