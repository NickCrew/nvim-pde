return {
  {
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = {
        {"<C-g>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add Harpoon Mark" },
        {"<C-g>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Quick Menu" },
        {"<C-g>[", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Harpoon Previous" },
        {"<C-g>]", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Harpoon Next" },
        {"<C-g>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon 1" },
        {"<C-g>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon 2" },
        {"<C-g>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon 3" },
        {"<C-g>;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon 4" },
    },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      global_settings = {
        tabline = false,
        save_on_toggle = true,
        save_on_change = true,
        enter_on_sendcmd = true,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
      },
    }
  },
}
