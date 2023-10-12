-- vim: foldmethod=marker foldmarker={{{,}}}


local o = vim.o
local g = vim.g

--------------------------------
------- (Global) Vars ----------
--------------------------------

g.mapleader             = " "
g.maplocalleader        = "\\"

g.nvim_cache            = os.getenv('HOME') .. "/.cache/nvim"
g.python_bin_dir        = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin'
g.python3_host_prog     = g.python_bin_dir .. '/python'

g.cursorhold_updatetime = 100


-------------------------------
---------- Options -------------
-------------------------------


o.directory      = g.nvim_cache .. "/swap"
o.backupdir      = g.nvim_cache .. "/backup"
o.undodir        = g.nvim_cache .. "/undo"

o.backup         = true
o.swapfile       = false
o.undofile       = true
o.undolevels     = 10000
o.cursorline     = true

o.timeoutlen     = 300
o.backspace      = "indent,eol,start" -- Traditional backspace behavior
o.errorbells     = false              -- Shut up
o.magic          = true               -- Give certain characters special meaning with backslash
o.mouse          = "a"                -- Mouse enabled in all modes

o.foldenable     = false               -- Enable folding
o.termguicolors  = true               -- true color support
o.conceallevel   = 3                  -- Hide * markup for bold and italic

o.laststatus     = 3                  -- Last window status line: always and only
o.ruler          = true               -- Show the line and column number of the cursor position, separated by a comma.
o.showcmd        = true               -- show partial command in last line or screen
o.showmatch      = true               -- When a bracket is inserted, briefly jump to the matching one
o.showmode       = false              -- If in Insert, Replace or Visual mode put a message on the last line.

o.number         = true               -- Show line numbers
o.relativenumber = true               -- Use relative line numbers
o.signcolumn     = "yes"              -- Show gutter

o.autoread       = true               -- Always load the file when entering a buffer
o.autowrite      = true               -- Enable auto write
o.hidden         = true               -- Allow switching buffers with unsaved changes

o.autochdir      = false              -- Automatically cd to current directory of open file
o.autoindent     = true               -- copy indent from current line when starting new line
o.smartindent    = true               -- Insert indents automatically

o.splitbelow     = true               -- Always open splits below the current window
o.splitright     = true               -- Always open splits to the right of the current window
o.startofline    = true               -- Place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D

o.winminheight   = 0                  -- Allow maximized windows
o.winminwidth    = 0                  -- Allow maximized windows

o.scrolloff      = 4                  -- Lines of context
o.textwidth      = 0                  -- Unlimited text width
o.wrap           = false              -- Do not wrap text
o.linebreak      = true

o.hlsearch       = true      -- highlight search results
o.incsearch      = true      -- Show search matches as you type
o.smartcase      = true      -- Case is ignored unless a capital letter is used explicitly
o.inccommand     = "nosplit" -- preview incremental substitutes

o.expandtab      = true      -- expand tabs into spaces
o.shiftwidth     = 2
o.softtabstop    = 4
o.tabstop        = 4

o.wildmenu       = true -- Enhanced command line completion
o.wildignorecase = true
o.completeopt    = "menu,menuone,noselect"
o.wildmode       = "longest,list,full"
o.wildignore     = ".git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"



