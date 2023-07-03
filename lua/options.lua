-- vim: foldmethod=marker foldmarker={{{,}}}
--
-- lua/core/options.lua
--

local o = vim.o
local nvim_cache = os.getenv("HOME") .. "/.cache/nvim"

-- Appearance
o.termguicolors = true

-- Input
o.backspace = "indent,eol,start" -- Traditional backspace behavior
o.errorbells = false -- Shut up
o.magic = true -- Give certain characters special meaning with backslash
o.mouse = "a" -- Mouse enabled in all modes
o.timeoutlen = 500

-- Behavior Preferences
o.autochdir = false -- Automatically cd to current directory of open file
o.autoindent = true -- copy indent from current line when starting new line
o.autoread = true -- Always load the file when entering a buffer
o.autowriteall = true -- Always write the file when leaving the buffer
o.hidden = true -- Allow switching buffers with unsaved changes
o.splitbelow = true -- Always open splits below the current window
o.splitright = true -- Always open splits to the right of the current window
o.startofline = true -- Place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D

-- Searching
o.hlsearch = true -- highlight search results
o.incsearch = true -- Show search matches as you type
o.smartcase = true -- Case is ignored unless a capital letter is used explicitly

-- Look and feel
o.linebreak = true
o.textwidth = 0
o.wrap = true
o.winminheight = 0 -- Allow maximized windows
o.winminwidth = 0 -- Allow maximized windows
o.foldenable = true -- Enable folding

-- Default Tab Behavior
o.expandtab = false -- expand tabs into spaces
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4

-- UI  Elements
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.laststatus = 3 -- Last window status line: always and only
o.showcmd = true -- show partial command in last line or screen
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one
o.showmode = true -- If in Insert, Replace or Visual mode put a message on the last line.
o.number = true -- Show line numbers
o.relativenumber = true  -- Use relative line numbers
o.signcolumn = "yes" -- Show gutter

-- Completion
o.completeopt = "menu,menuone,noselect"
o.wildmode = "longest,list,full"
o.wildmenu = true  -- Enhanced command line completion
o.wildignorecase = true
o.wildignore = ".git/**,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"

-- Cache/Saving
o.backup = true
o.swapfile = false
o.undofile = true
o.directory = nvim_cache .. "/swap"
o.backupdir = nvim_cache .. "/backup"
o.undodir = nvim_cache .. "/undo"
