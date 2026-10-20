return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim"
  },
  {
    "rebelot/kanagawa.nvim"
  },
  {
    "NLKNguyen/papercolor-theme"
  },
  {
    -- Follow the system light/dark appearance (XDG portal / gsettings) and
    -- drive `vim.o.background` from it. Same source of truth as ghostty's
    -- adaptive `theme = light:...,dark:...`.
    --
    -- The default set_dark_mode/set_light_mode callbacks only set the
    -- 'background' option: Neovim then reloads the matching colorscheme
    -- variant by itself (catppuccin-latte / catppuccin-mocha), and catppuccin's
    -- default `flavour = "auto"` resolves to latte (light) / mocha (dark).
    "f-person/auto-dark-mode.nvim",
    lazy = false, -- must run at startup to sync with the system appearance
    opts = {
      update_interval = 1000,
      fallback = "dark", -- when the portal is unreachable (SSH, TTY)
    },
  },
}
