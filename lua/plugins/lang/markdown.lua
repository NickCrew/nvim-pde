return {
  {
    "ellisonleao/glow.nvim",
    lazy = true,
    opts = {
      glow_path = "/opt/homebrew/bin/glow"
    },
    cmd = "Glow"
  },
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
      "BufReadPre .. vim.fn.expand '~' .. '/Obsidian/**.md'",
      "BufNewFile .. vim.fn.expand '~' .. '/Obsidian/**.md'"
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      dir = "~/Obsidian",

    },
  }
}
