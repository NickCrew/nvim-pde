-- lualine

local vim = vim
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local ts_symbol = "綠TS"

local progress_symbols = {
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

local diff_symbols = {
	added = " ",
	modified = "柳",
	removed = " ",
}

local diagnostic_symbols = {
	error = " ",
	warn = " ",
	info = " ",
	hint = " ",
}

local colors = {
	yellow = "#ecbe7b",
	yellow_1 = "#ff9640",
	grey = "#2c323c",
	white = "#bbc2cf",
	cyan = "#008080",
	blue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	darkblue = "#51afef",
	red = "#ec5f67",
}
local diagnostic_colors = {
	color_info = { fg = colors.green },
	color_error = { fg = colors.red },
	color_warn = { fg = colors.orange },
}

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

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function window()
	return vim.api.nvim_win_get_number(0)
end

-- CUSTOM COMPONENT SEPARATORS AND OPTIONS
local not_empty = { cond = conditions.buffer_not_empty() }
local padded = { padding = { left = 1, right = 1 } }

local ts = function()
	return function()
		local b = vim.api.nvim_get_current_buf()
		if next(vim.treesitter.highlighter.active[b]) then
			return ts_symbol
		end
		return ""
	end
end

local function endcap()
	return function()
		return "▊"
	end
end

local function divider_dot()
	return function()
		return "•"
	end
end
local function divider()
	return function()
		return "⁞"
	end
end

local function spacer()
	return function()
		return "%="
	end
end

local progress_meter = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = progress_symbols
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end


-- LUALINE CONFIG
local config = {
	options = {
		theme = "auto",
		icons_enabled = true,
		disabled_filetypes = {},
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode" } },
		lualine_b = { { "branch", icon = "" } },
		lualine_c = {

			{
				"diff",
				source = diff_source,
				symbols = diff_symbols,
				diff_color = {},
				cond = conditions.hide_in_width,
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = diagnostic_symbols,
				diagnostics_color = diagnostic_colors,
			},
		},
		lualine_x = {
            {"aerial"},
			{ "filetype", not_empty },
			{ "encoding", not_empty },
			{ ts(), cond = conditions.hide_in_width },
		},
		lualine_y = {
		},
		lualine_z = { { "location" }, { "progress" }, {window},},
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
		"quickfix",
		"fern",
		"aerial",
		"toggleterm",
		"nvim-dap-ui",
		"mundo",
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end


--ins_left(spacer())
ins_left({"tabs"})

--
-- LEFT SIDE BEGIN
--


lualine.setup(config)
