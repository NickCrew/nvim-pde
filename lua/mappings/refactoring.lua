local opts = {noremap = true, silent = true}

-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
Mapper.map(
    "n",
    "<leader>rp",
    ":lua require('refactoring').debug.printf({below = false})<CR>",
    opts,
    "Refactoring",
    "refac_debugprint",
    "Debug Print"
)
-- Print var: this remap should be made in visual mode
Mapper.map(
    "v",
    "<leader>rv",
    ":lua require('refactoring').debug.print_var({})<CR>",
    opts,
    "Refactoring",
    "refac_printvar",
    "Debug Print Variable"
)
-- Cleanup function: this remap should be made in normal mode
Mapper.map(
    "n",
    "<leader>rc",
    ":lua require('refactoring').debug.cleanup({})<CR>",
    opts,
    "Refactoring",
    "refac_cleanup",
    "Cleanup"
)
-- Remaps for each of the four debug operations currently offered by the plugin
Mapper.map(
    "v",
    "<Leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_exfunc",
    "Extract Function From Selection"
)
-- Extract Function From Selection
Mapper.map(
    "v",
    "<Leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_exfunctofile",
    "Extract Function To File"
    -- Extract Function From Selection
)
-- Extract Variable From Selection
Mapper.map(
    "v",
    "<Leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_exvar",
    "Extract Variable From Selection"
)
-- Inline Variable
Mapper.map(
    "v",
    "<Leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_invar",
    "Inline Variable"
)
