
local wk = require("which-key")
wk.register({
  s = {
    "<cmd>HopLineStart<cr>",
    "Hop To Start of Line"
  },
  l = {
    "<cmd>HopLine<cr>",
    "Hop To Line"
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
