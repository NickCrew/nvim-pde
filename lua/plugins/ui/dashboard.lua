
return {
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        {
          desc = '󰊳 Plugins',
          group = '@property',
          action = 'Lazy',
          key = 'p'
        },
        {
          desc = " Browse",
          action = "Neotree toggle",
          key = "b"
        },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  },
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

}
