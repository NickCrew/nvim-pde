-- lua/opt/mappings.opt.lua

local M = {}

function M.get_vimspector_opt_mappings()
  vim.g.vimspector_enable_mappings = "HUMAN"
  local vimspec_opts = { noremap = false, silent = true }
  Mapper.map("n", "<Leader>di", "<Plug>VimspectorBalloonEval", vimspec_opts, "Debugging", "vimspec_eval", "Vimspector Balloon Evaluation")
  Mapper.map("n", "<Leader>uf", "<Plug>VimspectorUpFrame", vimspec_opts, "Debugging", "vimspec_upframe", "Vimspector Up Frame")
  Mapper.map("n", "<Leader>df", "<Plug>VimspectorDownFrame", vimspec_opts, "Debugging", "vimspec_downframe", "Vimspector Down Frame")
end

return M
