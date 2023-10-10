return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "arkav/lualine-lsp-progress",
        enabled = false
      },

    },
    opts = function()
      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }
      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end

      local function window_source()
        return vim.api.nvim_win_get_number(0)
      end

      local treesitter_source = function()
        return function()
          local b = vim.api.nvim_get_current_buf()
          if next(vim.treesitter.highlighter.active[b]) then
            return " TS"
          end
          return ""
        end
      end

      -- LUALINE CONFIG
      return {
        options = {
          theme = "auto",
          icons_enabled = true,
          disabled_filetypes = {},
          -- component_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },

          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode" } },
          lualine_b = { { "branch", icon = "" } },
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
          },
          lualine_x = {
            { "aerial" },
            { "filetype",          cond = conditions.buffer_not_empty },
            { treesitter_source(), cond = conditions.hide_in_width },
          },
          lualine_y = {
            { "location", icon = "" },
            { "progress", icon = "" },
          },
          lualine_z = {

            { window_source, icon = "" },
          },
        },
        extensions = {
          "quickfix",
          "aerial",
          "toggleterm",
          "nvim-dap-ui",
          "mundo",
        },
      }
    end
  },
}
