
-- Open UI
local M = {}

local opts = { noremap = false, silent = true }

M.load = function(bufnr)
  Mapper.map_buf(
      bufnr,
      "n",
      "<leader>dui",
      "<cmd>lua require'dapui'.open()<CR>",
      opts,
      "DAP",
      "dap_openui",
      "Open DAP UI"
  )
  -- Evaluate under cursor
  Mapper.map_buf(
      bufnr,
      "v",
      "<C-a>h",
      "<cmd>lua require('dapui').eval()<CR>",
      opts,
      "DAP",
      "dap_evalv",
      "Evaluate Selection"
  )
  -- Open REPL
  Mapper.map_buf(
      bufnr,
      "n",
      "<C-a>r",
      ":lua require('dap').repl.toggle()<CR>",
      opts,
      "DAP",
      "dap_togglerepl",
      "Toggle REPL"
  )
  Mapper.map_buf(
      bufnr,
      "n",
      "<F9>",
      ":lua require('dap').toggle_breakpoint()<CR>",
      opts,
      "DAP",
      "dap_breakpt",
      "Toggle Breakpoint"
  )
  -- Continue
  Mapper.map_buf(
      bufnr,
      "n",
      "<C-a>k",
      ":lua require('dap').continue()<CR>",
      opts,
      "DAP",
      "dap_cont",
      "Continue"
  )
  Mapper.map_buf(
      bufnr,
      "n",
      "<F5>",
      ":lua require('dap').continue()<CR>",
      opts,
      "DAP",
      "dap_cont2",
      "Continue"
  )
  -- Run Last Configuration
  Mapper.map_buf(
      bufnr,
      "n",
      "<C-a>l",
      ":lua require('dap').run_last()<CR>",
      opts,
      "DAP",
      "dap_runlast2",
      "Run Last Configuration"
  )
  Mapper.map_buf(
      bufnr,
      "n",
      "<F4>",
      ":lua require('dap').run_last()<CR>",
      opts,
      "DAP",
      "dap_runlast",
      "Run Last Configuration"
  )
  -- Step Over
  Mapper.map_buf(
      bufnr,
      "n",
      "<F10>",
      ":lua require('dap').step_over()<CR>",
      opts,
      "DAP",
      "dap_stepover",
      "Step Over"
  )
  -- Step Info
  Mapper.map_buf(
      bufnr,
      "n",
      "<F11>",
      ":lua require('dap').step_into()<CR>",
      opts,
      "DAP",
      "dap_stepin",
      "Step Into"
  )
  -- Step Out
  Mapper.map_buf(
      bufnr,
      "n",
      "<F12>",
      ":lua require('dap').step_out()<CR>",
      opts,
      "DAP",
      "dap_stepout",
      "Step Out"
  )
  -- Set Conditional Breakpoint
  Mapper.map_buf(
      bufnr,
      "n",
      "<leader><F9>",
      ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      opts,
      "DAP",
      "dap_conbreakpt",
      "Condition Breakpoint"
  )
  -- Set Log Point
  Mapper.map_buf(
      bufnr,
      "n",
      "<leader><F8>",
      ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      opts,
      "DAP",
      "dap_fnbreakpt",
      "Function Breakpoint"
  )
  -- Pause
  Mapper.map_buf(
      bufnr,
      "n",
      "<F6>",
      ":lua require('dap').pause()<CR>",
      opts,
      "DAP",
      "dap_pause",
      "Pause"
  )
  -- Run To Cursor
  Mapper.map_buf(
      bufnr,
      "n",
      "<F8>",
      ":lua require('dap').run_to_cursor()<CR>",
      opts,
      "DAP",
      "dap_runtocurs",
      "Run to Cursor"
  )
  -- Toggle Virtual Text
  Mapper.map_buf(
      bufnr,
      "n",
      "<leader>vt",
      "<cmd>DapVirtualTextToggle<CR>",
      opts,
      "DAP",
      "dap_toggletext",
      "Toggle Virtual Text"
  )
  -- Refresh virtual text
  Mapper.map_buf(
      bufnr,
      "n",
      "<leader>rt",
      "<cmd>DapVirtualTextForceRefresh<CR>",
      opts,
      "DAP",
      "dap_textrefresh",
      "Refresh Virtual Text"
  )
end

return M
