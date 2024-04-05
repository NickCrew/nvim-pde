return {

    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    lazy = true,
    opts = {
      theme = 'hyper',
      disable_move = true,
      change_to_vsc_root = true,
      config = {
        header = {"Hello from Neovim"},
        week_header = {
          enable = true,
        },
footer = function()
  local info = {}
  local fortune = require("fortune").get_fortune()
  local footer = vim.list_extend(info, fortune)
  return footer
  end,
        shortcut = {
        {
            desc = 'Find Files',
            icon = '  ',
            group = '@number',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = 'Search in Files',
            icon = " ",
            action = 'Telescope live_grep',
            group = '@keyword',
            key = 'g',
          },
          {
            desc = 'Bookmarks',
            icon = '  ',
            group = 'DashboardShortCut',
            action = 'Telescope harpoon marks',
            key = 'm'
          },
          {
            desc = 'Plugins',
            icon = '  ',
            group = 'DiagnosticHint',
            action = 'Lazy',
            key = 'l'
          },
        },
      },
    },
    dependencies = { { 'nvim-tree/nvim-web-devicons' , {"rubiin/fortune.nvim", config = true} }}
  }
