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
    -- Light mode theme: Gruvbox Light Hard (warm cream #f9f5d7, softer than
    -- Catppuccin Latte's near-white). Only used when background=light;
    -- dark mode stays on catppuccin (mocha).
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- needed at startup when the system boots in light mode
    priority = 1000, -- setup() must run before auto-dark-mode picks a scheme
    opts = { contrast = "hard" },
  },
  {
    -- Follow the system light/dark appearance (XDG portal / gsettings) and
    -- drive `vim.o.background` + the active colorscheme from it. Same source
    -- of truth as ghostty's adaptive `theme = light:...,dark:...`:
    --   dark  -> catppuccin (default flavour = "auto" -> mocha)
    --   light -> gruvbox with contrast = "hard" (Gruvbox Light Hard)
    "f-person/auto-dark-mode.nvim",
    lazy = false, -- must run at startup to sync with the system appearance
    config = function()
      local function apply(mode)
        vim.o.background = mode
        -- At startup no colorscheme is active yet: config/colorscheme.lua
        -- runs after plugin setup and picks the right one for vim.o.background.
        local name = vim.g.colors_name
        if not name or name == "default" then
          return
        end
        if mode == "light" then
          vim.cmd("colorscheme gruvbox")
        else
          vim.cmd("colorscheme catppuccin")
        end
      end

      require("auto-dark-mode").setup({
        update_interval = 1000,
        fallback = "dark", -- when the portal is unreachable (SSH, TTY)
        set_dark_mode = function() apply("dark") end,
        set_light_mode = function() apply("light") end,
      })
    end,
  },
}
