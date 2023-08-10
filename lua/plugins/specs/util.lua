return {
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
    "williamboman/mason.nvim",
    lazy = true,
    enabled = false,
    build = ":MasonUpdate",
  },
  {
    -- RESTful API and HTTP Client
    "NTBBloodbath/rest.nvim",
    enabled = false,
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false, -- Open request results in a horizontal split
        skip_ssl_verification = true,    -- Skip SSL verification, useful for unknown certificates
        highlight = {
          -- Highlight request on run
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
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



}
