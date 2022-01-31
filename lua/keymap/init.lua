-- lua/keymap/init.lua
--
-- We define mappings here in one place just because it makes
-- them easier to keep track of

local  M = {}

local functions = require('keymap.functions')
local vim = vim

local function bind(keymaps)
  for _, keymap in pairs(keymaps) do
    local opts = {silent = true, noremap = true}
    vim.keymap.set(keymap.mode or 'n', keymap[1], keymap[2], opts)
  end
end

local function bind_plug(keymaps)
  for _, keymap in pairs(keymaps) do
    local opts = {silent = true, noremap = false}
    vim.keymap.set(keymap.mode or 'n', keymap[1], keymap[2], opts)
  end
end

function M.apply_default_keymaps()
  bind({


    -- ctrl+y and ctrl+u to resize splits
    { '<leader><leader><up>', functions.resize_split('plus') },
    { '<leader><leader><down>', functions.resize_split('minus') },
    -- remap gx to open url under cursor since I have netrw disabled
    { 'gx', functions.open_url_under_cursor },

    -- Navigator.nvim
    { '<C-h>', functions.navigator_lazy('left') },
    { '<C-j>', functions.navigator_lazy('down') },
    { '<C-k>', functions.navigator_lazy('up') },
    { '<C-l>', functions.navigator_lazy('right') },
    { '<C-_>', '<C-w>_'},

    -- Fast escape from terminal
    { '<C-[><C-[>', '<C-\\><C-n>', mode = 't' },
    { '<C-e>t', ':split term://zsh<CR>'},

    -- Bufferline
    {'<leader><tab>', ':b#<CR>'},
    { '<leader><leader>n', ':BufferLineCycleNext<CR>' },
    { '<leader><leader>p', ':BufferLineCyclePrev<CR>' },
    { '<leader><leader>b', ':BufferlinePick<CR>'},

    -- Search
    { '<leader>l', ':noh<CR>'},

    -- Show hide info
    {'<C-k>o', ':copen<CR>'},
    {'<C-k>c', ':close<CR>'},

    -- Yank/Paste
    {'<leader>p', '"*p'},
    {'<leader>y', '"*y'},
    {'<leader>P', '"0p'},
    {'<leader>dx', '"_dd'},
    {'<leader>gy', 'm`^yg_``'},

    -- Cheatsheet
    {'<C-k>C', ':Cheatsheet<CR>'},
    -- Toggle LSP Diagnostics
    {'<leader><leader>td', ':ToggleDiag<CR>'},
    -- NvimTree
    { '<C-k>n', ':NvimTreeToggle<CR>' },
    -- Vista
    {'<C-k>v',  ':Vista!!<CR>'},
    -- Gitsigns
    {'<leader>gb', ':Gitsigns toggle_current_line_blame<CR>'},

  })

  bind_plug({
    -- Marks
    {'<leader>b', '<Plug>BookmarksListAll'},
    -- Lightspeed
    {'<leader>s', '<Plug>Lightspeed_s'},
    {'<leader><leader>s', '<Plug>Lightspeed_S'},
    -- SnipRun
    {'<leader>sr', '<Plug>SnipRun'}
  })
end



function M.apply_marks_keymaps()
  return {
    annotate = "<leader>ab"
  }
end

function M.apply_hslens_keymaps()
  bind({
    {'n', "<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>"},
    {'N', "<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>"}
  })
  bind_plug({
    {"*", "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>"},
    {"#", "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>"},
  })
end

function M.apply_telescope_keymaps()
  bind({
    { '<leader>ff', functions.telescope_lazy('find_files') },
    { '<leader>b', functions.telescope_lazy('buffers') },
    { '<leader>lg', functions.telescope_lazy('live_grep') },
    { '<leader>h', ':Telescope command_history<CR>' },
    { '<leader>r', ':Telescope registers<CR>' },
    { '<leader>m', ':Telescope marks<CR>' },
    { '<leader>;', ':Telescope commands<CR>' },
    { '<leader>pr', ':Telescope projects<CR>' },
    { '<C-k>d', ':Telescope dap commands<CR>' },
    { '<leader>k', ':Telescope keymaps<CR>'},
    { '<leader><leader>z', ':Telescope zoxide list<CR>' }
  })
end

function M.apply_dap_keymaps()
  bind({
   {'\\tb', ":lua require('dap').toggle_breakpoint()<CR>"},
   {'\\rp', ":lua require('dap').repl.open()<CR>"},
   {'\\co', ":lua require('dap').continue()<CR>"},
   {'\\so', ":lua require('dap').step_over()<CR>"},
   {'\\si', ":lua require('dap').step_in()<CR>"},
   {'\\st', ":lua require('dap').step_out()<CR>"},
   {'\\cb', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"},
   {'\\fb', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"},
   {'\\pu', ":lua require('dap').pause()<CR>"},
   {'\\rc', ":lua require('dap').run_to_cursor()<CR>"}

  })
end

function M.apply_dap_alt_keymaps()
  bind({
   {'<F9>', ":lua require('dap').toggle_breakpoint()<CR>"},
   {'<leader>rp', ":lua require('dap').repl.open()<CR>"},
   {'<F5>', ":lua require('dap').continue()<CR>"},
   {'<F10>', ":lua require('dap').step_over()<CR>"},
   {'<F11>', ":lua require('dap').step_in()<CR>"},
   {'<F12>', ":lua require('dap').step_out()<CR>"},
   {'<leader><F9>', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"},
   {'<F8>', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"},
   {'<F6>', ":lua require('dap').pause()<CR>"},
   {'<leader><F8>', ":lua require('dap').run_to_cursor()<CR>"}
 })
end

function M.apply_trouble_keymaps()
  bind({
    -- Trouble
    {'<leader>xx', '<cmd>TroubleToggle<cr>'},
    {'<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>'},
    {'<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>'},
    {'<leader>xq', '<cmd>TroubleToggle quickfix<cr>'},
    {'<leader>xl', '<cmd>TroubleToggle loclist<cr>'},
    {'<leader>gR', '<cmd>TroubleToggle lsp_references<cr>'},
    })
  end


function M.apply_vimspector_keymaps()
  vim.g.vimspector_enable_mappings = 'HUMAN'
  bind_plug({
    {'<Leader>di', '<Plug>VimspectorBalloonEval'},
    {'<Leader>uf', '<Plug>VimspectorUpFrame'},
    {'<Leader>df', '<Plug>VimspectorDownFrame'},
  })
end

function M.apply_lsp_keymaps()
  bind({
      -- GOTO mappings
      { 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>'},
      { 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'},
      { 'K', '<cmd>lua vim.lsp.buf.hover()<CR>'},
      { 'gr', '<cmd>lua vim.lsp.buf.references()<CR>'},
      { 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>'},
      { 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
      { '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition{}<CR>'},
      { '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>'},
      { '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>'},
    -- ACTION mappings
    { '<leader>ah', '<cmd>lua vim.lsp.buf.hover()<CR>'},
    { '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
    { '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>'},
    { '<leader>qf', '<cmd>lua vim.lsp.buf.quick_fix(300)<CR>'},
    -- map('n', ':or', '<cmd>lua vim.lsp.buf.quick_fix(300)<CR>')
    -- Few language severs support these three
    { '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>'},
    { '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>'},
    { '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>'},
    -- Dostics mapping
    { '<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'},
    { '[g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'},
    { ']g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'},
  })
end


function M.get_cmp_mappings()
  return {
    ['<C-p>'] = require('cmp').mapping.select_prev_item(),
    ['<C-n>'] = require('cmp').mapping.select_next_item(),
    ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
    ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
    ['<C-Space'] = require('cmp').mapping.complete({'i','c'}),
    ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
  }
end

return M
