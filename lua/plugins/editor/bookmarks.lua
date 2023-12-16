local mapping_flavors = {
  dubleader = {
      {"<leader><leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Quick Menu" },
        {"<leader><leader>[", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Harpoon Previous" },
        {"<leader><leader>]", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Harpoon Next" },
        {"<leader><leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon 1" },
        {"<leader><leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon 2" },
        {"<leader><leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon 3" },
        {"<leader><leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon 4" },
        {"<leader><leader>5", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon 5" },
        {"<leader><leader>6", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon 6" },
        {"<leader><leader>7", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon 7" },
        {"<leader><leader>8", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon 8" },
      },
      ctrlg = {
        {"<C-g>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add Harpoon Mark" },
        {"<C-g>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Quick Menu" },
        {"<C-g>[", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Harpoon Previous" },
        {"<C-g>]", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Harpoon Next" },
        {"<C-g>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon 1" },
        {"<C-g>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon 2" },
        {"<C-g>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon 3" },
        {"<C-g>;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon 4" },
      }
}


return {
  {
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = mapping_flavors.dubleader,
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      global_settings = {
        tabline = true,
        save_on_toggle = true,
        save_on_change = true,
        enter_on_sendcmd = true,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
      },
    }
  },
}
