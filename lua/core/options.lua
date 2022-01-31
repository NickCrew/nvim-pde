-- lua/core/options.lua
--

local global = require("core.global")
local o = vim.o

o.termguicolors = true

-- Encoding and Line Endings
o.encoding = 'utf-8'
o.fileformats = 'unix,dos,mac'  -- line endings to try

-- Quality of Life
o.errorbells = false    -- shut up
o.autochdir = false     -- automatically cd to current directory of open file
o.magic = true          -- give certain characters special meaning with backslash
o.mouse = 'a'           -- mouse enabled in all modes
o.startofline = false   -- place cursor at start of line for certain commands e.g. S-g, gg, Ctrl-U, Ctrl-D
o.backspace = 'indent,eol,start'  -- traditional backspace behavior

-- Completion
o.completeopt = 'menu,menuone,noselect'

-- File reading/writing
o.autoread = true     -- automatically read changed files
o.hidden = true       -- allow leaving buffer without writing

-- Tabs and Indents
o.expandtab = false   -- expand tabs into spaces
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.autoindent = true   -- copy indent from current line when starting new line

-- Text behaviour
-- o.formatoptions = o.formatoptions
--                    + 't'    -- auto-wrap text using textwidth
--                    + 'c'    -- auto-wrap comments using textwidth
--                    + 'r'    -- auto insert comment leader on pressing enter
--                    - 'o'    -- don't insert comment leader on pressing o
--                    + 'q'    -- format comments with gq
--                    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--                    + 'n'    -- autoformat numbered list
--                    - '2'    -- I am a programmer and not a writer
--                    + 'j'    -- Join comments smartly
o.formatoptions = o.formatoptions .. 'o'
o.joinspaces = false

-- Wrapping
o.wrap = true
o.linebreak = true
o.textwidth = 0

-- Folding
o.foldenable = true
o.foldmarker = '{{{,}}}'
o.foldmethod = 'marker'

-- Searching
o.hlsearch = true
o.incsearch = true
o.inccommand = true
o.smartcase = true

-- Look and feel
o.ruler = true
o.laststatus = 2
o.showcmd = true
o.showmatch = false
o.showmode = false
o.splitbelow = true
o.splitright = true
o.number = true
o.signcolumn = "auto:2"  -- max columns allowed in gutter. syntax: auto:N

-- Backup/Undo/Swap
o.backup = false
o.swapfile = false
o.undodir = global.cache_dir .. 'undo/'
o.undofile = true

-- Wildmenu
o.wildmenu = true
o.wildmode = 'longest,list,full'
o.wildignorecase = true
o.wildignore = '.git/**,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**'

vim.g.python3_host_prog = os.getenv('HOME')..'/.pyenv/versions/neovim/bin/python'


