local wk = require('which-key')

wk.register({
	name = "+harpoon",
	["1"] = {
		"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
		"Harpoon Mark 1",
	},
	["2"] = {
		"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
		"Harpoon Mark 2",
	},
	["3"] = {
		"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
		"Harpoon Mark 3",
	},
	["4"] = {
		"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
		"Harpoon Mark 4",
	},
	["5"] = {
		"<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
		"Harpoon Mark 5",
	},
	["6"] = {
		"<cmd>lua require('harpoon.ui').nav_file(6)<cr>",
		"Harpoon Mark 6",
	},
	["7"] = {
		"<cmd>lua require('harpoon.ui').nav_file(7)<cr>",
		"Harpoon Mark 7",
	},
	["8"] = {
		"<cmd>lua require('harpoon.ui').nav_file(8)<cr>",
		"Harpoon Mark 8",
	},
	["9"] = {
		"<cmd>lua require('harpoon.ui').nav_file(9)<cr>",
		"Harpoon Mark 9",
	},
	["j"] = {
		"<cmd>lua require('harpoon.ui').nav_next()<cr>",
		"Next Harpoon Mark",
	},
	["k"] = {
		"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
		"Previous Harpoon Mark",
	},
}, {
	prefix = "<leader><leader>",
})

