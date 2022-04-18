
local cmd = vim.cmd

-- packer user config
cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

-- startUp
cmd([[
  augroup startUp
      autocmd!
      autocmd VimEnter * call darkmodesocket#listenForLights()
  augroup END
]])

-- cursorHold
cmd([[
  augroup cursorHold
    autocmd!
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
  augroup END
]])
