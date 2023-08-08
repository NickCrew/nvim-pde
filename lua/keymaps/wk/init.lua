local wk = require("which-key")


wk.register(require('keymaps.wk.core.semicolon-leader'), { prefix = "\\" })
wk.register(require('keymaps.wk.core.leader'), { prefix = "<leader>" })
wk.register(require('keymaps.wk.core.f-keys'), {})
wk.register(require('keymaps.wk.core.lsp'), {})

wk.register(require('keymaps.wk.func.telescope'), { prefix = "<leader><leader>" })
wk.register(require('keymaps.wk.func.harpoon'), { prefix = "<C-a>" })
wk.register(require('keymaps.wk.func.refactor'), { mode = "v" })

