function! darkmodesocket#updateTheme()
  let g:tokyonight_italic_functions = 1
  let g:tokyonight_italic_keywords = 1
  let g:tokyonight_italic_comments = 0
  let g:tokyonight_lualine_bold = 1
  let g:tokyonight_terminal_colors = 1
  let g:tokyonight_hide_inactive_statusline = 0
  let g:tokyonight_dark_float = 1
  let g:tokyonight_dark_sidebar = 1
  let g:tokyonight_sidebars = [ "qf", "NvimTree", "terminal", "packer" ]

  let is_dark_mode = system("isdark")

    if is_dark_mode == "true\n"
        set background=dark
    else
        set background=light
    endif
    colorscheme rose-pine
endfunction

function! darkmodesocket#listenForLights()
    let pid = string(getpid())
    let socket_name = '/tmp/nvim/nvim' . pid . '.sock'
    call mkdir('/tmp/nvim', 'p')
    call serverstart(socket_name)
endfunction

