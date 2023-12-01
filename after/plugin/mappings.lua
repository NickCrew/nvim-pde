-- after/plugin/mappings.lua
--
-- These mappings (and abbreviations) that 
-- should be applied after all plugins are loaded
--

-- Mappings
--
local wk = require("which-key")
wk.register({
  ["<C-g>"] = {
    name = "+editor",
    a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    d = { "<cmd>Trouble document_dignostics<cr>", "Document Diagnostics" },
    g = { "<cmd>lua require('edgy').toggle()<cr>", "Toggle Edgy" },
    o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    s = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format Buffer and Save" },
    t = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
    ["<C-t>"] = { "<cmd>Telescope<cr>", "Open Telescope" },
  },
}, {
  mode = "n"
})


-- Abbreviations
--
local mk_abbrev = require("settings._util").npde_mk_abbrev

mk_abbrev("T", "Telescope ")
mk_abbrev("Lr", "Lazy reload ")
mk_abbrev("Ws", "WeztermSpawn ")
