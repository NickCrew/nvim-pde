local vim = vim
vim.cmd([[hi Container guifg=#BADA55 guibg=Black]])
vim.cmd([[{set statusline+=%#Container#%{g:currentContainer}]])
