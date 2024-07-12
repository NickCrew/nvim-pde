local function getcwd() cwd  = vim.fn.getcwd()
end
return {

  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  lazy = true,
  opts = {
    theme = 'hyper',
    disable_move = true,
    change_to_vsc_root = true,
    config = {
      header = { "Hello from Neovim" },
      week_header = {
        enable = true,
        -- append = { 
        --   "",
        --   " " .. vim.fn.getcwd()
        -- }
      },
      footer = function()
        local info = {}
        local fortune = require("fortune").get_fortune()
        local footer = vim.list_extend(info, fortune)
        return footer
      end,
      shortcut = {
        {
          desc = 'New',
          icon = '  ',
          group = 'DiagnosticError',
          action = 'new',
          key = 'n',
        },
        {
          desc = "Explore",
          icon = "פּ ",
          action = "Neotree reveal",
          key = 'e',
        },
        {
          desc = 'Find',
          icon = '  ',
          group = '@number',
          action = 'Telescope smart_open',
          key = 'f',
        },
        {
            desc = "Changes",
            icon = " ",
            group = "Variable",
            key = 's',
            action = "Neogit"
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
  dependencies = { { 'nvim-tree/nvim-web-devicons', {
    "rubiin/fortune.nvim",
    opts = {
      display_format = "mixed",
    }
  } } }
}
