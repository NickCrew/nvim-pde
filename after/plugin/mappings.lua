local wk = require("which-key")
wk.register({
    u = {
      name = "+user",
      f = {
        name = "+format",
        b = { "<Cmd>lua vim.lsp.buf.format()<Cr>", "Format Buffer" }
      },
      r = {
        name = "+reload",
        l = { "<cmd>ReloadLuaFile<cr>", "Reload Lua File" },
        t = { "<cmd>lua require('utils').update_theme()<cr>", "Reload Theme" },
      },

    },
  },
  {
    mode = "n",
    prefix = "<leader>"
  })

wk.register({
  ["<C-g>"] = {
    name = "+editor",
    g = { "<cmd>Telescope<cr>", "Open Telescope" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
    t = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
    d = { "<cmd>Trouble document_dignostics<cr>", "Document Diagnostics" },

  },
  ["<C-t"] = {

  },
}, {
  mode = "n"
})
