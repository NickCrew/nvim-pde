-- Custom file type definitions
vim.filetype.add({
  pattern = {
    ['*.adoc']                = 'asciidoc',
    ['*.asc']                 = 'asciidoc',
    ['.git*']                 = 'gitconfig',
    ['.gitconfig']            = 'gitconfig',
    ['~/.config/git/*']       = 'gitconfig',
    ['*.snippets']            = 'snippets',
    ['playbooks/*.yaml']      = 'yaml.ansible',
    ['playbooks/*.yml']       = 'yaml.ansible',
    ['roles/**/*.yml']        = 'yaml.ansible',
    ['~/.tmux.conf.d/*.conf'] = 'tmux',
    ['~/.tmux.conf']          = 'tmux',
    ['*.json.j2']             = 'json',
    ['Dockerfile-*']          = 'Dockerfile',
    ['*.template']            = 'json'

  }
})
