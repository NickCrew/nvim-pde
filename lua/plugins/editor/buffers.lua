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
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>bd", "<Cmd>BufferLinePickClose<CR>", desc = "Pick Buffer to Delete" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    opts = {
      options = {
        -- stylua: ignore
        numbers = "buffer_id",
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = true,
        always_show_bufferline = true,
        persist_buffer_sort = true,
        show_tab_indicators = true,
        sort_by = "directory",
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
