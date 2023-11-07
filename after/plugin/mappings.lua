local wk = require("which-key")
wk.register({
    u = {
      name = "+user",
      f = {
        name = "+format",
        b = { "<cmd>FormatBuffer<cr>", "Format Buffer" }
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
  name = "+quick_toggle",
  g = { "<cmd>Telescope<cr>", "Open Telescope" },
  b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
  a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
  t = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
}, {
  prefix = "<C-g>",
  mode = "n"
})
