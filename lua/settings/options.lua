-------------------------------------------------
-- File: settings.options
-- Sourced Directly By: init.lua
-- Description: Options and Globals
-------------------------------------------------
local o                 = vim.o
local g = vim.g

g.mapleader             = " "
g.maplocalleader        = "\\"

o.termguicolors  = true         -- True color support
o.errorbells     = false        -- Shut up
o.timeoutlen     = 300

-- Swap
o.swapfile       = false
o.directory      = vim.g.nvim_cache .. "/swap"

-- Backup
o.backup         = true
o.backupdir      = vim.g.nvim_cache .. "/backup"

-- Undo
o.undofile       = true
o.undodir        = vim.g.nvim_cache .. "/undo"
o.undolevels     = 10000

-- Files
o.autowrite      = true        -- Enable auto write
o.autoread       = true        -- Read files changed outside of neovim
o.hidden         = true        -- Allow switching buffers with unsaved changes

-- Input
o.backspace      = "indent,eol,start"        -- Traditional backspace behavior
o.clipboard      = "unnamedplus"             -- Sync with system clipboard
o.mouse          = "a"                       -- Enable mouse support for all modes

-- Status
o.laststatus     = 3            -- Last window status line: always and only
o.showcmd        = false        -- show partial command in last line or screen
o.showmode       = false        -- If in Insert, Replace or Visual mode put a message on the last line.
o.signcolumn     = "yes"        -- Show gutter

-- Indentation
o.autoindent     = true        -- Copy indent from current line when starting new
o.shiftround     = true        -- Round indent
o.smartindent    = true        -- Insert indents automatically

-- Folding
o.foldenable     = false
o.foldmethod     = 'expr'
o.foldexpr       = 'nvim_treesitter#foldexpr()'

-- Completion
o.completeopt    = "menu,menuone,noselect"

-- Search
o.hlsearch       = true             -- highlight search results
o.incsearch      = true             -- Show search matches as you type
o.smartcase      = true             -- Case is ignored unless a capital letter is used explicitly
o.inccommand     = "nosplit"        -- preview incremental substitutes

-- Location
o.number         = true        -- Show line numbers
o.cursorline     = true        -- Higlight line of cursor
o.relativenumber = true        -- Use relative line numbers
o.ruler          = true        -- Show the line and column number of the cursor position, separated by a comma.

-- Tabs
o.expandtab      = true        -- expand tabs into spaces
o.shiftwidth     = 2           -- Size of an indent
o.softtabstop    = 4
o.tabstop        = 4

-- Scroll
o.scrolloff      = 4        -- Lines of context
o.sidescrolloff  = 8        -- Columns of context
o.smoothscroll   = true

-- Splits
o.splitbelow     = true        -- Always open splits below the current window
o.splitright     = true        -- Always open splits to the right of the current window

-- Windows
o.winminheight   = 0        -- Allow maximized windows
o.winminwidth    = 0        -- Allow maximized windows

-- Text
o.wrap           = false        -- Do not wrap text
o.textwidth      = 0            -- Unlimited text width
o.startofline    = true         -- Place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D

-- Syntax
o.conceallevel   = 3        -- Custom replacement charaters

-- Wild Menu
o.wildignorecase = true
o.wildmenu       = true        -- Enhanced command line completion
o.wildmode       = "longest,list,full"
o.wildignore     = ".git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"
