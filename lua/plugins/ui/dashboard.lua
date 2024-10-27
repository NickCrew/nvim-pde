local header = 
"  ________                    __ _  __" .. "\n" ..
' /_  __/ /_  ________  ____ _/ /| |/ /' .. "\n" ..
"  / / / __ \\/ ___/ _ \\/ __ / __/   / " .. "\n" ..
" / / / / / / /  /  __/ /_/ / /_/   |  " .. "\n" ..
"/_/ /_/ /_/_/   \\___/\\__,_/\\__/_/|_|  " .. "\n"

return {
      {
        "rubiin/fortune.nvim",
        enabled = true,
        opts = {
          display_format = "mixed",
        }
      },
      {
        'echasnovski/mini.starter',
        enabled = false,
        dependencies = {
          "rubiin/fortune.nvim",
        },
        version      = false,
        opts         = {
          header = function()
           return  header .. "\n" ..  "שּ  Hello, " .. vim.fn.system("echo ${USER}!")  ..  "\n" .. "It's " .. os.date("%Y-%m-%d %H:%M:%S") ..  "\nYou're in   " .. vim.fn.getcwd() 
          end,
          footer =  function()
            return vim.fn.system("csfortune")
          end
        },
      },
    {

      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      enabled = true,
      lazy = true,
      opts = {
        theme = 'hyper',
        disable_move = true,
        change_to_vsc_root = true,
        config = {
          header = { "Hello from Neovim" },
          week_header = {
            enable = true,
            append = {
              "",
              " " ..  vim.fn.getcwd()
            }
          },
          footer = function()
            local fortune = require("fortune").get_fortune()
            local info = {}
            return vim.list_extend(info, fortune)
          end,
          shortcut = {
            {
              desc = 'New',
              icon = '  ',
              group = 'DashboardDesc',
              action = 'new',
              key = 'n',
            },
            {
              desc = "Explore",
              icon = "פּ ",
              group = "DashboardKey",
              action = "Neotree reveal",
              key = 'e',
            },
            {
              desc = 'Find',
              icon = '  ',
              group = '@attribute',
              action = 'Telescope smart_open',
              key = 'f',
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
      dependencies = {  'nvim-tree/nvim-web-devicons', 
        "rubiin/fortune.nvim",
      } 
    }
}

