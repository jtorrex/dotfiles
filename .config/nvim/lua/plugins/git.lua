return {
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup({})
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  }
}
