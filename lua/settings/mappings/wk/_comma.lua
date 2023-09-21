local wk = require("which-key")

wk.register({
  {
    R = {
      "<cmd>DapVirtualTextForceRefresh<cr>",
      "Refresh Virtual Text",
    },
    c = {
      "<cmd>lua require('dap').continue()<cr>",
      "Continue",
    },
    r = {
      name  = "+run",
      c = {
        "<cmd>lua require('dap').run_to_cursor()<cr>",
        "Run To Cursor",
      },
      l = {
        "<cmd>lua require('dap').run_last()<cr>",
        "Run Last",
      },
    },
    p = {
      "<cmd>lua require('dap').pause()<cr>",
      "Pause",
    },
    t = {
      name = "+toggle",
      c = {
        "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
        "Conditional Breakpoint",
      },
      b = {
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        "Toggle Breakpoint",
      },
    },
    s = {
      name = "+step",
      o = {
        "<cmd>lua require('dap').step_out()<cr>",
        "Step Out",
      },
      i = {
        "<cmd>lua require('dap').step_into()<cr>",
        "Step In",
      },
      v = {
        "<cmd>lua require('dap').step_over()<cr>",
        "Step Over",
      }
    },
  }
}, { mode = "n", prefix = "\\" })
