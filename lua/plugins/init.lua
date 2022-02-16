-- lua/core/plugins.lua
--
local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/'wbthomason/packer.nvim", install_path
    })
end

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

return packer.startup({
    function(use)
        -- Packer itself
        use({"wbthomason/packer.nvim"})

        -- Reload Noevim
        use({"famiu/nvim-reload"})

        -- Better filetype detection and definitions
        use({"nathom/filetype.nvim"})

        use({
            "knubie/vim-kitty-navigator",
            run = "cp ./*.py ~/.config/kitty/",
            disable = true
        })

        -- Fix weirdness with cursor/hover delay
        use({"antoinemadec/FixCursorHold.nvim"})

        -- Cool icons
        use({"kyazdani42/nvim-web-devicons"})

        -- Improve % movement
        use({"andymass/vim-matchup"})

        -- RESTful API and HTTP Client
        use({
            "NTBBloodbath/rest.nvim",
            config = function() require("plugins.config.rest") end
        })

        -- less jarring buffer open close
        use({
            "luukvbaal/stabilize.nvim",
            config = function() require("stabilize").setup() end
        })

        use({"gennaro-tedesco/nvim-peekup"})

        -- Popup preview window for LSP
        use({
            "rmagatti/goto-preview",
            event = 'BufEnter',
            config = function() require("goto-preview").setup({}) end
        })

        -- Better quickfix window
        use({
            "kevinhwang91/nvim-bqf",
            ft = "qf",
            config = function() require("bqf").setup() end
        })

        -- Fuzzy finder binary
        use({"junegunn/fzf", run = function() vim.fn["fzf#install"]() end})

        -- Better mark-based navigation
        use({
            "ThePrimeagen/harpoon",
            before = "telescope.nvim",
            config = function() require("plugins.config.harpoon") end
        })

        -- Task runner supporting VS Code's launch.json
        use({
            "EthanJWright/vs-tasks.nvim",
            after = "telescope.nvim",
            config = function()
                require("vstask").setup({use_harpoon = true})
            end
        })

        -- Tag and symbol sidebar
        use({"liuchengxu/vista.vim", opt = true, disable = true})
        use({
            "stevearc/aerial.nvim",
            after = "telescope.nvim",
            config = function() require('plugins.config.aerial') end
        })

        ---- Language Server Support
        use({
            "neovim/nvim-lspconfig",
            event = 'BufEnter',
            requires = {
                "RishabhRD/popfix", "jubnzv/virtual-types.nvim",
                "ray-x/lsp_signature.nvim", "williamboman/nvim-lsp-installer",
                "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
                "jose-elias-alvarez/nvim-lsp-ts-utils", "folke/lsp-colors.nvim",
                "nvim-lua/lsp-status.nvim", "simrat39/rust-tools.nvim"
            },
            config = function() require("lsp") end
        })

        -- Show status of language server loading in buffer
        use({
            "j-hui/fidget.nvim",
            event = 'BufEnter',
            config = function() require("fidget").setup() end
        })

        -- Popup menu with recommendations
        use({"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu"})

        -- Show a lightbulb in the signcolumn when code actions are available
        use({"kosayoda/nvim-lightbulb"})

        -- Refactoring based on treesitter
        use({
            "ThePrimeagen/refactoring.nvim",
            requires = {
                {"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}
            },
            config = function() require("refactoring").setup({}) end
        })

        use({"bfredl/nvim-luadev"})

        use({"Shatur/neovim-session-manager", disable = true})

        use({"andrewradev/switch.vim"})

        use({"wellle/targets.vim"})

        -- Syntax highlighting and parsiging
        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                "p00f/nvim-ts-rainbow", "romgrk/nvim-treesitter-context",
                "nvim-treesitter/playground",
                "RRethy/nvim-treesitter-textsubjects",
                "nvim-treesitter/nvim-treesitter-textobjects", {
                    "nvim-treesitter/playground",
                    cmd = {
                        "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor"
                    }
                }
            },
            run = ":TSUpdate",
            config = function() require("plugins.config.treesitter") end
        })

        -- Better Terminal handling
        use({
            "akinsho/nvim-toggleterm.lua",
            cmd = "ToggleTerm",
            config = function() require("plugins.config.toggleterm") end
        })

        use({'famiu/bufdelete.nvim'})

        -- Search and command palette
        use({
            "lazytanuki/nvim-mapper",
            config = function()
                require("nvim-mapper").setup({
                    no_map = false,
                    search_path = os.getenv("HOME") .. "/.config/nvim/lua",
                    action_on_enter = "definition"
                })
            end,
            before = "telescope.nvim"
        })

        -- Telescope plugins
        use({
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "nvim-telescope/telescope-frecency.nvim",
            "jvgrootveld/telescope-zoxide",
            "nvim-telescope/telescope-live-grep-raw.nvim",
            "nvim-telescope/telescope-github.nvim",
            {
                "nvim-telescope/telescope-dap.nvim",
                requires = "mfussenegger/nvim-dap"
            },
            before = "telescope.nvim"
        })

        -- Alternative Graphical Debugger

        use({"nvim-telescope/telescope-vimspector.nvim"})
        use({
            "puremourning/vimspector",
            requires = {"nvim-telescope/telescope-vimspector.nvim"},
            config = function() require("plugins.config.vimspector") end,
            opt = true,
            disable = false
        })

        -- Enhance LSP Diagnostics
        use({
            "folke/trouble.nvim",
            before = "telescope.nvim",
            config = function() require("trouble").setup() end
        })

        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim",
                "tami5/sqlite.lua",
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
                "nvim-telescope/telescope-symbols.nvim",
                "nvim-telescope/telescope-ui-select.nvim",
                {"mrjones2014/dash.nvim", run = "make install"}
            },
            config = function() require('plugins.config.telescope') end
        })

        -- Python plugin for nvim-dap debugger
        use({
            "mfussenegger/nvim-dap-python",
            ft = "python",
            requires = {"mfussenegger/nvim-dap"},
            config = function()
                require("dap-python").setup(
                    "~/.pyenv/versions/debugpy/bin/python")
            end
        })

        -- Easy installation of debug adapters and configurations
        use({
            "Pocco81/DAPInstall",
            config = function()
                local di = require("dap-install")
                di.config("jsnode", {}, "python", "codelldb")
            end
        })

        -- Debug Neovim Lua
        use({
            "jbyuki/one-small-step-for-vimkind",
            after = "nvim-dap",
            config = function()
                local dap = require("dap")
                dap.configurations.lua = {
                    {
                        type = "nlua",
                        request = "attach",
                        name = "Attach to running Neovim instance",
                        host = function()
                            local value = vim.fn.input("Host [127.0.0.1]: ")
                            if value ~= "" then
                                return value
                            end
                            return "127.0.0.1"
                        end,
                        port = function()
                            local val = tonumber(vim.fn.input("Port: "))
                            assert(val, "Please provide a port number")
                            return val
                        end
                    }
                }

                dap.adapters.nlua = function(callback, config)
                    callback({
                        type = "server",
                        host = config.host,
                        port = config.port
                    })
                end
            end
        })

        -- Graphical debugger compatible with VS Code
        use({"mfussenegger/nvim-dap"})

        -- Show debug values as virtual text in the buffer
        use({
            "theHamsta/nvim-dap-virtual-text",
            requires = {"mfussenegger/nvim-dap"},
            config = function()
                require("nvim-dap-virtual-text").setup()
            end
        })

        -- User interface for DAP (auto-launch)
        use({
            "rcarriga/nvim-dap-ui",
            requires = {"mfussenegger/nvim-dap"},
            config = function()
                require("dapui").setup()
                -- -- -- Dap UI will open automatically
                -- local dap, dapui = require("dap"), require("dapui")
                -- dap.listeners.after.event_initialized["dapui_config"] =
                --     function() dapui.open() end
                -- dap.listeners.before.event_terminated["dapui_config"] =
                --     function() dapui.close() end
                -- dap.listeners.before.event_exited["dapui_config"] = function()
                --     dapui.close()
                -- end
            end
        })

        -- Gnu Debugger
        use({"sakhnik/nvim-gdb", run = "bash ./install.sh"})

        -- Test Runner
        use({
            "rcarriga/vim-ultest",
            ft = {"python"},
            requires = {"vim-test/vim-test", ft = {"python"}},
            run = ":UpdateRemotePlugins"
        })

        -- Run any code snippet
        use({
            "michaelb/sniprun",
            run = "bash ./install.sh",
            config = function()
                require("sniprun").setup({
                    selected_interpreters = {"Python"},
                    repl_enable = {"Python"}
                })
            end
        })

        -- Interactive scratchpad
        use({"metakirby5/codi.vim"})

        -- Marks and Bookmarks
        use({
            "chentau/marks.nvim",
            config = function() require("plugins.config.marks") end
        })

        -- AI completion source
        use({
            "tzachar/cmp-tabnine",
            run = "./install.sh",
            requires = "hrsh7th/nvim-cmp",
            config = function()
                local tabnine = require("cmp_tabnine.config")
                tabnine:setup({
                    max_lines = 1000,
                    max_num_results = 20,
                    sort = true,
                    run_on_every_keystroke = true,
                    snippet_placeholder = "..",
                    ignored_file_types = { -- default is not to ignore
                        -- uncomment to ignore in lua:
                        -- lua = true
                    }
                })
            end
        })

        -- Completion and Snippets
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                -- "hrsh7th/cmp-vsnip",
                "hrsh7th/cmp-cmdline", "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua", "onsails/lspkind-nvim"
            },
            config = function() require("plugins.config.completion") end
        })

        -- Lua-based snippet engine
        use({"L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"})

        -- Telescope extension for LuaSnip
        use({
            "benfowler/telescope-luasnip.nvim",
            before = "telescope",
            module = "telescope._extensions.luasnip" -- if you wish to lazy-load
        })

        -- VS Code snippets for various languages
        use({
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").load()
            end
        })

        use({"b0o/schemastore.nvim"})

        use({"mattn/vim-gist"})

        use({
            "ruifm/gitlinker.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function() require("gitlinker").setup() end
        })

        -- Local Git integration
        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.config.gitsigns").config()
            end
        })

        -- Show inline git messages
        use({"rhysd/git-messenger.vim", cmd = "GitMessenger"})

        -- Github remote integration
        use({
            "pwntester/octo.nvim",
            requires = {
                "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim",
                "kyazdani42/nvim-web-devicons"
            },
            config = require("plugins.config.octo").config()
        })

        -- File tree sidebar
        use({
            "kyazdani42/nvim-tree.lua",
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function() require("plugins.config.nvim-tree") end
        })

        -- Status bar
        use({
            "nvim-lualine/lualine.nvim",
            config = function() require("plugins.config.lualine") end
        })

        -- Buffer/tab bar
        use({
            "akinsho/bufferline.nvim",
            config = function() require("plugins.config.bufferline") end
        })

        -- Colorizer hex colors
        use({
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup({
                    "css", "scss", "javascript", "javascriptreact",
                    "typescript", "typescriptreact", "html"
                })
            end
        })

        -- Indent Guides
        use({
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("plugins.config.indent-blankline")
            end
        })

        -- Enhanced comments
        use({
            "folke/todo-comments.nvim",
            config = function()
                require("plugins.config.todo-comments")
            end
        })

        -- Pretty notification windows/popups
        use({
            "rcarriga/nvim-notify",
            config = function() require("plugins.config.nvim-notify") end
        })

        -- Split file explorer
        use({
            "lambdalisue/fern.vim",
            requires = {
                "yuki-yano/fern-preview.vim", "lambdalisue/fern-hijack.vim",
                "lambdalisue/nerdfont.vim",
                "lambdalisue/fern-renderer-nerdfont.vim",
                "lambdalisue/fern-git-status.vim",
                "lambdalisue/fern-bookmark.vim"
            }
        })

        -- Splash Screen/Dashboard
        use({
            "goolord/alpha-nvim",
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function() require("plugins.config.dashboard") end
        })

        -- FLoating command line
        use({
            "numtostr/FTerm.nvim",
            config = function() require('plugins.config.fterm') end
        })

        -- Run commands in an instant
        use({
            "VonHeikemen/fine-cmdline.nvim",
            requires = {"MunifTanjim/nui.nvim"}
        })

        -- Index search results
        use(require('plugins.config.hslens'))

        -- Move code easily
        use({"matze/vim-move"})

        -- Keybinding helper
        use({
            "folke/which-key.nvim",
            config = function() require("plugins.config.which-key") end
        })

        -- Better quickfix window
        use({
            "phaazon/hop.nvim",
            config = function()
                require("hop").setup({
                    case_insensitive = true,
                    char2_fallback_key = "<CR>"
                })
            end
        })

        -- Movement
        use({"chaoren/vim-wordmotion"})

        -- Formatting
        use({"sbdchd/neoformat"})

        -- Easy commenting
        use({"tpope/vim-commentary"})

        -- Improved history with tree-style viewer
        use({"simnalamburt/vim-mundo"})

        -- Better pane navigation
        use({
            "numToStr/Navigator.nvim",
            config = function() require("Navigator").setup() end
        })

        -- Help Remember stuff
        use({
            "sudormrfbin/cheatsheet.nvim",
            opt = true,
            cmd = 'CheatSheet',
            config = function()
                require("cheatsheet").setup()
                require('telescope').load_extension("cheatsheet")
            end
        })

        -- Project manager
        use({
            "ahmedkhalf/project.nvim",
            config = function() require("project_nvim").setup() end
        })

        -- Find matching pairs
        use({
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup({}) end
        })

        -- Wrapping/delimiters
        use({"machakann/vim-sandwich"})

        -- Generate docs
        use({
            "danymat/neogen",
            requires = "nvim-treesitter/nvim-treesitter",
            config = function()
                require("neogen").setup({enabled = true})
            end
        })

        -- Smooth Scrolling
        use({
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup({easing_function = "quadratic"})
            end
        })

        -- Markdown support with live preview inside nvim
        use({"ellisonleao/glow.nvim"})

        -- Themes

        use({"rose-pine/neovim", as = "rose-pine"})

        use({"mhartington/oceanic-next"})

        use({"ellisonleao/gruvbox.nvim"})

        use({"luisiacc/gruvbox-baby", branch = "main"})

        use({"folke/tokyonight.nvim", branch = "main"})

        if packer_bootstrap then require("packer").sync() end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({border = 'single'})
            end
        }
    }
})
