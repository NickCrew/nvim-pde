" autocommands

augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end

augroup startUp
    autocmd!
    autocmd VimEnter * call darkmodesocket#listenForLights()
augroup END

augroup cursorHold
  autocmd!
  autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
augroup END
