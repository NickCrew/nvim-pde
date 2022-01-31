local wk = require('which-key')
--
-- Prefix: None
-- Description: Manage and resize windows
wk.register({
	name = "+windows",
	["<M-j>"] = { "<C-w>j<C-w>_", "Move and Maximize Window Below" },
	["<M-h>"] = { "<C-w>h<C-w>|", "Move and Maximize Window Left" },
	["<M-k>"] = { "<C-w>k<C-w>_", "Move and Maximize Window Above" },
	["<M-l>"] = { "<C-w>l<C-w>|", "Move and Maximize Window Right" },
	["<M-=>"] = { "<C-w>=", "Restore Window Sizes" },
}, {})


