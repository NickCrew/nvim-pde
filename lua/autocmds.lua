--
local cmd = vim.cmd

-- cmd([[
--   augroup terms
--   autocmd!
--     autocmd Open * resize 10
--   augroup END
-- ]])

-- Autocommand that reloads Neovim whenever the plugin.lua is saved.
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

cmd([[
  augroup startUp
      autocmd!
      autocmd VimEnter * call darkmodesocket#listenForLights()
  augroup END
]])

cmd([[
  augroup cursorHold
    autocmd!
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
  augroup END
]])
