require("which-key").register({
  a = { "<cmd>AerialToggle<cr>", "Symbols (Aerial)" },
  b = { "<cmd>Neotree buffers<cr>", "Buffers " },
  t = { '<cmd>Neotree<cr>', "Explorer" },
  o = { "<cmd>SymbolsOutline<cr>", "Outline" },
  r = { "<cmd>Spectre<cr>", "Search and Replace" },
  g = { "<cmd>Neotree git_status<cr>", "Git Status" },
  w = { "<Cmd>WhichKey<Cr>", "WhichKey" },
}, {
  mode = "n",
  prefix = "<C-g>"
})
