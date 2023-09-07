local M = {}

M.flash_forward = function()
  require("flash").jump({
    search = { forward = true, wrap = false, multi_window = false },
  })
end

M.flash_backwards = function()
  require("flash").jump({
    search = { forward = false, wrap = false, multi_window = false },
  })
end

M.flash_diagnostics = function()
  -- More advanced example that also highlights diagnostics:
  require("flash").jump({
    matcher = function(win)
      ---@param diag Diagnostic
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

M.flash_toline = function()
    require("flash").jump({
    search = { mode = "search", max_length = 0 },
    label = { after = { 0, 0 } },
    pattern = "^"
  })
end

M.flash_2char = function()
local Flash = require("flash")

---@param opts Flash.Format
local function format(opts)
  -- always show first and second label
  return {
    { opts.match.label1, "FlashMatch" },
    { opts.match.label2, "FlashLabel" },
  }
end

Flash.jump({
  search = { mode = "search" },
  label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
  pattern = [[\<]],
  action = function(match, state)
    state:hide()
    Flash.jump({
      search = { max_length = 0 },
      highlight = { matches = false },
      label = { format = format },
      matcher = function(win)
        -- limit matches to the current label
        return vim.tbl_filter(function(m)
          return m.label == match.label and m.win == win
        end, state.results)
      end,
      labeler = function(matches)
        for _, m in ipairs(matches) do
          m.label = m.label2 -- use the second label
        end
      end,
    })
  end,
  labeler = function(matches, state)
    local labels = state:labels()
    for m, match in ipairs(matches) do
      match.label1 = labels[math.floor((m - 1) / #labels) + 1]
      match.label2 = labels[(m - 1) % #labels + 1]
      match.label = match.label1
    end
  end,
}) 
end

return M
