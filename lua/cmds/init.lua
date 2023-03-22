
require("cmds.auto")
require("cmds.user")

-- load abbreviations
local abbrevs = require("cmds.abbrev")
for _, abbrev in ipairs(abbrevs) do
  vim.api.nvim_cmd({
    cmd = "cnoreabbrev",
    args = abbrev,
  }, {})
end




