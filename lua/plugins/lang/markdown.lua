return {
{
    -- Live markdown preview
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
{
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre /Users/nick/Obsidian/**.md",
      "BufNewFile /Users/nick/Obsidian/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      dir = "~/Obsidian",

    },
  }
}
