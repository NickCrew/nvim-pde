function! darkmodesocket#updateTheme()
    let is_dark_mode = system("isdark")

    if is_dark_mode == "true\n"
        set background=dark
        colorscheme rose-pine
    else
        set background=light
        colorscheme rose-pine
    endif
endfunction

function! darkmodesocket#listenForLights()
    let pid = string(getpid())
    let socket_name = '/tmp/nvim/nvim' . pid . '.sock'
    call mkdir('/tmp/nvim', 'p')
    call serverstart(socket_name)
endfunction

