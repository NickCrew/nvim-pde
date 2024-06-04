local icons = {
  error       = " ",
  warning     = " ",
  warn        = " ",
  information = " ",
  info        = " ",
  other       = " ",
  hint        = " ",
}

return {
  {
    -- You can also use the codeberg mirror if you want to use the plugin without relying on GitHub
    -- "https://codeberg.org/CodingThunder/zincoxide.git" -- for HTTPS
    -- "git@codeberg.org:CodingThunder/zincoxide.git"     -- for SSH
    -- NOTE: the username on both github and codeberg are different
    "thunder-coding/zincoxide",
    opts = {
      -- name of zoxide binary in your "$PATH" or path to the binary
      -- the command is executed using vim.fn.system()
      -- eg. "zoxide" or "/usr/bin/zoxide"
      zincoxide_cmd = "zoxide",
      -- Kinda experimental as of now
      complete = true,
      -- Available options { "tabs", "window", "global" }
      behaviour = "tabs",
    },
    cmd = { "Z", "Zg", "Zt", "Zw" },
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {}
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/zen-mode.nvim",
    lazy = true,
    event = "BufReadPre",
    config = true,
    dependencies = {
      "folke/twilight.nvim",
      lazy = true,
      cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
      keys = {
        { "<leader><leader>t", "<cmd>Twilight<cr>", desc = "Twilight" }
      },
      opts = {
        context = 20,
      }
    },
  },
  {
    "echasnovski/mini.bufremove",
    event = "BufEnter",
    lazy = true,
    version = false,
    opts = {}
  },
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    lazy = true,
    event = "BufEnter",
    keys = {
      { "<leader>bb",  mode = "n", "<esc><Cmd>BufferLinePick<CR>",                 desc = "Pick Buffer" },
      { "<leader>bp",  mode = "n", "<esc><Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
      { "<leader>bx",  mode = "n", "<esc><cmd>BufferLinePickClose<CR>",            desc = "Pick Buffer To Close" },
      { "<leader>b[",  mode = "n", "<esc><cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
      { "<leader>b]",  mode = "n", "<esc><cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
      { "<leader>bcl", mode = "n", "<esc><Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
      { "<leader>bco", mode = "n", "<esc><Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
      { "<leader>bcr", mode = "n", "<esc><Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
      { "<leader>bcu", mode = "n", "<esc><Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        -- stylua: ignore
        numbers = "buffer_id",
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = false,
        always_show_bufferline = true,
        persist_buffer_sort = true,
        show_tab_indicators = true,
        sort_by = "tabs",
        show_close_icon = true,
        separator_style = "padded_slant",
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and icons.error .. diag.error .. " " or "")
              .. (diag.warning and icons.warning .. diag.warning or "")
              .. (diag.hint and icons.hint .. diag.hint or "")
              .. (diag.info and icons.info .. diag.info or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left",
            separator = true
          },
        },
      },
    },
  },
}
