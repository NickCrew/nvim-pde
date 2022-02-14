local vim = vim
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = require("style.colors.lualine").astro
local rosepine = require("style.colors.palettes").rose_pine_moon
local theme = "rose-pine"


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
		theme = theme
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
	extensions = {
		"quickfix", "fern"
	}
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
	color = { fg = rosepine.overlay },
	padding = { left = 0, right = 0 },
})

ins_left({
  "mode",
  color = { fg = rosepine.subtle }
})

ins_left({
	"branch",
	icon = "",
	color = { fg = rosepine.love, gui = "bold" },
	padding = { left = 2, right = 1 },
})

ins_left({
	"filetype",
	cond = conditions.buffer_not_empty,
	color = { fg = rosepine.text, gui = "bold" },
	padding = { left = 2, right = 1 },
})

ins_left({
	"diff",
	symbols = { added = " ", modified = "柳", removed = " " },
	diff_color = {
		added = { fg = rosepine.foam, },
		modified = { fg = rosepine.iris },
		removed = { fg = rosepine.love },
	},
	cond = conditions.hide_in_width,
	padding = { left = 2, right = 1 },
})

ins_left({
	"diagnostics",
	sources = { 
      "nvim_diagnostic" 
    },
	symbols = {
		error = " ",
		warn = " ",
		info = " ",
		hint = " ",
	},
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.orange },
		color_info = { fg = colors.green },
	},
	padding = { left = 2, right = 1 },
})

ins_left({
	function()
		return "%="
	end,
})

ins_right({
  "aerial"
})

ins_right({
	function()
		local b = vim.api.nvim_get_current_buf()
		if next(vim.treesitter.highlighter.active[b]) then
			return " 綠TS"
		end
		return ""
	end,
	color = { fg = rosepine.hi_high },
	padding = { left = 1, right = 0 },
	cond = conditions.hide_in_width,
})

ins_right({
	"location",
	padding = { left = 1, right = 1 },
})

ins_right({
	"progress",
	color = { fg = rosepine.pine,  gui = "none" },
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
	color = { fg = rosepine.pine },
	cond = nil,
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = rosepine.overlay },
	padding = { left = 1, right = 0 },
})

lualine.setup(config)
