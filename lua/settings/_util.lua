
local M = {}

M.npde_mk_abbrev = function(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

local icons = require("settings._icons")

M.get_codicons = function(entry, vim_item)
      local lspkind = require("lspkind")
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      vim_item.menu = icons.lsp[entry.source.name]
      return vim_item
end

return M
