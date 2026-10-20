-- Colorscheme for the current system appearance:
--   dark  -> catppuccin (default flavour = "auto" -> mocha)
--   light -> gruvbox with contrast = "hard" (Gruvbox Light Hard: warm cream
--            #f9f5d7 instead of Catppuccin Latte's near-white #eff1f5)
--
-- Live changes are applied by auto-dark-mode.nvim (lua/plugins/colorschemes.lua);
-- its initial portal check is asynchronous, so gsettings is queried
-- synchronously here to avoid flashing dark mode when starting in light mode.
-- Same source of truth as ghostty's `theme = light:...,dark:...`, and it
-- falls back to dark when gsettings is unreachable (SSH/TTY), matching the
-- plugin's `fallback = "dark"`.
local out = vim.fn.system({
  "gsettings", "get", "org.gnome.desktop.interface", "color-scheme",
})
if type(out) == "string" and out:find("prefer-light", 1, true) then
  vim.o.background = "light"
  vim.cmd([[colorscheme gruvbox]])
else
  vim.cmd([[colorscheme catppuccin]])
end
