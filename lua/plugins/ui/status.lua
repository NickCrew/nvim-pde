return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      {
        "arkav/lualine-lsp-progress",
        enabled = false
      },
    },
    opts = function()
      -----------------
      -- Conditions --
      -----------------
      local conditions = {
        -- Buffer Not Empty
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        --- Hide in width
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        -- Check git workspace
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }
      -----------------
      -- Git Status --
      -----------------
      local diff_source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end
      -----------------------
      -- Treesitter source --
      -----------------------
      local treesitter_source = function()
        return function()
          local b = vim.api.nvim_get_current_buf()
          if next(vim.treesitter.highlighter.active[b]) then
            return " TS "
          end
          return ""
        end
      end

      --------------------
      -- Lualine Config --
      --------------------
      return {
        options = {
          global_status = true,
          theme = "auto",
          always_divide_middle = false,
          icons_enabled = true,
          disabled_filetypes = {},
      section_separators = { left = '', right = '' },
      -- component_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' }
        },
        sections = {
          lualine_a = {
            { "mode" }
          },
          lualine_b = {
            {
              "branch",
              icon = "",
              cond = conditions.check_git_workspace
            },
          },
          lualine_c = {

            {
              "diff",
              source = diff_source,
              symbols = {
                added = " ",
                modified = "柳",
                removed = " ",
              },
              cond = conditions.hide_in_width,
            },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
              },
            },
            {"filename"},

          },
          lualine_x = {

            { "aerial", cond = conditions.hide_in_width },
          },
          lualine_y = {

            { "location", icon = "" },
            { "progress", icon = "" },
          },
          lualine_z = {


             { "fileformat", cond = conditions.buffer_not_empty },
            {  treesitter_source(), cond= conditions.buffer_not_empty},
             { "encoding", cond = conditions.buffer_not_empty },
          },
        },
        extensions = {
          "aerial",
          "fugitive",
          "lazy",
          "mason",
          "mundo",
          "neo-tree",
          "nvim-dap-ui",
          "quickfix",
          "symbols-outline",
          "toggleterm",
          "trouble",
        },
      }
    end
  },
}
