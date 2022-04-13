-- lua/plugins.lua
--
local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/'wbthomason/packer.nvim",
		install_path,
	})
end

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup({
	function(use)
		-- Packer itself
		use({ "wbthomason/packer.nvim" })

		-- Reload Noevim
		use({ "famiu/nvim-reload" })

		-- Fix weirdness with cursor/hover delay
		use({ "antoinemadec/FixCursorHold.nvim" })

		-- Cool icons
		use({ "kyazdani42/nvim-web-devicons" })

		-- Improve % movement
		use({ "andymass/vim-matchup" })

		-- RESTful API and HTTP Client
		use({
			"NTBBloodbath/rest.nvim",
			config = function()
				require("rest-nvim").setup({
					result_split_horizontal = false, -- Open request results in a horizontal split
					skip_ssl_verification = false, -- Skip SSL verification, useful for unknown certificates
					highlight = { -- Highlight request on run
						enabled = true,
						timeout = 150,
					},
					result = { -- toggle showing URL, HTTP info, headers at top the of result window
						show_url = true,
						show_http_info = true,
						show_headers = true,
					},
					jump_to_request = false, -- Jump to request line on run
					env_file = ".envrc",
					custom_dynamic_variables = {},
					yank_dry_run = true,
				})
			end,
		})

		-- Powerful find and replace
		use({
			"windwp/nvim-spectre",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("spectre").setup()
			end,
		})

		-- Smart delimiters and pairs
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({
					check_ts = true,
					ts_config = {
						lua = { "string", "source" },
						javascript = { "string", "template_string" },
						java = false,
					},
					disable_filetype = { "TelescopePrompt", "vim" },
					fast_wrap = {},
				})
			end,
		})

		-- less jarring buffer open close
		use({
			"luukvbaal/stabilize.nvim",
			config = function()
				require("nvim-autopairs").setup({
					check_ts = true,
					ts_config = {
						lua = { "string", "source" },
						javascript = { "string", "template_string" },
						java = false,
					},
					disable_filetype = { "TelescopePrompt", "vim" },
					fast_wrap = {},
				})
			end,
			before = "nvim-cmp",
		})

		-- Popup preview window for LSP
		use({
			"rmagatti/goto-preview",
			event = "BufEnter",
			config = function()
				local themes = require("telescope.themes")
				require("goto-preview").setup({
					width = 120, -- Width of the floating window
					height = 20, -- Height of the floating window
					border = {
						"↖",
						"─",
						"┐",
						"│",
						"┘",
						"─",
						"└",
						"│",
					}, -- Border characters of the floating window
					default_mappings = false, -- Bind default mappings
					debug = false, -- Print debug information
					opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
					resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
					post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
					references = { -- Configure the telescope UI for slowing the references cycling window.
						telescope = themes.get_dropdown({
							hide_preview = false,
						}),
					},
					focus_on_open = true, -- Focus the floating window when opening it.
					dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
					force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
					bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
				})
			end,
		})

		-- Better quickfix window
		use({
			"kevinhwang91/nvim-bqf",
			ft = "qf",
			config = function()
				require("bqf").setup()
			end,
		})

		-- Fuzzy finder binary
		use({
			"junegunn/fzf",
			run = function()
				vim.fn["fzf#install"]()
			end,
		})

		-- Better mark-based navigation
		use({
			"ThePrimeagen/harpoon",
			before = "telescope.nvim",
			config = function()
				require("harpoon").setup({
					global_settings = {
						save_on_toggle = true,
						save_on_change = true,
						enter_on_sendcmd = true,
						tmux_autoclose_windows = false,
						excluded_filetypes = { "harpoon" },
					},
					projects = require("config.projects"),
				})
			end,
		})

		-- Task runner supporting VS Code's launch.json
		use({
			"EthanJWright/vs-tasks.nvim",
			after = "telescope.nvim",
			config = function()
				require("vstask").setup({ use_harpoon = true })
			end,
		})

		-- Tag and symbol sidebar
		use({
			"stevearc/aerial.nvim",
			after = "telescope.nvim",
			config = function()
				require("aerial").setup({
					backends = { "lsp", "treesitter", "markdown" },
					close_behavior = "auto",
					default_direction = "prefer_right",
					min_width = 30,
					max_width = 50,
					post_jump_cmd = "normal! zz",
					lsp = {
						diagnostics_trigger_update = true,
						update_when_errors = true,
					},
					treesitter = {
						update_delay = 300,
					},
					markdown = {
						update_delay = 300,
					},
				})
				require("telescope").load_extension("aerial")
			end,
		})

		---- Language Server Support
		use({
			"neovim/nvim-lspconfig",
			event = "BufEnter",
			requires = {
				"RishabhRD/popfix",
				"lukas-reineke/lsp-format.nvim",
				"jubnzv/virtual-types.nvim",
				"ray-x/lsp_signature.nvim",
				"williamboman/nvim-lsp-installer",
				"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
				"jose-elias-alvarez/nvim-lsp-ts-utils",
				"folke/lsp-colors.nvim",
				"nvim-lua/lsp-status.nvim",
				"simrat39/rust-tools.nvim",
			},
			config = function()
				require("lsp")
			end,
		})

		-- Dim parts of your code you're not workingon
		use({
			"folke/twilight.nvim",
			config = function()
				require("twilight").setup({})
			end,
		})

		-- Show status of language server loading in buffer
		use({
			"j-hui/fidget.nvim",
			event = "BufEnter",
			config = function()
				require("fidget").setup()
			end,
		})

		-- Popup menu with recommendations
		use({
			"weilbith/nvim-code-action-menu",
			cmd = "CodeActionMenu",
		})

		-- Show a lightbulb in the signcolumn when code actions are available
		use({ "kosayoda/nvim-lightbulb" })

		-- Refactoring based on treesitter
		use({
			"ThePrimeagen/refactoring.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
			config = function()
				require("refactoring").setup({})
			end,
		})

		-- Lua/neovim development tools
		use({ "folke/lua-dev.nvim" })

		-- Smart Session Management
		use({
			"folke/persistence.nvim",
			event = "BufReadPre", -- this will only start session saving when an actual file was opened
			module = "persistence",
			config = function()
				require("persistence").setup()
			end,
		})

		-- switch things (e.g. true => false)
		use({ "andrewradev/switch.vim" })

		-- Syntax highlighting and parsiging
		use({
			"nvim-treesitter/nvim-treesitter",
			requires = {
				"p00f/nvim-ts-rainbow",
				"romgrk/nvim-treesitter-context",
				"nvim-treesitter/playground",
				"RRethy/nvim-treesitter-textsubjects",
				"nvim-treesitter/nvim-treesitter-textobjects",
				{
					"nvim-treesitter/playground",
					cmd = {
						"TSPlaygroundToggle",
						"TSHighlightCapturesUnderCursor",
					},
				},
			},
			run = ":TSUpdate",
			config = function()
				require("config.treesitter")
			end,
		})

		-- Easily delete buffer
		use({ "famiu/bufdelete.nvim" })

		-- Search and command palette
		use({
			"lazytanuki/nvim-mapper",
			config = function()
				require("nvim-mapper").setup({
					no_map = false,
					search_path = os.getenv("HOME") .. "/.config/nvim/lua",
					action_on_enter = "definition",
				})
			end,
			before = "telescope.nvim",
		})

		-- Enhance LSP Diagnostics
		use({
			"folke/trouble.nvim",
			before = "telescope.nvim",
			config = function()
				require("trouble").setup()
			end,
		})

		-- IPython
		use({ "bfredl/nvim-ipy" })

		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-lua/popup.nvim",
				"tami5/sqlite.lua",
				"LinArcX/telescope-env.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-media-files.nvim",
				"nvim-telescope/telescope-frecency.nvim",
				"jvgrootveld/telescope-zoxide",
				"nvim-telescope/telescope-github.nvim",
				{
					"nvim-telescope/telescope-dap.nvim",
					requires = "mfussenegger/nvim-dap",
				},
				"nvim-telescope/telescope-live-grep-raw.nvim",
				"nvim-telescope/telescope-node-modules.nvim",
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				"nvim-telescope/telescope-symbols.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
				{ "mrjones2014/dash.nvim", run = "make install" },
			},
			config = function()
				require("config.telescope")
			end,
		})

		-- Graphical debugger compatible with VS Code
		use({
			"mfussenegger/nvim-dap",
			requires = {
				"rcarriga/nvim-dap-ui",
				"theHamsta/nvim-dap-virtual-text",
				"mfussenegger/nvim-dap-python",
				"Pocco81/DAPInstall",
			},
			config = function()
				require("config.nvim-dap")
			end,
		})

		-- Gnu Debugger
		use({
			"sakhnik/nvim-gdb",
			run = "bash ./install.sh",
		})

		-- Test Runner
		use({
			"rcarriga/vim-ultest",
			requires = { "vim-test/vim-test" },
			run = ":UpdateRemotePlugins",
		})

		-- Run any code snippet
		use({
			"michaelb/sniprun",
			run = "bash ./install.sh",
			config = function()
				require("sniprun").setup({
					selected_interpreters = { "Python" },
					repl_enable = { "Python" },
				})
			end,
		})

		-- Interactive scratchpad
		use({ "metakirby5/codi.vim" })

		-- Marks and Bookmarks
		use({
			"chentau/marks.nvim",
			config = function()
				require("marks").setup({
					default_mappings = true,
					builtin_marks = { ".", "<", ">", "^" },
					cyclic = true,
					force_write_shada = false,
					refresh_interval = 250,
					sign_priority = {
						lower = 10,
						upper = 15,
						builtin = 8,
						bookmark = 20,
					},
					excluded_filetypes = {},
					bookmark_0 = {
						sign = "⚑",
						virt_text = "hello world",
					},
					mappings = {
						annotate = "<leader>ab",
					},
				})
			end,
		})

		-- Completion and Snippets
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				-- "hrsh7th/cmp-vsnip",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"ray-x/cmp-treesitter",
				"onsails/lspkind-nvim",
				"f3fora/cmp-spell",
				"lukas-reineke/cmp-rg",
				"petertriho/cmp-git",
			},
			config = function()
				require("config.completion")
			end,
		})

		-- Lua-based snippet engine
		use({
			"L3MON4D3/LuaSnip",
			before = "nvim-cmp",
			config = function()
				local luasnip = require("luasnip")
				luasnip.config.set_config({
					history = true,
					updateevents = "TextChanged,TextChangedI",
				})
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		})

		-- Completion extension for Luasnip and VSCode snippets
		use({
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			after = "nvim-cmp",
		})

		-- Telescope extension for LuaSnip
		use({
			"benfowler/telescope-luasnip.nvim",
			before = "telescope",
			module = "telescope._extensions.luasnip", -- if you wish to lazy-load
		})

		-- Store schema as json
		use({ "b0o/schemastore.nvim" })

		-- Use Github Command line
		use({
			"pwntester/octo.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
				"kyazdani42/nvim-web-devicons",
			},
			config = function()
				require("config.octo-nvim")
			end,
		})

		-- Generate shareable file links
		use({
			"ruifm/gitlinker.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("gitlinker").setup()
			end,
		})

		-- Local Git integration
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("config.gitsigns").config()
			end,
		})

		-- Show inline git messages
		use({
			"rhysd/git-messenger.vim",
			cmd = "GitMessenger",
		})

		----Status bar
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("config.lualine")
			end,
		})


		-- Tab bar
		use({
			"romgrk/barbar.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- Colorizer hex colors
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup({
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"html",
				})
			end,
		})

		-- Indent Guides
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("config.indent-blankline")
			end,
			disable = true,
		})

		-- Enhanced comments
		use({
			"folke/todo-comments.nvim",
			config = function()
				require("todo-comments").setup({
					merge_keywords = true,
					keywords = {
						WARNING = { icon = " ", color = "warning" },
					},
					highlight = {
						pattern = [[.*<(KEYWORDS)\s*]],
						keyword = "bg",
						comments_only = true,
					},
					search = {
						pattern = [[\b(KEYWORDS)\b]],
					},
				})
			end,
		})

		-- Pretty notification windows/popups
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					stages = "fade_in_slide_out",
					timeout = 1500,
					background_colour = "#2E3440",
					icons = {
						ERROR = "",
						WARN = "",
						INFO = "",
						DEBUG = "",
						TRACE = "✎",
					},
				})
			end,
		})

		-- Split file explorer
		use({
			"lambdalisue/fern.vim",
			requires = {
				"yuki-yano/fern-preview.vim",
				"lambdalisue/fern-hijack.vim",
				"lambdalisue/fern-mapping-quickfix.vim",
				"lambdalisue/nerdfont.vim",
				"lambdalisue/fern-renderer-nerdfont.vim",
				"lambdalisue/fern-git-status.vim",
				"lambdalisue/fern-bookmark.vim",
			},
		})

		-- Splash Screen/Dashboard
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("config.dashboard")
			end,
		})

		-- FLoating command line
		use({
			"numtostr/FTerm.nvim",
			config = function()
				require("FTerm").setup({
					border = "double",
					dimensions = {
						height = 0.5,
						width = 0.8,
					},
					blend = 20,
					auto_close = true,
				})
			end,
		})

		-- Nvim Terminal Multiplexer
		use({ "nikvdp/neomux" })

		-- Run commands in an instant
		use({
			"VonHeikemen/fine-cmdline.nvim",
			requires = { "MunifTanjim/nui.nvim" },
		})

		-- Move code easily
		use({ "matze/vim-move" })

		-- Keybinding helper
		use({
			"folke/which-key.nvim",
			config = function()
				require("config.which-key-nvim")
			end,
		})

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
			opt = true,
			cmd = "CheatSheet",
			config = function()
				require("cheatsheet").setup()
				require("telescope").load_extension("cheatsheet")
			end,
		})

		-- Project manager
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({
					manual_mode = false,
					update_cwd = true,
					update_focused_file = {
						enable = true,
						update_cwd = true,
					},
					patterns = {
						".git",
					},
					exclude_dirs = {
						"~/.config/*",
						"~/.local/*",
					},
				})
			end,
		})

		-- Wrapping/delimiters
		use({ "machakann/vim-sandwich" })

		-- Generate docs
		use({
			"danymat/neogen",
			requires = "nvim-treesitter/nvim-treesitter",
			config = function()
				require("neogen").setup({
					enabled = true,
					languages = {
						python = {
							template = {
								annotation_convention = "google_docstrings",
							},
						},
					},
				})
			end,
		})

		-- Smooth Scrolling
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup({ easing_function = "quadratic" })
			end,
		})

		-- Markdown support with live preview inside nvim
		use({ "ellisonleao/glow.nvim" })

		-------------------------------
		-- Themes
		-------------------------------
		use({ "rktjmp/lush.nvim" })
		use({
			"mcchrish/zenbones.nvim",
			requires = "rktjmp/lush.nvim",
		})
		use({ "rebelot/kanagawa.nvim" })
		use({ "EdenEast/nightfox.nvim" })
		use({ "rose-pine/neovim", as = "rose-pine" })
		use({ "folke/tokyonight.nvim", branch = "main" })
		use({
			"catppuccin/nvim",
			as = "catppuccin",
            config = function()
              require('config.themes.catppuccin')
          end
		})

		if Packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
