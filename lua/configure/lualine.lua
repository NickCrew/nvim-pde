local vim = vim
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = require("core.extras.colors").lualine_astro

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		disabled_filetypes = { "NvimTree", "dashboard", "Outline" },
		component_separators = "",
		section_separators = "",
		theme = "tokyonight",
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 0, right = 0 },
})

ins_left({
	"branch",
	icon = "",
	color = { fg = "#ab8ee3", gui = "bold" },
	padding = { left = 2, right = 1 },
})

ins_left({
	"filetype",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = "bold" },
	padding = { left = 2, right = 1 },
})

ins_left({
	"diff",
	symbols = { added = " ", modified = "柳", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow_1 },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
	padding = { left = 2, right = 1 },
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = {
		error = " ",
		warn = " ",
		info = " ",
		hint = " ",
	},
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	padding = { left = 2, right = 1 },
})

ins_left({
	function()
		return "%="
	end,
})

ins_right({
	function()
		local b = vim.api.nvim_get_current_buf()
		if next(vim.treesitter.highlighter.active[b]) then
			return " 綠TS"
		end
		return ""
	end,
	color = {},
	padding = { left = 1, right = 0 },
	cond = conditions.hide_in_width,
})

ins_right({
	"location",
	padding = { left = 1, right = 1 },
})

ins_right({
	"progress",
	color = { fg = "#a4add3", gui = "none" },
	padding = { left = 0, right = 0 },
})

ins_right({
	function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = {
			"__",
			"▁▁",
			"▂▂",
			"▃▃",
			"▄▄",
			"▅▅",
			"▆▆",
			"▇▇",
			"██",
		}
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end,
	padding = { left = 1, right = 1 },
	color = { fg = "#6f92e0" },
	cond = nil,
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 1, right = 0 },
})

lualine.setup(config)
