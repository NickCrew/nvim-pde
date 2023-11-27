-------------------------------------------------
-- File: settings.options
-- Sourced Directly By: init.lua
-- Description: Options and Globals
-------------------------------------------------

local o = vim.o
local g = vim.g

o.autowrite      = true               -- Enable auto write
o.autoread       = true               -- Read files changed outside of neovim
o.autoindent     = true               -- Copy indent from current line when starting new
o.backspace      = "indent,eol,start" -- Traditional backspace behavior
o.backup         = true
o.backupdir      = g.nvim_cache .. "/backup"
o.clipboard      = "unnamedplus" -- Sync with system clipboard
o.completeopt    = "menu,menuone,noselect"
o.conceallevel   = 3             -- Hide * markup for bold and italic
o.cursorline     = true          -- Higlight line of cursor
o.directory      = g.nvim_cache .. "/swap"
o.errorbells     = false         -- Shut up
o.expandtab      = true          -- expand tabs into spaces
o.foldenable     = false         -- Enable folding
o.hidden         = true          -- Allow switching buffers with unsaved changes
o.hlsearch       = true          -- highlight search results
o.inccommand     = "nosplit"     -- preview incremental substitutes
o.incsearch      = true          -- Show search matches as you type
o.laststatus     = 3             -- Last window status line: always and only
o.linebreak      = true
o.magic          = true          -- Give certain characters special meaning with backslash
o.mouse          = "a"           -- Mouse enabled in all modes
o.number         = true          -- Show line numbers
o.relativenumber = true          -- Use relative line numbers
o.ruler          = true          -- Show the line and column number of the cursor position, separated by a comma.
o.scrolloff      = 4             -- Lines of context
o.shiftround     = true          -- Round indent
o.shiftwidth     = 2
o.shiftwidth     = 2             -- Size of an indent
o.showcmd        = true          -- show partial command in last line or screen
o.showmatch      = true          -- When a bracket is inserted, briefly jump to the matching one
o.showmode       = false         -- If in Insert, Replace or Visual mode put a message on the last line.
o.sidescrolloff  = 8             -- Columns of context
o.signcolumn     = "yes"         -- Show gutter
o.smartcase      = true          -- Case is ignored unless a capital letter is used explicitly
o.smartindent    = true          -- Insert indents automatically
o.smoothscroll   = true
o.softtabstop    = 4
o.splitbelow     = true          -- Always open splits below the current window
o.splitright     = true          -- Always open splits to the right of the current window
o.startofline    = true          -- Place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D
o.swapfile       = true
o.tabstop        = 4
o.termguicolors  = true          -- true color support
o.textwidth      = 0             -- Unlimited text width
o.timeoutlen     = 300
o.undodir        = g.nvim_cache .. "/undo"
o.undofile       = true
o.undolevels     = 10000
o.wildignore     = ".git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"
o.wildignorecase = true
o.wildmenu       = true  -- Enhanced command line completion
o.wildmode       = "longest,list,full"
o.winminheight   = 0     -- Allow maximized windows
o.winminwidth    = 0     -- Allow maximized windows
o.wrap           = false -- Do not wrap text



