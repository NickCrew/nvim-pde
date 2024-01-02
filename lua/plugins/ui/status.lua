--[[ Statusbar customization
--]]
return {
  {

    "smiteshp/nvim-navic",
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = true,
        },
        separator = "  ",
        highlight = true,
        click = true
      })
    end,
  },
  {
    'b0o/incline.nvim',
    opts = {},
    enabled = false,
    lazy = true,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },

    },
    opts = function()
      -----------------
      -- Conditions --
      -----------------
      ---
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
            return " TS"
          end
          return ""
        end
      end

      local icons = require('settings.utils').get_icons()
      local separators = {
        thin_slant = {
          left = '',
          right = ''
        },
        plain_slant = { left = '', right = '' }
      }

      -- Color for highlights
      local colors = {
        yellow = '#ECBE7B',
        cyan = '#008080',
        darkblue = '#081633',
        green = '#98be65',
        orange = '#FF8800',
        violet = '#a9a1e1',
        magenta = '#c678dd',
        blue = '#51afef',
        red = '#ec5f67'
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
          disabled_filetypes = {},
          section_separators = {
            right = icons.ui.DividerRoundRight,
            left = icons.ui.DividerRoundLeft,
          },
          component_separators = { left = separators.thin_slant.left, right = separators.thin_slant.right },

        },
        winbar_inactive = {
            lualine_b = {},
            lualine_a = {
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },

        winbar = {
          lualine_c = {
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
              end,
              separator = ''
            },

          },

        },

        -- tabline = {},


        -- tabline_inactive = {
        --   lualine_a = {},
        --   lualine_b = {},
        --   lualine_c = {
        --   },
        --   lualine_x = {},
        --   lualine_y = {},
        --   lualine_z = {}
        -- },


        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },

        sections = {
          lualine_a = {

            { "tabs" },
            { "mode" },

          },
          lualine_b = {


            -- {
            --   "filename",
            --   path = 2,
            --   newfile_status = true,
            --   symbols = { modified = " ", readonly = " ", newfile = " ", unnamed = " " },
            -- },

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
              cond = conditions.check_git_workspace,
            },


          },
          lualine_x = {
{
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = {
                error = " ",
                warn = "  ",
                info = "  ",
                hint = "  ",
              },
            },

          },
          lualine_z = {
            { "location", icon = "", separator = ' ' },
            { "progress", icon = "" },
          },
          lualine_y = {

            { "filetype", separator = '' },

            { "encoding",          separator = '' },
            { "fileformat",        separator = '' },
            { treesitter_source(), separator = '' },
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

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x ot right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      return config
    end
  },
}
