return {
{
    -- Quick movements
    "phaazon/hop.nvim",
    branch = 'v2',
    opts = {
      case_insensitive = true
    }
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function() require("flash").jump() end,
        desc = "Flash"
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search"
      },
    },
  },
  {
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = "telescope.nvim",
    config = function()
      require("harpoon").setup({
        -- dynamic width menu
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
      })
      require("telescope").load_extension("harpoon")
    end,
  },
}
