local M = {}

function M.default_config()
 local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      section_separators = "",
      component_separators = "",
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = {
        "filename",
        {
          ime_state,
          color = { fg = "black", bg = "#f46868" },
        },
        {
          spell,
          color = { fg = "black", bg = "#a7c080" },
        },
      },
      lualine_x = {
        "encoding",
        {
          "fileformat",
          symbols = {
            unix = "unix",
            dos = "win",
            mac = "mac",
          },
        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = {
        "location",
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
        },
        {
          trailing_space,
          color = "WarningMsg",
        },
        {
          mixed_indent,
          color = "WarningMsg",
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "quickfix" },
  })
end

function M.astro_config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local colors = require('core.colors').lualine_gruvbox

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
      theme = "gruvbox"
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
    color = { fg = colors.violet, gui = "bold" },
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
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
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
    function(msg)
      msg = msg or "Inactive"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return "Inactive"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local formatters = require("core.utils")
      local supported_formatters = formatters.list_registered_formatters(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      local linters = require("core.utils")
      local supported_linters = linters.list_registered_linters(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      return table.concat(buf_client_names, ", ")
    end,
    icon = " ",
    color = { gui = "none" },
    padding = { left = 0, right = 1 },
    cond = conditions.hide_in_width,
  })

  ins_right({
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return " 綠TS"
      end
      return ""
    end,
    color = { fg = colors.green },
    padding = { left = 1, right = 0 },
    cond = conditions.hide_in_width,
  })

  ins_right({
    "location",
    padding = { left = 1, right = 1 },
  })

  ins_right({
    "progress",
    color = { fg = colors.fg, gui = "none" },
    padding = { left = 0, right = 0 },
  })

  ins_right({
    function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 1, right = 1 },
    color = { fg = colors.yellow, bg = colors.grey },
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
end

return M
