local dap = require("dap")
local dapui = require("dapui")
local api = vim.api
local keymap_restore = {}

--
-- DAP UI Auto-Open
--
dapui.setup()
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

