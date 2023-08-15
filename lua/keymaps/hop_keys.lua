local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

local wk = require('which-key')
wk.register({
  s = {
    "<cmd>HopChar2AC<cr>",
    "Hop 2 Char After Cursor"
  },
  S = {
    "<cmd>HopChar2BC<cr>",
    "Hop 2 Char Before Cursor"
  },
  m = {
    "<cmd>HopChar1AC<cr>",
    "Hop Char 1 After Cursor"
  },
  M = {
    "<cmd>HopChar1BC<cr>",
    "Hop Char 1 Before Cursor"
  }

}, {
  mode = "n"
})

wk.register({

  s = {
    "<cmd>HopLineStart<cr>",
    "Hop To Start of Line"
  },
  a = {
    "<cmd>HopAnywhereCurrentLine<cr>",
    "Hop Anywhere in Current Line"
  },
  w = {
    "<cmd>HopWordCurrentLine<cr>",
    "Hop to Word In Current Line"
  },
  W = {
    "<cmd>HopWord<cr>",
    "Hop Word"
  },

}, { prefix = ";" })
