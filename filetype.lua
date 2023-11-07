vim.filetype.add({
  pattern = {
    [ '.adoc']                = 'asciidoc',
    ['.git*']                 = 'gitconfig',
    ['.gitconfig']            = 'gitconfig',
    ['~/.config/git/*']       = 'gitconfig',
    ['*.snippets']            = 'snippets',
    ['playbooks/*.yaml']      = 'yaml.ansible',
    ['playbooks/*.yml']       = 'yaml.ansible',
    ['roles/**/*.yml']        = 'yaml.ansible',
    ['~/.tmux.conf.d/*.conf'] = 'tmux',
    ['~/.tmux.conf']          = 'tmux',
    ['*.hcl']                 = 'hcl'
  }
})
