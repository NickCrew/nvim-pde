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
}
