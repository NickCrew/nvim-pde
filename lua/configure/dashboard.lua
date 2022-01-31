return {
    'goolord/alpha-nvim',
    requires = { 
      'kyazdani42/nvim-web-devicons' 
    },
    config = function()
      local dashboard = require('alpha.themes.dashboard')
      local fortune = require('alpha.fortune')
      local alpha = require('alpha')
      local art = require('core.extras.ascii-art')

      local default_header = {
          "                                                     ",
          "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          "                                                     ",
      }

      -- Set header choice
      dashboard.section.header.val = art.tx_header_2
      -- Set menu
      dashboard.section.buttons.val = {
          dashboard.button( "f f", "  > Find File", ":Telescope find_files<CR>"),
          dashboard.button( "f p", "  > Find Project"   , ":Telescope projects<CR>"),
          dashboard.button( "z d", "  > Go To Folder", ":Telescope zoxide list<CR>"),
          dashboard.button( "u", "  > Update plugins" , ":PackerSync<CR>"),
          dashboard.button( "e", "  > New file" , ":enew <CR>"),
          dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
      }
      -- Set footer
      dashboard.section.footer.val = fortune()
      alpha.setup(dashboard.opts)
    end
}
