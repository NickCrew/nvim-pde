return {
  {
    name = "+navigation",
    ["["] = {
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      "Previous Harpoon Mark",
    },
    ["]"] = {
      "<cmd>lua require('harpoon.ui').nav_next()<cr>",
      "Next Harpoon Mark",
    },
    a = {
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      "Add Harpoon Mark",
    },

    h = {
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      "Harpoon Quick Menu",
    },
    c = {
      "<cmd>cclose<cr>",
      "Close Quickfix",
    },
    ["1"] = {
      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
      "Harpoon 1",
    },
    ["2"] = {
      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
      "Harpoon 2",
    },
    ["3"] = {
      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
      "Harpoon 3",
    },
    ["4"] = {
      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
      "Harpoon 4",
    },
    j = {
      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
      "Harpoon 1",
    },
    k = {
      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
      "Harpoon 2",
    },
    l = {
      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
      "Harpoon 3",
    },
    [";"] = {
      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
      "Harpoon 4",
    },
    t = {
      ["1"] = {
        "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",
        "Terminal 1",
      },
      ["2"] = {
        "<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>",
        "Terminal 2",
      },
      ["3"] = {
        "<cmd>lua require('harpoon.term').gotoTerminal(3)<cr>",
        "Terminal 3",
      },
    },
  }
}
