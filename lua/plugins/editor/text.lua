return {
{
    'echasnovski/mini.splitjoin',
    version = false,
    enabled = true,
    lazy = false,
    keys = {
      { '<leader>ms', mode = 'n', '<cmd>lua MiniSplitjoin.split()<cr>', desc = 'MiniSplitjoin' },
      { '<leader>mj', mode = 'n', '<cmd>lua MiniSplitjoin.join()<cr>',  desc = 'MiniSplitjoin' }
    },
    config = function()
      require('mini.splitjoin').setup {}
    end
  }, 
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    lazy = true,
    opts = {},
    enabled = true,
  },
  {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    lazy = true,
    opts = {
      mappings = {
        add = "gza",            -- Add surrounding in Normal and Visual modes
        delete = "gzd",         -- Delete surrounding
        find = "gzf",           -- Find surrounding (to the right)
        find_left = "gzF",      -- Find surrounding (to the left)
        highlight = "gzh",      -- Highlight surrounding
        replace = "gzr",        -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
  {
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    enabled = true,
    keys = {
      -- stylua:ignore
      { "e", mode = { "v" }, " <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",         desc = "Extract Function" },
      { "f", mode = { "v" }, " <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", desc = "Extract Function To File" },
      { "v", mode = { "v" }, " <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",         desc = "Extract Variable" },
      { "i", mode = { "v" }, " <Esc><Cmd>lua require('refactoring').refactor('Extract Inline Variable')<CR>",  desc = "Extract Inline Variable" },
      -- stylua:ignore end
    },
    config = true
  }
}
