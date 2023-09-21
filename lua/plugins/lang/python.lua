return {
{ 
  "nvim-neotest/neotest",
  lazy = true,
  ft = 'python',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim"
  },
  opts = {
    adapters = {
      ["neotest-python"]= {}
    }
  }
},
{
	"linux-cultist/venv-selector.nvim",
    lazy = true,
    ft = 'pythonl',
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	opts = {
    -- Your options go here
    -- name = "venv",
    -- auto_refresh = false
  },
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {{
    -- Keymap to open VenvSelector to pick a venv.
		"<leader>vs", "<cmd>:VenvSelect<cr>",
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		"<leader>vc", "<cmd>:VenvSelectCached<cr>"
	}}
},
}
