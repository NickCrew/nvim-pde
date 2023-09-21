--[[
- nvim-dap
- vim-dap-ui
- nvim-dap-virtual-text
- nvim-dap-python
- nvim-dap-go
--]]
return {
  {
    -- Debug adapter protocol support
    "mfussenegger/nvim-dap",
    lazy = true,
    enabled = true,
  },
  {
    -- Debugger GUI
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
    -- Python debugging
    "mfussenegger/nvim-dap-python",
    ft = "python",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap_py = require("dap-python")
      local py_path = os.getenv("HOME") .. "/.pyenv/versions/debugpy/bin/python"
      dap_py.setup(py_path)
      dap_py.test_runner = "pytest"
    end,
  },
  { -- Golang debugging
    'leoluz/nvim-dap-go',
    lazy = true,
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap" }
  },
  { -- Javascript debugging
    'mxsdev/nvim-dap-vscode-js',
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap" }
  },
  {
  "jay-babu/mason-nvim-dap.nvim",
  lazy = true,
  dependencies = "mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_installation = true,

    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {},

    -- You'll need to check that you have the required things installed
    -- online, please don't ask me how to install them :)
    ensure_installed = {
      -- Update this to ensure that you have the debuggers for the langs you want
    },
  },
}
}
