-- lua/keymap/init.lua
--
-- We define mappings here in one place just because it makes
-- them easier to keep track of

Mapper = require("mapitupboi")

local function navigator_lazy(direction)
  return function()
    require("Navigator")[direction]()
  end
end

local function resize_split(plus_or_minus)
  return function()
    -- full height window height is screen height minus 3 for bufferline, status line, and command line
    local is_vert_split = vim.fn.winheight(vim.fn.winnr()) + 3 == vim.o.lines
    if is_vert_split then
      if plus_or_minus == "plus" then
        vim.cmd("vertical resize +3")
      else
        vim.cmd("vertical resize -3")
      end
    else
      if plus_or_minus == "plus" then
        vim.cmd("resize +3")
      else
        vim.cmd("resize -3")
      end
    end
  end
end

local function bind(keymaps)
  for _, keymap in pairs(keymaps) do
    local opts = { silent = true, noremap = true }
    vim.keymap.set(keymap.mode or "n", keymap[1], keymap[2], opts)
  end
end

bind({
  { "<leader><leader><up>", resize_split("plus") },
  { "<leader><leader><down>", resize_split("minus") },
  { "<C-h>", navigator_lazy("left") },
  { "<C-j>", navigator_lazy("down") },
  { "<C-k>", navigator_lazy("up") },
  { "<C-l>", navigator_lazy("right") },
  {"<leader>P", "0p"},
  {"n","<leader>p"},
  {"<leader>dx", "_dd"},
  {"<C-e>t", ":split term://zsh<CR>"},
  {"Q", ":cclose<CR>"},
  {"<C-_>", "<C-w>_"},
  {"<C-[><C-[>", "<C-\\><C-n>"},
  {"<leader>l", ":noh<CR>"},
  {"<leader><tab>", ":b#<CR>"},
  {"n", "<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>"},
  {"N","<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>"},
  {"*", "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>"},
  {"#", "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>"},
})


vim.api.nvim_set_keymap('v', "<leader>",'"*y', {noremap = true, silent=true})
Mapper = require("nvim-mapper")
  Mapper.map("n", "<leader>P", "0p", { noremap = true, silent = true }, "Paste", "paste_0buf", "Paste from buffer 0")
  Mapper.map(
    "n",
    "<C-e>C",
    ":Cheatsheet<CR>",
    { noremap = true, silent = true },
    "Cheatsheets",
    "cheat_open",
    "Open Cheatsheet"
  )
  Mapper.map(
    "n",
    "<leader>ff",
    ":Telescope find_files<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_ff",
    "Find Files"
  )
  Mapper.map(
    "n",
    "<leader>b",
    ":Telescope buffers<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_buf",
    "Find Buffers"
  )
  Mapper.map(
    "n",
    "<leader>g",
    ":Telescope live_grep<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_lgrep",
    "Live Grep"
  )
  Mapper.map(
    "n",
    "<leader>h",
    ":Telescope command_history<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_chist",
    "Command History"
  )
  Mapper.map(
    "n",
    "<leader>r",
    ":Telescope registers<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_reg",
    "Registers"
  )
  Mapper.map(
    "n",
    "<leader>m",
    ":Telescope marks<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_marks",
    "Marks"
  )
  Mapper.map(
    "n",
    "<C-e>c",
    ":Telescope commands<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_cmds",
    "Commands"
  )
  Mapper.map(
    "n",
    "<C-e>p",
    ":Telescope projects<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_proj",
    "Projects"
  )
  Mapper.map(
    "n",
    "<C-e>d",
    ":Telescope dap commands<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_dapcmds",
    "Debugging Commands"
  )
  Mapper.map(
    "n",
    "<C-e>k",
    ":Telescope keymaps<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_keymaps",
    "Mappings"
  )
  Mapper.map(
    "n",
    "<leader><leader>z",
    ":Telescope zoxide list<CR>",
    { noremap = true, silent = true },
    "Telescope",
    "tele_z",
    "Zoxide"
  )

  Mapper.map(
    "n",
    "<F9>",
    ":lua require('dap').toggle_breakpoint()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_breakpt",
    "Toggle Breakpoint"
  )
  Mapper.map(
    "n",
    "<leader>rp",
    ":lua require('dap').repl.open()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_oprepl",
    "Open REPL"
  )
  Mapper.map(
    "n",
    "<F5>",
    ":lua require('dap').continue()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_cont",
    "Continue"
  )
  Mapper.map(
    "n",
    "<F10>",
    ":lua require('dap').step_over()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_stepover",
    "Step Over"
  )
  Mapper.map(
    "n",
    "<F11>",
    ":lua require('dap').step_in()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_stepin",
    "Step Into"
  )
  Mapper.map(
    "n",
    "<F12>",
    ":lua require('dap').step_out()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_stepout",
    "Step Out"
  )
  Mapper.map(
    "n",
    "<leader><F9>",
    ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_conbreakpt",
    "Condition Breakpoint"
  )
  Mapper.map(
    "n",
    "<F8>",
    ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_fnbreakpt",
    "Function Breakpoint"
  )
  Mapper.map(
    "n",
    "<F6>",
    ":lua require('dap').pause()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_pause",
    "Pause"
  )
  Mapper.map(
    "n",
    "<leader><F8>",
    ":lua require('dap').run_to_cursor()<CR>",
    { noremap = true, silent = true },
    "Debugging",
    "dap_runtocurs",
    "Run to Cursor"
  )
  Mapper.map(
    "n",
    "<leader>b",
    "<Plug>BookmarksListAll",
    { noremap = false, silent = true },
    "Bookmarks",
    "bm_listall",
    "List all bookmarks"
  )
  Mapper.map(
    "n",
    "<C-e>C",
    ":Cheatsheet<CR>",
    { noremap = true, silent = true },
    "Cheatsheets",
    "cheat_open",
    "Open Cheatsheet"
  )
  Mapper.map(
    "n",
    "<leader>gb",
    ":Gitsigns toggle_current_line_blame<CR>",
    { noremap = true, silent = true },
    "Git",
    "git_toggle_blame",
    "Toggle Git Blame"
  )
  Mapper.map(
    "n",
    "<C-e>v",
    ":Vista!!<CR>",
    { noremap = true, silent = true },
    "Symbols",
    "vista_toggle",
    "Toggle Vista"
  )
  Mapper.map(
    "n",
    "<leader><leader>td",
    ":ToggleDiag<CR>",
    { noremap = true, silent = true },
    "Diagnostics",
    "diag_toggle",
    "Toggle Diagnostics"
  )
  Mapper.map(
    "n",
    "<leader>xx",
    "<cmd>TroubleToggle<cr>",
    { noremap = true, silent = true },
    "Diagnostics",
    "trbl_toggle",
    "Toggle Trouble"
  )
  Mapper.map(
    "n",
    "<leader>xw",
    "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { noremap = true, silent = true },
    "Diagnostics",
    "trbl__wkspace",
    "Workspace Diagnostics"
  )
  Mapper.map(
    "n",
    "<leader>xd",
    "<cmd>TroubleToggle document_diagnostics<cr>",
    { noremap = true, silent = true },
    "Diagnostics",
    "trbl_doc",
    "Document Diagnostics"
  )
  Mapper.map(
    "n",
    "<leader>xq",
    "<cmd>TroubleToggle quickfix<cr>",
    { noremap = true, silent = true },
    "Diagnostics",
    "trbl_qfx",
    "Open Diagnostics in QuickFix"
  )
  Mapper.map(
    "n",
    "<leader>xl",
    "<cmd>TroubleToggle loclist<cr>",
    { noremap = true, silent = true },
    "Diagnostics",
    "trbl_loc",
    "Open Diagnostics in Location List"
  )
  Mapper.map(
    "n",
    "<leader>gR",
    "<cmd>TroubleToggle lsp_references<cr>",
    { noremap = true, silent = true },
    "Diagnostics",
    "trbl_ref",
    "Diagnostics References"
  )
  Mapper.map(
    "n",
    "<C-e>f",
    ":FloatermToggle<CR>",
    { noremap = true, silent = true },
    "Terminal",
    "term_floattoggl",
    "Toggle Floating Terminal"
  )

  Mapper.map(
    "n",
    "<leader>;",
    ":HopWord<CR>",
    { noremap = true, silent = true },
    "Movement",
    "mv_hopword",
    "Hop To Word"
  )
  Mapper.map(
    "n",
    "<leader>:",
    ":HopLine<CR>",
    { noremap = true, silent = true },
    "Movement",
    "mv_hopline",
    "Hop To Line"
  )
  Mapper.map(
    "n",
    "<leader><leader>n",
    ":BufferLineCycleNext<CR>",
    { noremap = true, silent = true },
    "Buffers",
    "buf_next",
    "Next Buffer"
  )
  Mapper.map(
    "n",
    "<leader><leader>p",
    ":BufferLineCyclePrev<CR>",
    { noremap = true, silent = true },
    "Buffers",
    "buf_prev",
    "Previous Buffer"
  )
  Mapper.map(
    "n",
    "<leader><leader>b",
    ":BufferlinePick<CR>",
    { noremap = true, silent = true },
    "Buffers",
    "buf_pik",
    "Pick Buffer"
  )

-- local apply_vimspector_opt_keymaps = function()
--   vim.g.vimspector_enable_mappings = "HUMAN"
--   Mapper.map(
--     "n",
--     "<Leader>di",
--     "<Plug>VimspectorBalloonEval",
--     { noremap = false, silent = true },
--     "Debugging",
--     "vimspec_eval",
--     "Vimspector Balloon Evaluation"
--   )
--   Mapper.map(
--     "n",
--     "<Leader>uf",
--     "<Plug>VimspectorUpFrame",
--     { noremap = false, silent = true },
--     "Debugging",
--     "vimspec_upframe",
--     "Vimspector Up Frame"
--   )
--   Mapper.map(
--     "n",
--     "<Leader>df",
--     "<Plug>VimspectorDownFrame",
--     { noremap = false, silent = true },
--     "Debugging",
--     "vimspec_downframe",
--     "Vimspector Down Frame"
--   )
-- end
