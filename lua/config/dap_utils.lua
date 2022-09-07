local dap = require("dap")
local dapui = require("dapui")
local api = vim.api
local keymap_restore = {}

--
-- DAP UI Auto-Open
--
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
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
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
        { id = "repl", size = 0.50 },
        { id = "console", size = 0.50},
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
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

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

---
--- Hover on K
---
dap.listeners.after["event_initialized"]["me"] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, "n")
    for _, keymap in pairs(keymaps) do
      if keymap.lhs == "K" then
        table.insert(keymap_restore, keymap)
        api.nvim_buf_del_keymap(buf, "n", "K")
      end
    end
  end
  api.nvim_set_keymap("n", "K", '<Cmd>lua require("dapui").eval()<CR>', { silent = true })
end

dap.listeners.after["event_terminated"]["me"] = function()
  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
  end
  keymap_restore = {}
end

--
-- Signs
--

local fn = vim.fn
fn.sign_define("DapBreakpoint", { text = "🟠", texthl = "", linehl = "", numhl = "" })
fn.sign_define("DapBreakpointCondition", { text = "🔵", texthl = "", linehl = "", numhl = "" })
fn.sign_define("DapBreakpointRejected", { text = "⭕", texthl = "", linehl = "", numhl = "" })
fn.sign_define("DapLogPoint", { text = "🔶", texthl = "", linehl = "", numhl = "" })
fn.sign_define("DapStopped", { text = "🛑", texthl = "", linehl = "", numhl = "" })


--
-- Defaults
--
dap.defaults.fallback.exception_breakpoints = {'raised','uncaught'}
dap.defaults.fallback.external_terminal = {
  command = '/Applications/Kitty.app/Contents/MacOS/kitty @ --to=unix:/tmp/mykitty new-window --new-tab --cwd=current',
}


--
-- Virtual text
--

