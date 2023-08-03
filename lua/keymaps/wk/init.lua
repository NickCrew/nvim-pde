local wk = require("which-key")

wk.register(require('keymaps.wk.leader'), {
  prefix = "<leader>"
})

wk.register(require('keymaps.wk.telescope'), {
  prefix = "<leader><leader>"
})
wk.register(require('keymaps.wk.lsp'), {
  mode = "n" })
wk.register(require('keymaps.wk.dap'), {
})
wk.regsiter(require('keymaps.wk.nav'), {
  prefix = "<C-a>" 
})
wk.register(require('keymaps.wk.editor'), {
  prefix = "<C-e>" 
})
wk.register(require('keymaps.wk.refactor'), {
  mode = "v" })
