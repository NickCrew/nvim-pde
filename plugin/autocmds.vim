" plugin/autocmds.vim

augroup startUp
    autocmd!

    autocmd VimEnter * call darkmodesocket#listenForLights()
augroup END
