-------------------------------------------------
-- FIle: utils
-- Sourced Directly By: -
-- Description: Helper functions and such
-------------------------------------------------


local M = {}

function M.mk_abbrev(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

function M.mk_abr_cmd(abr, name, cmd, opts)
  vim.api.nvim_create_user_command(name, cmd, opts)
  M.mk_abbrev(abr, cmd)
end

function M.def_signs(p)
  for type, icon in p do
    vim.fn.sign_define(type, { text = icon , texthl = "", numhl = "", linehl = ""} )
  end
end

return M
