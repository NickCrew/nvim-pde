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
            return " "
          end
          return " "
        end
      end

      local symbols_source = require("trouble").statusline({
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
        symbols_source.get,
        cond = symbols_source.has,
        icon = "פּ"
      }

      local filename_sect = {
        "filename",
        cond = conditions.buffer_not_empty,
        -- icon = "",
        path = 4,
        file_status = true,
        newfile_status = true,
        symbols = {
          modified = "",
          readonly = "",
          newfile = "󱇬",
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
        icon = "",
        symbols = {
          added = " ",
          modified = "󰐑 ",
          removed = " ",
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
        icon = "",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
        cond = conditions.buffer_not_empty
      }

      local overseer = require('overseer')
      local codeium_sect = function()
        local status = require('codeium.virtual_text').status()

        if status.state == 'idle' then
          -- Output was cleared, for example when leaving insert mode
          return ' '
        end

        if status.state == 'waiting' then
          -- Waiting for response
          return "Waiting..."
        end

        if status.state == 'completions' and status.total > 0 then
          return string.format('%d/%d', status.current, status.total)
        end

        return ' 0 '
      end

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
            winbar = {
              "dashboard",
              "neo-tree",
              "Outline",
              "symbols-outline",
              "help",
              "trouble",
              "quickfix",
              "copilot-chat",
              "grug-far",
              "snacks_dashboard"
            },
            statusline = {
              "dashboard",
              "snacks_dashboard",
              "neo-tree"

            }
          },
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }
        },
        tabline = {
          lualine_a = {
          },
          lualine_b = {
            { "buffers", mode = 4, use_mode_colors = true }
          },
          lualine_y = {
          },
          lualine_z = {
            "tabs"
          }
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
            trouble_sect
          },
          lualine_x = {
          },
          lualine_y = {
            diagnostic_sect
          },
          lualine_z = {
            filename_sect
          }
        },
        sections_inactive = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        sections = {
          lualine_a = {
            { 'mode' }
          },
          lualine_b = {

            filetype_sect,
            git_sect,
            diff_sect,
          },
          lualine_c = {
          },
          lualine_x = {
            {
              "overseer",
              icon = "",
              label = "",     -- Prefix for task counts
              colored = true, -- Color the task icons and counts
              symbols = {
                [overseer.STATUS.FAILURE] = "F:",
                [overseer.STATUS.CANCELED] = "C:",
                [overseer.STATUS.SUCCESS] = "S:",
                [overseer.STATUS.RUNNING] = "R:",
              },
              unique = false,     -- Unique-ify non-running task count by name
              name = nil,         -- List of task names to search for
              name_not = false,   -- When true, invert the name search
              status = nil,       -- List of task statuses to display
              status_not = false, -- When true, invert the status search
            },
            { require("recorder").recordingStatus },
          },
          lualine_y = {
            { treesitter_source() },
            { "copilot" },
            {  codeium_sect() }
          },
          lualine_z = {
            { require("recorder").displaySlots },
            { "progress", icon = "", },
            { "location", icon = "", },
          }
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
