" ftdetect/git.vim
"
augroup det_git
    autocmd!
    autocmd BufEnter .gitignore* set filetype=gitconfig
    autocmd BufEnter ~/.config/git/* set filetype=gitconfig
    autocmd BufEnter .gitlocal* set filetype=gitconfig
augroup END
