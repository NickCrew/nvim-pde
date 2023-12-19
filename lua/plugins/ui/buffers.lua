return {
  {
    "echasnovski/mini.bufremove",
    event = "VeryLazy",
    lazy = true,
    version = false,
    opts = {}
  },
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    lazy = true,
    event = "BufEnter",
    opts = {
      options = {
        -- stylua: ignore
        numbers = "buffer_id",
       close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        persist_buffer_sort = true,
        show_tab_indicators = true,
        sort_by = "tabs",
        show_close_icon = true,
        separator_style = "padded_slant",
        diagnostics_indicator = function(_, _, diag)
          local icons = require("settings._icons").diagnostics.solid
          local ret = (diag.error and icons.error .. diag.error .. " " or "")
              .. (diag.warning and icons.warning .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  }

}
