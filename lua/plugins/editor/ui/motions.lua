local select_any_word = function()
  require("flash").jump({
  pattern = ".", -- initialize pattern with any char
  search = {
    mode = function(pattern)
      -- remove leading dot
      if pattern:sub(1, 1) == "." then
        pattern = pattern:sub(2)
      end
      -- return word pattern and proper skip pattern
      return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
    end,
  },
  -- select the range
  jump = { pos = "range" },
})
end

local jump_diagnostics = function()
  -- More advanced example that also highlights diagnostics:
  require("flash").jump({
    matcher = function(win)
      return vim.tbl_map(function(diag)
        return {
          pos = { diag.lnum + 1, diag.col },
          end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
        }
      end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
    end,
    action = function(match, state)
      vim.api.nvim_win_call(match.win, function()
        vim.api.nvim_win_set_cursor(match.win, match.pos)
        vim.diagnostic.open_float()
      end)
      state:restore()
    end,
  })
end

local jump_to_line = function()
  require("flash").jump({
    search = { mode = "search", max_length = 0 },
    label = { after = { 0, 0 } },
    pattern = "^"
  })
end

local jump_to_word_under_cursor = function()
  require("flash").jump({
  pattern = vim.fn.expand("<cword>"),
})
end

return {
{
    'echasnovski/mini.bracketed',
    version = false,
    lazy = true,
    opts = {},
    event = "VeryLazy"
  },
  {
    -- Quick movements
    "phaazon/hop.nvim",
    branch = 'v2',
    opts = {
      case_insensitive = true
    }
  },
  {
    "folke/flash.nvim",
    lazy = true,
    event = "VeryLazy",
  opts = {
      modes = {
        char = { 
          jump_labels = true
        },
      }
    },
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function() require("flash").jump() end,
        desc = "Flash"
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search"
      },
            {
        ";*",
        mode = { "n" },
        jump_to_word_under_cursor,
        desc = "Jump To Word Under Cursor"
      },
      {
        ";l",
        mode = { "n" },
        jump_to_line,
        desc = "Jump To Line"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search"
      },
    },
  },
}
