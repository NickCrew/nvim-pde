return {
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
					-- Fetch document symbols when LSP diagnostics update.
					-- If false, will update on buffer changes.
					diagnostics_trigger_update = true,

					-- Set to false to not update the symbols when there are LSP errors
					update_when_errors = true,
				},

				treesitter = {
					-- How long to wait (in ms) after a buffer change before updating
					update_delay = 300,
				},

				markdown = {
					-- How long to wait (in ms) after a buffer change before updating
					update_delay = 300,
				},
			})
			require("telescope").load_extension("aerial")
		end,
	}
