return {
  {
    -- Debug adapter protocol support
    "mfussenegger/nvim-dap",
    lazy = true,
    enabled = true,
  },


  {
    -- Debug UI
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        expand_lines = vim.fn.has("nvim-0.7"),
        layouts = {
          {
            elements = {
              -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              { id = "repl",    size = 0.50 },
              { id = "console", size = 0.50 },
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        floating = {
          max_height = nil,  -- These can be integers or a float between 0 and 1.
          max_width = nil,   -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
        }
      })

      dap.defaults.fallback.exception_breakpoints = { 'raised', 'uncaught' }
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
      dap.listeners.after.event_initialized["me"] = function()
        for _, buf in pairs(vim.api.nvim_list_bufs()) do
          local keymaps = vim.api.nvim_buf_get_keymap(buf, "n")
          for _, keymap in pairs(keymaps) do
            if keymap.lhs == "K" then
              table.insert({}, keymap)
              vim.api.nvim_buf_del_keymap(buf, "n", "K")
            end
          end
        end
        vim.api.nvim_set_keymap(
          "n",
          "K",
          '<Cmd>lua require("dapui").eval()<CR>',
          { silent = true })
      end
      dap.listeners.after.event_terminated["me"] = function()
        for _, keymap in pairs({}) do
          vim.api.nvim_buf_set_keymap(
            keymap.buffer,
            keymap.mode,
            keymap.lhs,
            keymap.rhs, {
              silent = keymap.silent == 1
            })
        end
      end


      vim.api.nvim_create_user_command("BreakpointToggle", "lua require('dap').toggle_breakpoint()", {})
      vim.api.nvim_create_user_command("Debug", "lua require('dap').continue()", {})
      vim.api.nvim_create_user_command("DapREPL", "lua require('dap').repl.open()", {})
      vim.api.nvim_create_user_command("DapCmds", ":lua require('telescope').extensions.dap.commands()", {})

      for type, icon in pairs({
        DapBreakpoint          = "🟠",
        DapBreakpointCondition = "🔵",
        DapBreakpointRejected  = "⭕",
        DapLogPoint            = "🔶",
        DapStopped             = "🔴"
      }) do
        vim.fn.sign_define(type, { text = icon, texthl = "", numhl = "", linehl = "" })
      end
    end,

  },
  {
    -- Debugger virtual text
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
    opts = {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      virt_text_pos = "eol",
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil,
    }
  },
  {
    -- python debuggin
    "mfussenegger/nvim-dap-python",
    ft = "python",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap_py = require("dap-python")
      local py_path = os.getenv("HOME") .. "/.pyenv/versions/neovim/bin/python"
      dap_py.setup(py_path)
      dap_py.test_runner = "pytest"
      vim.api.nvim_create_user_command("TestFunc", "lua require('dap-python').test_method()", {})
      vim.api.nvim_create_user_command("TestClass", "lua require('dap-python').test_class()", {})
      vim.api.nvim_create_user_command("DebugSelection", "lua require('dap-python').debug_selection()", {})
    end,
  },
}
