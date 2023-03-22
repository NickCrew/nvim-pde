-- lualine

local vim = vim
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
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
local theme = "auto"
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
      removed = gitsigns.removed
    }
  end
end

local function window()
  return vim.api.nvim_win_get_number(0)
end

local config = {
	options = {
		disabled_filetypes = { "NvimTree", "dashboard", "Outline" },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
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
		"quickfix", "fern", "aerial", "toggleterm", "nvim-dap-ui", "mundo"
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
	-- color = { fg =  },
	padding = { left = 0, right = 0 },
})

ins_left({window})

ins_left({
  "mode",
})

ins_left({
	"branch",
	icon = "",
	padding = { left = 1, right = 1 },
})

ins_left({
	"diff",
    source = diff_source,
	symbols = { added = " ", modified = "柳", removed = " " },
	diff_color = {
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

-- ins_left({"lsp_progress"})


ins_right({
  "aerial"
})

ins_right({
	"filetype",
	cond = conditions.buffer_not_empty,
	padding = { left = 2, right = 1 },
})

ins_right({
  "encoding",
  cond = conditions.buffer_not_empty,
	padding = { left = 1, right = 1 },
})

ins_right({
	function()
		local b = vim.api.nvim_get_current_buf()
		if next(vim.treesitter.highlighter.active[b]) then
			return "綠TS"
		end
		return ""
	end,
	padding = { left = 1, right = 1 },
	cond = conditions.hide_in_width,
})


ins_right({
	"progress",
	padding = { left = 1, right = 1 },
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
	cond = nil,
})


ins_right({
	"location",
	padding = { left = 1, right = 1 },
})

ins_right({
	function()
		return "▊"
	end,
	padding = { left = 1, right = 1 },
})

lualine.setup(config)
