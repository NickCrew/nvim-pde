-------------------------------------------------
-- File: settings.options
-- Sourced Directly By: init.lua
-- Description: Options and Globals
-------------------------------------------------
local o          = vim.o
local g          = vim.g

g.nvim_cache        = os.getenv('HOME') .. "/.cache/nvim"
g.python3_host_prog = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin/python'


-- Leader
g.mapleader      = " "
g.maplocalleader = "\\"

o.termguicolors  = true  -- True color support
o.spell          = false -- Spell check
o.errorbells     = false -- Shut up
o.timeoutlen     = 300   -- Timeout for keycodes
o.lazyredraw     = false -- Redraw only when necessary
-- Swap, Backupm, Undo
o.directory      = vim.g.nvim_cache .. "/swap"
o.backupdir      = vim.g.nvim_cache .. "/backup"
o.undodir        = vim.g.nvim_cache .. "/undo"
o.swapfile       = false 
o.backup         = true
o.undofile       = true
o.undolevels     = 10000
-- Files
o.autowrite      = true -- Enable auto write
o.autoread       = true -- Read files changed outside of neovim
o.hidden         = true -- Allow switching buffers with unsaved changes
-- Input
o.backspace      = "indent,eol,start" -- Traditional backspace behavior
-- o.clipboard   = "unnamedplus"      -- Sync with system clipboard
o.mouse          = "a"                -- Enable mouse support for all modes
-- Status
o.laststatus     = 3        -- Last window status line: always and only
o.showcmd        = false    -- show partial command in last line or screen
o.showmode       = false    -- If in Insert, Replace or Visual mode put a message on the last line.
o.signcolumn     = "yes"    -- Show gutter
-- Folding
-- o.foldclose   = "all"
o.foldenable     = true
o.foldexpr       = 'nvim_treesitter#foldexpr()'
o.foldmethod     = 'expr'
-- Completion
o.completeopt    = "menu,menuone,noselect"
-- Search
o.hlsearch       = true      -- highlight search results
o.incsearch      = true      -- Show search matches as you type
o.ignorecase     = true      -- Needed for smartcase
o.smartcase      = true      -- Case is ignored unless a capital letter is used explicitly
o.infercase      = true      -- 'smartcase' for completion
o.inccommand     = "nosplit" -- preview incremental substitutes
-- Location
o.number         = true -- Show line numbers
o.cursorline     = true -- Higlight line of cursor
o.cursorcolumn   = true -- Highlight column of cursor
o.relativenumber = true -- Use relative line numbers
o.ruler          = true -- Show the line and column number of the cursor position, separated by a comma.
o.showmatch      = true
-- Indentation
o.autoindent     = true -- Copy indent from current line when starting new
o.shiftround     = true -- Round indent
o.smartindent    = true -- Insert indents automatically
-- Tabs
o.expandtab      = true -- expand tabs into spaces
o.shiftwidth     = 2    -- Size of an indent
o.softtabstop    = 4
o.tabstop        = 4
-- Scroll
o.scrolloff      = 20 -- Lines of context
o.sidescrolloff  = 20 -- Columns of context
o.sidescroll     = 1
o.smoothscroll   = true
-- Splits
o.splitbelow     = true -- Always open splits below the current windowop
o.splitright     = true -- Always open splits to the right of the current windowop
-- Windows
o.winminheight   = 0 -- Allow maximized windows
o.winminwidth    = 0 -- Allow maximized windows
-- Text
o.wrap           = false -- Do not wrap text
o.textwidth      = 0     -- Unlimited text width
o.startofline    = true  -- Place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D
o.wrapmargin     = 0
-- Syntax
o.conceallevel   = 3 -- Custom replacement charaters
-- Wild Menu
o.wildignorecase = true
o.wildmenu       = true -- Enhanced command line completion
o.wildmode       = "longest,list,full"
o.wildignore     = ".git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"
