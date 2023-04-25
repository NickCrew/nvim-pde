-- lua/plugins/init.lua
--
-- Setup plugins

local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"antoinemadec/FixCursorHold.nvim",
		enabled = true,
	},

	{
		"RishabhRD/popfix",
		enabled = true,
	},

	{
		"MunifTanjim/nui.nvim",
		enabled = true,
	},

	{
		-- Git Integration
		"tpope/vim-fugitive",
		lazy = false,
		enabled = true,
	},

	{
		-- Full transparency
		"xiyaowong/transparent.nvim",
		lazy = true,
		enabled = false,
	},

	{
		-- Edit sandwiched textobjects
		"machakann/vim-sandwich",
		enabled = true,
	},

	{
		-- Extend % operator
		"andymass/vim-matchup",
		enabled = true,
	},

	{
		-- More useful word motions
		"chaoren/vim-wordmotion",
		enabled = true,
	},

	{
		-- Move lines and selections up and down
		"matze/vim-move",
		enabled = true,
	},

	{
		-- Icons and glyphs
		"kyazdani42/nvim-web-devicons",
		enabled = true,
	},

	{
		-- Syntax-aware commenting
		"tpope/vim-commentary",
		enabled = true,
	},

	{
		-- Flip values on/off
		"andrewradev/switch.vim",
		enabled = false,
	},

	{
		-- Schemas
		"b0o/schemastore.nvim",
		enabled = true,
	},

	{
		-- Colorscheme development
		"rktjmp/lush.nvim",
		enabled = false,
	},

	{
		-- Lua development tools
		"folke/lua-dev.nvim",
		lazy = true,
	},

	{
		-- Code scratch pad
		"metakirby5/codi.vim",
		enabled = false,
	},

	{
		-- Better undo control
		"simnalamburt/vim-mundo",
		enabled = true,
	},

	{
		-- Debug adapter protocol support
		"mfussenegger/nvim-dap",
		enabled = true,
	},

	{
		-- Markdown previewer
		"ellisonleao/glow.nvim",
		enabled = false,
	},

	{
		-- Live markdown preview
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		-- VS Code remote container support
		"chipsenkbeil/distant.nvim",
		lazy = true,
		enabled = false,
		config = function()
			require("distant").setup()
		end,
	},

	{
		-- Support for VS Code's task.json
		"EthanJWright/vs-tasks.nvim",
		lazy = true,
		enabled = true,
	},

	{
		-- VS Code container development support
		"esensar/nvim-dev-container",
		lazy = true,
		enabled = true,
		config = function()
			require("devcontainer").setup({})
		end,
	},

	{
		-- Python debugging
		"https://gitlab.com/HiPhish/debugpy.nvim",
		name = "debugpy.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	{
		-- Debug UI
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("config.dap_utils")
		end,
	},

	{
		-- Debugger virtual text
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("config.dap_virtual_text")
		end,
	},

	{
		-- python debuggin
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("config.dap_python")
		end,
	},

	{
		-- GDB
		"sakhnik/nvim-gdb",
		enabled = false,
		build = "bash ./install.sh",
	},

	{
		"https://git.sr.ht/~havi/telescope-toggleterm.nvim",
		lazy = true,
		event = "TermOpen",
		dependencies = {
			"akinsho/nvim-toggleterm.lua",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("toggleterm")
		end,
	},

	{
		-- clipboard history
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "tami5/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("config.neoclip")
			require("telescope").load_extension("neoclip")
		end,
	},

	{
		"0styx0/abbreinder.nvim",
		dependencies = {
			{
				"0styx0/abbremand.nvim",
				module = "abbremand", -- if want to lazy load
			},
		},
		config = function()
			require("config.abbreinder-nvim")
		end,
		event = "BufRead", -- if want lazy load
	},

	{
		"someone-stole-my-name/yaml-companion.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	},

	{
		-- LSP Symbol Drawer
		"stevearc/aerial.nvim",
		dependencies = { "telescope.nvim" },
		config = function()
			require("config.aerial")
			require("telescope").load_extension("aerial")
		end,
	},

	{
		-- Quick movements
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup({
				case_insensitive = true,
				char2_fallback_key = "<CR>",
			})
		end,
	},

	{
		"ggandor/flit.nvim",
		config = function()
			require("flit").setup({
				multiline = false,
			})
		end,
	},

	{
		-- Sneak/quick movements
		"ggandor/leap.nvim",
		dependencies = "tpope/vim-repeat",
		config = function()
			require("leap").set_default_keymaps()
		end,
	},

	{
		-- Hyperfast project navigation
		"ThePrimeagen/harpoon",
		dependencies = "telescope.nvim",
		config = function()
			require("config.harpoon")
		end,
	},

	{
		-- RESTful API and HTTP Client
		"NTBBloodbath/rest.nvim",
		config = function()
			require("config.rest")
		end,
	},

	{
		-- Smart delimiters and pairs
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end,
	},

	{
		-- Popup preview window for LSP
		"rmagatti/goto-preview",
		event = "BufEnter",
		config = function()
			require("config.gotopreview")
		end,
	},

	{
		-- Project Drawer
		"lambdalisue/fern.vim",
		dependencies = {
			"yuki-yano/fern-preview.vim",
			"lambdalisue/fern-hijack.vim",
			"lambdalisue/fern-mapping-quickfix.vim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/glyph-palette.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/fern-git-status.vim",
			"lambdalisue/fern-bookmark.vim",
		},
	},

	{
		-- Better quickfix window
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("bqf").setup()
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = {
			"javascript",
			"python",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"markdown",
			"lua",
		},
		config = function()
			require("config.null_ls")
		end,
	},

	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
			"weilbith/nvim-code-action-menu",
			"ray-x/lsp_signature.nvim",
			"simrat39/rust-tools.nvim",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
			"folke/lsp-colors.nvim",
			"nvim-lua/lsp-status.nvim",
			"kosayoda/nvim-lightbulb",
			"williamboman/nvim-lsp-installer",
		},
		event = "BufEnter",
		config = function()
			require("config.lsp")
		end,
	},

	{
		-- Dim parts of your code you're not workingon
		"folke/twilight.nvim",
		lazy = true,
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		config = function()
			require("twilight").setup({})
		end,
	},

	{
		-- Smart Session Management
		"folke/persistence.nvim",
		lazy = true,
        enabled = true,
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	},

	{
		"nvim-treesitter/playground",
		cmd = {
			"TSPlaygroundToggle",
			"TSHighlightCapturesUnderCursor",
		},
	},

	{
		-- Syntax highlighting and parsiging
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"romgrk/nvim-treesitter-context",
			"nvim-treesitter/playground",
			"nvim-treesitter/playground",
			"RRethy/nvim-treesitter-textsubjects",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},

	{
		-- Docstring generator
		"danymat/neogen",
		cmd = "Neogen",
		lazy = true,
		config = function()
			require("config.neogen")
		end,
	},

	{
		-- Code refactoring
		"ThePrimeagen/refactoring.nvim",
		dependencies = "telescope.nvim",
		config = function()
			require("refactoring").setup()
			require("telescope").load_extension("refactoring")
		end,
	},

	{
		-- treesitter based colorizing
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("config.colorizer")
		end,
	},

	{
		-- Enhance LSP Diagnostics
		"folke/trouble.nvim",
		dependencies = "telescope.nvim",
		config = function()
			require("config.trouble")
		end,
	},

	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = "mfussenegger/nvim-dap",
	},

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{
		-- Telescope
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"tami5/sqlite.lua",
			"LinArcX/telescope-env.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"jvgrootveld/telescope-zoxide",
			"nvim-telescope/telescope-github.nvim",
			"nvim-telescope/telescope-live-grep-raw.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-node-modules.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("config.telescope-nvim")
		end,
	},

	{
		-- AI chatbot
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		lazy = true,
        cmd = "ChatGPT",
		config = function()
			require("chatgpt").setup({})
		end,
	},
	{
		-- AI code completion
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
        lazy = true,
		config = function()
			require("config.copilot")
		end,
	},

	{
		-- Completion and Snippets
		"hrsh7th/nvim-cmp",
		dependencies = {
			"zbirenbaum/copilot-cmp",
			"zbirenbaum/copilot.lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"rcarriga/cmp-dap",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"saadparwaiz1/cmp_luasnip",
			"ray-x/cmp-treesitter",
			"onsails/lspkind-nvim",
			"f3fora/cmp-spell",
			"lukas-reineke/cmp-rg",
			"petertriho/cmp-git",
		},
		config = function()
			require("config.completion")
		end,
	},

	{
		-- Lua-based snippet engine
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("config.snippets")
		end,
	},

	{
		-- Find luasnip snippets using telescope
		"benfowler/telescope-luasnip.nvim",
		dependencies = {
			"telescope.nvim",
			"L3MON4D3/LuaSnip",
		},
	},

	{
		-- Github integration
		"pwntester/octo.nvim",
		cmd = "Octo",
		lazy = true,
		config = function()
			require("config.octo-nvim")
		end,
	},

	{
		-- git changes in sign column
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		-- Get links to github
		"ruifm/gitlinker.nvim",
		config = function()
			require("gitlinker").setup()
		end,
	},

	{
		-- Git worktree support
		"ThePrimeagen/git-worktree.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("git_worktree")
		end,
	},

	{
		---Status bars
		"akinsho/bufferline.nvim",
		config = function()
			require("config.buffline")
		end,
		enabled = true,
	},

	{
		"arkav/lualine-lsp-progress",
		dependencies = "lualine.nvim",
		enabled = false,
	},

	{
		"chrisgrieser/nvim-recorder",
		config = function()
			require("recorder").setup()
		end,
	},

	{
		"folke/noice.nvim",
		dependencies = {
			"telescope.nvim",
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
        enabled = true,
		config = function()
			require("config.noice")
			require("telescope").load_extension("noice")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("config.lualine")
		end,
	},

	{
		-- save useful cheatsheets
		"sudormrfbin/cheatsheet.nvim",
		lazy = true,
		cmd = "Cheatsheet",
		dependencies = { "telescope.nvim" },
		config = function()
			require("cheatsheet").setup()
			require("telescope").load_extension("cheatsheet")
		end,
	},

	{
		-- Pretty notification windows/popups
		"rcarriga/nvim-notify",
        enabled = true,
		config = function()
			require("config.notify")
		end,
	},

	{
		-- Project manager
		"ahmedkhalf/project.nvim",
        enabled = true,
		config = function()
			require("config.project")
		end,
	},

	{
		-- Splash Screen/Dashboard
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config.dashboard")
		end,
	},

	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = "MunifTanjim/nui.nvim",
	},

	{
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		lazy = true,
		branch = "main",
		config = function()
			require("config.toggle-term")
		end,
	},

	{
		"mrjones2014/legendary.nvim",
		dependencies = "which-key.nvim",
		lazy = true,
		enabled = false,
		config = function()
			require("legendary").setup({
				which_key = {
					auto_register = true,
				},
			})
		end,
	},

	{
		"folke/which-key.nvim",
        enabled = true,
		config = function()
			require("config.which-key-nvim")
		end,
	},

	{
		-- Smooth Scrolling
		"karb94/neoscroll.nvim",
        enabled = true,
		config = function()
			require("neoscroll").setup({
				easing_function = "quadratic",
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	{
		"williamboman/mason.nvim",
		lazy = true,
		enabled = false,
		build = ":MasonUpdate",
	},
})
