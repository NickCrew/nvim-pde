return {
  {
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = {
        {"<leader><leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add Harpoon Mark" },
        {"<leader><leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Quick Menu" },
        {"<leader><leader>[", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Harpoon Previous" },
        {"<leader><leader>]", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Harpoon Next" },
        {"<leader><leader>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon 1" },
        {"<leader><leader>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon 2" },
        {"<leader><leader>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon 3" },
        {"<leader><leader>;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon 4" },
        {"<leader><leader>s", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Harpoon 5" },
        {"<leader><leader>d", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Harpoon 6" },
        {"<leader><leader>f", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Harpoon 7" },
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
