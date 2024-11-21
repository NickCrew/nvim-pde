-- settings.options
--

local o = vim.o
local g = vim.g

-- PATHS
g.nvim_cache        = os.getenv('HOME') .. "/.cache/nvim"
g.python3_host_prog = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin/python'

-- LEADER
g.mapleader         = " "  -- Leader
g.maplocalleader    = "\\"  -- Local Leader

-- OPTIONS
o.termguicolors  = true  -- True color support
o.spell          = false -- Spell check
o.errorbells     = false -- Shut up
o.timeoutlen     = 300   -- Timeout for keycodes
o.lazyredraw     = false -- Redraw only when necessary
o.directory      = vim.g.nvim_cache .. "/swap" -- Swap directory
o.backupdir      = vim.g.nvim_cache .. "/backup" -- Backup directory
o.undodir        = vim.g.nvim_cache .. "/undo" -- Undo directory
o.swapfile       = false -- Disable swap files
o.backup         = true -- Enable backup files
o.undofile       = true -- Enable undo files
o.undolevels     = 10000 -- Maximum number of changes that can be undone

-- FILES
o.autowrite      = true -- Enable auto write
o.autoread       = true -- Read files changed outside of neovim
o.hidden         = true -- Allow switching buffers with unsaved changes

-- INPUT
o.backspace      = "indent,eol,start" -- Traditional backspace behavior
-- o.clipboard   = "unnamedplus"      -- Sync with system clipboard
o.mouse          = "a"                -- Enable mouse support for all modes

-- STATUS
o.laststatus     = 3        -- Last window status line: always and only
o.showcmd        = false    -- show partial command in last line or screen
o.showmode       = false    -- If in Insert, Replace or Visual mode put a message on the last line.
o.signcolumn     = "yes"    -- Show gutter

-- FOLDING
-- o.foldclose   = "all"
o.foldenable     = true -- Enable folds
o.foldexpr       = 'nvim_treesitter#foldexpr()' -- Treesitter folding
o.foldmethod     = 'expr'  -- Treesitter folding

-- COMPLETION
o.completeopt    = "menu,menuone,noselect" -- Completion options

-- SEARCH
o.hlsearch       = true      -- highlight search results
o.incsearch      = true      -- Show search matches as you type
o.ignorecase     = true      -- Needed for smartcase
o.smartcase      = true      -- Case is ignored unless a capital letter is used explicitly
o.infercase      = true      -- 'smartcase' for completion
o.inccommand     = "nosplit" -- preview incremental substitutes

-- LOCATION 
o.number         = true -- Show line numbers
o.cursorline     = true -- Higlight line of cursor
o.cursorcolumn   = true -- Highlight column of cursor
o.relativenumber = true -- Use relative line numbers
o.ruler          = true -- Show the line and column number of the cursor position, separated by a comma.
o.showmatch      = true

-- INDENTATION
o.autoindent     = true -- Copy indent from current line when starting new
o.shiftround     = true -- Round indent
o.smartindent    = true -- Insert indents automatically

-- TABS
o.expandtab      = true -- expand tabs into spaces
o.shiftwidth     = 2    -- Size of an indent
o.softtabstop    = 4 -- Number of spaces a tab counts for
o.tabstop        = 4 -- Number of spaces a tab counts for

-- SCROLL
o.scrolloff      = 20 -- Lines of context
o.sidescrolloff  = 20 -- Columns of context
o.sidescroll     = 1 -- Columns to scroll horizontally
o.smoothscroll   = true -- Smooth scrolling

-- SPLITS
o.splitbelow     = true -- Always open splits below the current windowop
o.splitright     = true -- Always open splits to the right of the current windowop

-- WINDOWS
o.winminheight   = 0 -- Allow maximized windows
o.winminwidth    = 0 -- Allow maximized windows

-- TEXT
o.wrap           = false -- Do not wrap text
o.textwidth      = 0     -- Unlimited text width
o.startofline    = true  -- Place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D
o.wrapmargin     = 0

-- SYNTAX
o.conceallevel   = 3 -- Custom replacement charaters

-- MENU
o.wildignorecase = true
o.wildmenu       = true -- Enhanced command line completion
o.wildmode       = "longest,list,full"
o.wildignore     = ".git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"

-- Sessions
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
