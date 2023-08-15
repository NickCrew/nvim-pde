local wk = require("which-key")
wk.register(require('keymaps.wk.lsp'), { mode = "n"})
wk.register(require('keymaps.wk.dap_fkeys'), { })
wk.register(require('keymaps.wk.leader'), { prefix = "<leader>", mode = "n" })
wk.register(require('keymaps.wk.telescope'), { prefix = "<leader><leader>", mode = "n" })
wk.register(require('keymaps.wk.navigation'), { prefix = "<C-a>" , mode = "n"})
wk.register(require('keymaps.wk.visual'), { mode = "v" })


