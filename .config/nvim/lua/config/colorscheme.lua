-- Colorscheme for the current system appearance:
--   dark  -> catppuccin (default flavour = "auto" -> mocha)
--   light -> github_light_default (GitHub Light Default: white bg #ffffff,
--            fg #1f2328, Primer palette — same as ghostty's bundled theme)
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
  vim.cmd([[colorscheme github_light_default]])
else
  vim.cmd([[colorscheme catppuccin]])
end
