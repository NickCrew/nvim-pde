-------------------------------------------------
-- File: settings.options
-- Sourced Directly By: init.lua
-- Description: Options and Globals
-------------------------------------------------


local o                 = vim.o
local g                 = vim.g

-------------------[ GLOBAL ]----------------------
g.mapleader             = " "
g.maplocalleader        = "\\"
g.cursorhold_updatetime = 100
g.nvim_cache            = os.getenv('HOME') .. "/.cache/nvim"
g.python3_host_prog     = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin/python'
---------------------------------------------------

-- System
o.backspace             = "indent,eol,start" -- Traditional backspace behavior
o.clipboard             = "unnamedplus"      -- Sync with system clipboard
o.mouse                 = "a"                -- Mouse enabled in all modes
o.termguicolors         = true               -- true color support

-- File Saving
o.autowrite             = true -- Enable auto write
o.autoread              = true -- Read files changed outside of neovim
o.hidden                = true -- Allow switching buffers with unsaved changes

-- Swap Files
o.swapfile              = true
o.directory             = g.nvim_cache .. "/swap"

-- Backup Files
o.backup                = true
o.backupdir             = g.nvim_cache .. "/backup"

-- Undo
o.undodir               = g.nvim_cache .. "/undo"
o.undofile              = true
o.undolevels            = 10000

-- Indentation
o.autoindent            = true -- Copy indent from current line when starting new
o.shiftround            = true -- Round indent
o.smartindent           = true -- Insert indents automatically

-- Folding
o.foldenable            = true -- Enable folding
o.foldmethod            = "expr"
o.foldlevel             = 99
vim.wo.foldexpr         = "v:lua.vim.treesitter.foldexpr()"

-- Completion
o.completeopt           = "menu,menuone,noselect"

-- Search
o.hlsearch              = true      -- highlight search results
o.inccommand            = "nosplit" -- preview incremental substitutes
o.incsearch             = true      -- Show search matches as you type
o.smartcase             = true      -- Case is ignored unless a capital letter is used explicitly

-- Location
o.number                = true -- Show line numbers
o.cursorline            = true -- Higlight line of cursor
o.relativenumber        = true -- Use relative line numbers
o.ruler                 = true -- Show the line and column number of the cursor position, separated by a comma.

-- Tabs
o.expandtab             = true -- expand tabs into spaces
o.shiftwidth            = 2    -- Size of an indent
o.softtabstop           = 4
o.tabstop               = 4

-- Look and Feel
o.laststatus            = 3     -- Last window status line: always and only
o.signcolumn            = "yes" -- Show gutter
o.showcmd               = false -- show partial command in last line or screen
o.showmatch             = false -- When a bracket is inserted, briefly jump to the matching one
o.showmode              = false -- If in Insert, Replace or Visual mode put a message on the last line.
o.errorbells            = false -- Shut up

-- Scroll
o.scrolloff             = 4 -- Lines of context
o.sidescrolloff         = 8 -- Columns of context
o.smoothscroll          = true

-- Splits
o.splitbelow            = true -- Always open splits below the current window
o.splitright            = true -- Always open splits to the right of the current window

-- Windows
o.winminheight          = 0 -- Allow maximized windows
o.winminwidth           = 0 -- Allow maximized windows

-- Text
o.linebreak             = true
o.textwidth             = 0     -- Unlimited text width
o.wrap                  = false -- Do not wrap text
o.conceallevel          = 3     -- Hide * markup for bold and italic
o.magic                 = true  -- Give certain characters special meaning with backslash

-- Behavior
o.startofline           = true -- Place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D
o.timeoutlen            = 300

-- Wild Menu
o.wildignorecase        = true
o.wildmenu              = true -- Enhanced command line completion
o.wildmode              = "longest,list,full"
o.wildignore            = ".git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"
