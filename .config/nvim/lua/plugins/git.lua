return {
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup({})
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    config = function ()
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    }
    end
  }
}

