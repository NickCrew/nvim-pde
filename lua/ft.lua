-- Filetypes
local ft = vim.filetype

ft.add ({
  pattern = {
    ['.git*'] = 'gitconfig',
    ['.gitconfig'] = 'gitconfig',
    ['~/.config/git/*' ] = 'gitconfig',
    ['*.snippets'] = 'snippets',
    ['playbooks/*.yaml'] = 'yaml.ansible',
    ['~/.tmux.conf.d/*.conf'] = 'tmux'
  }
})
