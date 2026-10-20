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
    -- Light mode theme: GitHub Light Default (Primer palette: white bg
    -- #ffffff, fg #1f2328; same bundled theme ghostty uses via
    -- `light:GitHub Light Default`). Dark mode keeps catppuccin.
    "projekt0n/github-nvim-theme",
    name = "github-theme", -- upstream lazy.nvim example uses this dir name
    lazy = false, -- needed at startup when the system boots in light mode
    priority = 1000, -- load before colorscheme is applied
  },
  {
    -- Gruvbox (light hard / dark): available as a manual `:colorscheme
    -- gruvbox` option; the auto light/dark flow no longer uses it (light ->
    -- github_light_default, dark -> catppuccin).
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
    --   light -> github_light_default (GitHub Light Default)
    "f-person/auto-dark-mode.nvim",
    lazy = false, -- must run at startup to sync with the system appearance
    config = function()
      local function apply(mode)
        -- Setting `background` makes nvim re-source the active colorscheme;
        -- github_light_default does not survive that (g:colors_name is
        -- cleared), so always finish with an explicit :colorscheme instead
        -- of trusting the reload. At startup config/colorscheme.lua applies
        -- the same scheme synchronously right after — idempotent.
        vim.o.background = mode
        if mode == "light" then
          vim.cmd("colorscheme github_light_default")
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
