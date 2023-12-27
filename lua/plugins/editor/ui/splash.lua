return {
{
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    lazy = true,
    opts = {
      theme = 'hyper',
      disable_move = true,
      change_to_vsc_root = true,
      config = {
        week_header = {
          enable = true,
        },
        footer = {

        },
        shortcut = {
          {
            desc = 'New',
            icon = '  ',
            group = "@property",
            action = 'new',
            key = 'n'
          },
          {
            desc = 'Open',
            icon = '  ',
            group = '@number',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = "Browse",
            icon = "  ",
            group = '@label',
            action = "Neotree toggle",
            key = "b"
          },
          {
            desc = 'Search',
            icon = " ",
            action = 'Telescope live_grep',
            group = '@keyword',
            key = 'g',
          },
          {
            desc = 'Changes',
            icon = " ",
            action = 'Telescope git_status',
            group = 'DashboardShortCut',
            key = 'c',
          },
          {
            desc = 'Marks',
            icon = '  ',
            group = '@variable',
            action = 'Telescope marks',
            key = 'm'
          },
          {
            desc = 'Plugins',
            icon = '  ',
            group = 'DiagnosticHint',
            action = 'Lazy',
            key = 'p'
          },
        },
      },
    },
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
}
