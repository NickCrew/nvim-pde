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
