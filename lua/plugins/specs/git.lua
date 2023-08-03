return {
  {
    -- Git Integration
    "tpope/vim-fugitive",
    lazy = false,
    enabled = true,
  },
  {
    -- Github integration
    "pwntester/octo.nvim",
    cmd = "Octo",
    lazy = true,
  },
  {
    -- git changes in sign column
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    -- Get links to github
    "ruifm/gitlinker.nvim",
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    -- Git worktree support
    "ThePrimeagen/git-worktree.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
  },
}
