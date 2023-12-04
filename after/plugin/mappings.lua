-- after/plugin/mappings.lua
--
-- These mappings (and abbreviations) that 
-- should be applied after all plugins are loaded
--

-- Mappings
--
local wk = require("which-key")
wk.register({
  ["<C-t>"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
  ["<C-e>"] = {"<Cmd>Telescope buffers<CR>", "Find Buffers" },
  ["<C-p>"] = {"<Cmd>Telescope<CR>", "Find"},
  ["<C-g>"] = {
    name = "+editor",
    a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
    d = { "<cmd>Trouble document_dignostics<cr>", "Document Diagnostics" },
    g = { "<cmd>lua require('edgy').toggle()<cr>", "Toggle Edgy" },
    k = { "<Cmd>WhichKey<Cr>", "WhichKey" },
    o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format Buffer and Save" },
    t = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
  },
  }, {
  mode = "n"
})

wk.register({
},{mode="n", prefix="leader"})


-- Abbreviations
--
local mk_abbrev = require("settings._util").npde_mk_abbrev

mk_abbrev("T", "Telescope ")
mk_abbrev("Lr", "Lazy reload ")
mk_abbrev("Ws", "WeztermSpawn ")
