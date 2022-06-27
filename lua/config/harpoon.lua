-- lua/config/harpoon.lua
--

require("harpoon").setup({
  -- dynamic width menu
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  },
  global_settings = {
    save_on_toggle = true,
    save_on_change = true,
    enter_on_sendcmd = true,
    tmux_autoclose_windows = false,
    excluded_filetypes = { "harpoon" },
  },
})
