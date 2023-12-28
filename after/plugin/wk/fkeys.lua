require("which-key").register({
  ["<F1>"] = {

  },
  ["<F2>"] = {

  },
  ["<F3>"] = {
    "<cmd>DapVirtualTextForceRefresh<cr>",
    "Refresh Virtual Text"
  },
  ["<F4>"] = {
    "<cmd>lua require('dap').run_last()<cr>",
    "Run Last"
  },
  ["<F5>"] = {
    "<cmd>lua require('dap').continue()<cr>",
    "Continue"
  },
  ["<F6>"] = {
    "<cmd>lua require('dap').run_to_cursor()<cr>",
    "Run To Cursor"
  },
  ["<F7>"] = { "<cmd>lua require('dap').pause()<cr>", "Pause" },
  ["<F8>"] = {
    "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    "Conditional Breakpoint"
  },
  ["<F9>"] = {
    "<cmd>lua require('dap').toggle_breakpoint()<cr>",
    "Toggle Breakpoint"
  },
  ["<F10>"] = {
    "<cmd>lua require('dap').step_out()<cr>",
    "Step Out"
  },
  ["<F12>"] = {
    "<cmd>lua require('dap').step_over()<cr>",
    "Step Over"
  },
  ["<C-F11>"] = { "<cmd>lua require('dap').step_into()<cr>", "Step In"
  },
}, {
  mode = "n"
})
