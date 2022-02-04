local fn = vim.fn
local packer_bootstrap = false 
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer itself
  use {'wbthomason/packer.nvim'}

  -- Do more faster
  use { 'lewis6991/impatient.nvim' }
  use { 'dstein64/vim-startuptime' }

  -- Reload neovim
  use { 'famiu/nvim-reload' }


   -- Language Support
  use(require('configure.lspconfig'))
  use(require('configure.treesitter'))
  use { 'liuchengxu/vista.vim' }

  -- Diagnostics
  use(require('configure.trouble'))

  -- Search, Bookmarks, Fuzzy Finding
  use(require('configure.nvim-telescope'))
  use(require('configure.marks'))
  use(require('configure.hslens'))

  -- Debugging
  use(require('configure.dapinstall'))
  use(require('configure.sniprun'))
  use(require('configure.vimspector'))
  use {
  'sakhnik/nvim-gdb', 
  run = 'bash ./install.sh',
  }
  -- Running tests
  use {
    "rcarriga/vim-ultest",
    requires = {"vim-test/vim-test"},
    run = ":UpdateRemotePlugins"
  }

  -- Completion
  use(require('configure.completion'))

  -- Git integration
  use(require('configure.git'))

  -- File drawer
  use(require('configure.nvim-tree'))

  -- Indent guides
  use(require('configure.indent-blankline'))

  -- Fancy status bar
  use(require('configure.lualine'))

  -- Buffer management and bar
  use(require('configure.bufferline'))

  -- Show inline color labels
  use(require('configure.colorizer'))

  -- Enhanced comments
  use(require('configure.todo-comments'))

  -- Nice notifications
  use(require('configure.nvim-notify'))

  use(require('configure.dashboard'))

  -- Move code easily
  use {
    'matze/vim-move',
    setup = function()
      vim.g.move_key_modifier = 'S'  -- Shift
    end,
  }

  -- Keybinding helper
  use(require('configure.which-key'))

  -- Better quickfix window
  use {
    'phaazon/hop.nvim',
    requires = {
      'nvim-telescope/telescope-hop.nvim'
    },
    config = function()
      require('hop').setup({
        case_insensitive = true,
        char2_fallback_key = '<CR>',
      })

    require'telescope'.load_extension("hop")
    end
  }


  -- Movement
  use {'chaoren/vim-wordmotion'}

  -- Formatting
  use {'sbdchd/neoformat'}

  -- Easy commenting
  use {'tpope/vim-commentary'}

  -- Improved history with tree-style viewer
  use {'simnalamburt/vim-mundo'}

  -- Better pane navigation
  use {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
  }

  -- Help Remember stuff
  use {
    'sudormrfbin/cheatsheet.nvim',
    config = function()
      require('cheatsheet').setup()
    end
  }

  -- Project manager
  use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup()
  end
  }

  -- Wrapping/delimiters
  use {
    'machakann/vim-sandwich',
    {'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup({})
      end
    }
  }

  -- Generate docs
  use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
        require('neogen').setup {
            enabled = true
        }
    end
  }

  -- Smooth Scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function ()
      require("neoscroll").setup({
        easing_function = "quadratic",
      })
    end,
  }

  -- Markdown
  use {
    'ellisonleao/glow.nvim',
    config = function()
      vim.g.glow_binary_path = vim.env.HOME .. "/bin"
    end
  }


  -- Themes
  use { 'rebelot/kanagawa.nvim' }
  use { 'luisiacc/gruvbox-baby' }
  use { 'folke/tokyonight.nvim', branch = 'main' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
