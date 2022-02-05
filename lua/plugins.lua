-- lua/plugins.lua
--

-- Detect changes to this file and run :PackerCompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local packer_bootstrap = false
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function(use)
  -- Packer itself
  use({ "wbthomason/packer.nvim" })

  -- Do more faster
  use({ "lewis6991/impatient.nvim" })
  use({ "dstein64/vim-startuptime" })
  use({ "famiu/nvim-reload" })

  -- Language Support
  use(require("configure.lspconfig"))
  use(require("configure.treesitter"))

  -- Search and command palette
  use {
    "lazytanuki/nvim-mapper",
    config = function() require("nvim-mapper").setup{
require("nvim-mapper").setup({
    -- do not assign the default keymap (<leader>MM)
    no_map = false,
    -- where should ripgrep look for your keybinds definitions.
    -- Default config search path is ~/.config/nvim/lua
    search_path = os.getenv("HOME") .. "/.config/nvim/lua",
    -- what should be done with the selected keybind when pressing enter.
    -- Available actions:
    --   * "definition" - Go to keybind definition (default)
    --   * "execute" - Execute the keybind command
    action_on_enter = "definition",
})
    } end,
    before = "telescope.nvim"
}
use {
    "nvim-telescope/telescope-vimspector.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "jvgrootveld/telescope-zoxide",
    "nvim-telescope/telescope-github.nvim",
    before = "telescope.nvim"
}
  use(require("configure.nvim-telescope"))

  -- Debugging
  use(require('debuggers.dap.nvim-dap'))
  use(require('debuggers.dap.nvim-dap-install'))
  use(require('debuggers.dap.nvim-dap-python'))
  use(require('debuggers.dap.nvim-dap-telescope'))
  use(require('debuggers.vimspector'))
  use(require('debuggers.gdb'))
  use(require('debuggers.run'))
  use(require('debuggers.tests'))

  -- Marks and Bookmarks
  use(require("configure.marks"))

  -- Completion
  use(require("configure.completion"))

  -- Git integration
  use(require("configure.git"))

  -- File drawer
  use(require("configure.nvim-tree"))

  -- Indent guides
  use(require("configure.indent-blankline"))

  -- Fancy status bar
  use(require("configure.lualine"))

  -- Buffer management and bar
  use(require("configure.bufferline"))

  -- Show inline color labels
  use(require("configure.colorizer"))

  -- Enhanced comments
  use(require("configure.todo-comments"))

  -- Nice notifications
  use(require("configure.nvim-notify"))

  -- Splash Screen
  use(require("configure.dashboard"))

  -- Tag and symbol sidebar
  use ({ 'liuchengxu/vista.vim' })


  -- FLoating command line
  use ({'voldikss/vim-floaterm'})
  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }

  -- Index search results
  use ({
    'kevinhwang91/nvim-hlslens',
    branch = 'main',
    keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
    config = function ()
      require('hlslens').setup({
          calm_down = true,
          nearest_only = true,
      })
    end
  })

  -- Move code easily
  use({
    "matze/vim-move",
    setup = function()
      vim.g.move_key_modifier = "S" -- Shift
    end,
  })

  -- Keybinding helper
  use(require("configure.which-key"))

  -- Better quickfix window
  use({
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({
        case_insensitive = true,
        char2_fallback_key = "<CR>",
      })

    end,
  })

  -- Movement
  use({ "chaoren/vim-wordmotion" })

  -- Formatting
  use({ "sbdchd/neoformat" })

  -- Easy commenting
  use({ "tpope/vim-commentary" })

  -- Improved history with tree-style viewer
  use({ "simnalamburt/vim-mundo" })

  -- Better pane navigation
  use({
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup()
    end,
  })

  -- Help Remember stuff
  use({
    "sudormrfbin/cheatsheet.nvim",
    config = function()
      require("cheatsheet").setup()
    end,
  })

  -- Project manager
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  })

  -- Wrapping/delimiters
  use({
    "machakann/vim-sandwich",
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end,
    },
  })

  -- Generate docs
  use({
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        enabled = true,
      })
    end,
  })

  -- Smooth Scrolling
  use({
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        easing_function = "quadratic",
      })
    end,
  })

  -- Markdown
  use({
    "ellisonleao/glow.nvim",
    config = function()
      vim.g.glow_binary_path = vim.env.HOME .. "/bin"
    end,
  })

  -- Themes
  use({ "rebelot/kanagawa.nvim" })
  use({ "luisiacc/gruvbox-baby" })
  use({ "folke/tokyonight.nvim", branch = "main" })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
