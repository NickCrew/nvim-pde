
vim.g.vimspector_enable_mappings = "HUMAN"
local opts = { noremap = false, silent = true }
local m = require('mapstuff')
m.map("n", "<Leader>di", "<Plug>VimspectorBalloonEval", opts, "Debugging", "vimspec_eval", "Vimspector Balloon Evaluation")
m.map("n", "<Leader>uf", "<Plug>VimspectorUpFrame", opts, "Debugging", "vimspec_upframe", "Vimspector Up Frame")
m.map("n", "<Leader>df", "<Plug>VimspectorDownFrame", opts, "Debugging", "vimspec_downframe", "Vimspector Down Frame")

require("telescope").load_extension("vimspector")
