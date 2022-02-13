local M = {}

M.appearance = {
	enable_transparency = false,
	default_style = "Dark", -- if system style cannot be determined
	theme = {
		default = "rose-pine",
		dark = "rose-pine",
		light = "rose-pine",
		lualine = "rose-pine",
	},
    dashboard = {
      header = require('extras.ascii-art').tx_header_2
    }
}

M.core = {
  python_path = os.getenv('HOME')..'/.pyenv/versions/neovim/bin/python'
}


return M
