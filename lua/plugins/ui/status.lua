return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },

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

      local treesitter_source = function()
        return function()
          local b = vim.api.nvim_get_current_buf()
          if next(vim.treesitter.highlighter.active[b]) then
            return " TS"
          end
          return " TS"
        end
      end

      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
      })

      local trouble_sect = {
        symbols.get,
        cond = symbols.has,
      }

      local filename_sect = {
        "filename",
        cond = conditions.buffer_not_empty,
        icon = "",
        path = 4,
        file_status = true,
        symbols = {
          modified = "",
          readonly = "",
          newfile = "",
          unnamed = ""
        }
      }

      local filetype_sect = {
        "filetype",
        cond = conditions.buffer_not_empty
      }

      local diff_sect = {
        "diff",
        source = diff_source,
        -- icon = " ",
        symbols = {
          added = " ",
          modified = "柳",
          removed = " ",
        },
        cond = conditions.check_git_workspace,
      }

      local git_sect = {
        "branch",
        icon = "",
        cond = conditions.check_git_workspace,
      }

      local diagnostic_sect = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
        cond = conditions.buffer_not_empty
      }

      local mode_sect = {
        'mode',
        fmt = function(str) return str:sub(1, 1) end,
      }
      local file_sect = {
        -- filename_sect,
        filetype_sect,
        -- { "encoding" },
        { treesitter_source() },
        { "copilot" },
      }
      local location_sect = {
        { "progress", icon = "", },
        { "location", icon = "", },
      }
      local scm_sect = {
        git_sect,
        diff_sect
      }
      --------------------
      -- Lualine Config --
      --------------------
      local config = {
        options = {
          global_status = true,
          theme = "auto",
          always_divide_middle = true,
          icons_enabled = true,
          disabled_filetypes = {
            statusline = {
              "dashboard",
              "alpha",
              "starter",
              "neo-tree"
            }
          },
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }

        },
        winbar_inactive = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
          },
          lualine_x = {},
        },
        sections_inactive = {
          lualine_a = {},
          lualine_b = {
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        sections = {
          lualine_a = {
            mode_sect
          },
          lualine_b = scm_sect,
          lualine_c = {
            trouble_sect
          },
          lualine_x = {
            -- diagnostic_sect,
            -- diff_sect,
          },
          lualine_y = file_sect,
          lualine_z = location_sect
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
      -- Inserts a component in lualine_c at left section
      local function ins_left(component) table.insert(config.sections.lualine_c, component) end
      -- Inserts a component in lualine_x ot right section
      local function ins_right(component) table.insert(config.sections.lualine_x, component) end

      return config
    end
  },
}
