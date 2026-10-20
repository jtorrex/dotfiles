-- Colorscheme follows the system appearance:
--   - lua/plugins/colorschemes.lua sets up auto-dark.nvim, which syncs
--     `vim.o.background` with the XDG portal / gsettings (same source of
--     truth as ghostty's adaptive theme).
--   - `colorscheme catppuccin` (not `catppuccin-mocha`) relies on catppuccin's
--     default `flavour = "auto"` mapping: background=dark -> mocha,
--     background=light -> latte.
vim.cmd([[colorscheme catppuccin]])
