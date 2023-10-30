
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
          desc = '󰊳 Plugins',
          group = '@property',
          action = 'Lazy',
          key = 'p'
        },
        {
          desc = " Explorer",
          group = 'Number',
          action = "Neotree toggle",
          key = "e"
        },
        {
          icon = ' ',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Search',
          action = 'Telescope live_grep',
          grup = 'DiagnosticHint',
          key = 'g',
        },
      },
    },
  },
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

}
