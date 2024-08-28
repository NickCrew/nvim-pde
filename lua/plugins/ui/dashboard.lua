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
        dependencies = {
          "rubiin/fortune.nvim",
        },
        version      = false,
        opts         = {
          header = function()
           return  header .. "\n" ..  "שּ  Welcome Back, " .. vim.fn.system("echo ${USER}!")  ..  "\n" .. "  " .. vim.fn.getcwd() .. "\n" ..
          "  " .. vim.fn.system("git my | awk 'FNR==1' | cut -d '-' -f 1,2")
          end,
          footer =  function()
            return vim.fn.system("csfortune")
          end
        },
      enabled = true
      },
    {

      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      enabled = false,
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
      dependencies = {  'nvim-tree/nvim-web-devicons', 
        "rubiin/fortune.nvim",
      } 
    }
}

