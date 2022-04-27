local opts = { noremap = true, silent = true }
-- Move To Window Left

Mapper.map(
  "n",
  "<C-h>",
  "<C-w><C-h>",
  opts,
  "Navigation",
  "nav_left",
  "Move To Window Left"
)
-- Move To Window Above
Mapper.map(
  "n",
  "<C-k>",
  "<C-w><C-k>",
  opts,
  "Navigation",
  "nav_up",
  "Move To Window Above"
)
-- Move To Window Right
Mapper.map(
  "n",
  "<C-l>",
  "<C-w><C-l>",
  opts,
  "Navigation",
  "nav_right",
  "Move To Window Right"
)
-- Move To Window Below
Mapper.map(
  "n",
  "<C-j>",
  "<C-w><C-j>",
  opts,
  "Navigation",
  "nav_down",
  "Move To Window Below"
)
-- Go To Last Buffer
Mapper.map(
  "n",
  "<leader><tab>",
  ":b#<CR>",
  opts,
  "Buffers",
  "buf_gotolast",
  "Go To Last Buffer"
)

-- Resize a window to size 10
Mapper.map(
  "n",
  "<C-e>r",
  "<cmd>:resize 10<CR>",
  opts,
  "Quick Window Resize",
  "win_quickresize",
  "Resize a window to size 10"
)

-- Quickly Escape Terminal
Mapper.map(
  "t",
  "<Esc><Esc>",
  "<C-\\><C-n>",
  opts,
  "Terminal",
  "term_quickesc",
  "Quickly Escape Terminal"
)
-- Increase Horizontal Width
Mapper.map(
  "n",
  "<M-right>",
  "<C-w>l<C-w>|",
  opts,
  "Windows",
  "win_resizewidthright",
  "Increase Horizontal Width"
)
-- Descrease Horizontal Width
Mapper.map(
  "n",
  "<M-left>",
  "<C-w>h<C-w>|",
  opts,
  "Windows",
  "win_resizewidthleft",
  "Descrease Horizontal Width"
)
-- Decrease Split Size
Mapper.map(
  "n",
  "<M-down>",
  "<C-w>j<C-w>_",
  opts,
  "Windows",
  "win_resizesplitmin",
  "Decrease Split Size"
)
-- Increase Split Size
Mapper.map(
  "n",
  "<M-up>",
  "<C-w>k<C-w>_",
  opts,
  "Windows",
  "win_resizesplitpos",
  "Increase Split Size"
)
-- Maximize Window
Mapper.map(
  "n",
  "<C-_>",
  "<C-w>_",
  opts,
  "Windows",
  "win_maxwin",
  "Maximize Window"
)




-- Turn Off Search Highlights
Mapper.map(
  "n",
  "<leader>,",
  ":noh<CR>",
  opts,
  "Search",
  "search_nohighlights",
  "Turn Off Search Highlights"
)
Mapper.map(
  "n",
  "<leader><leader>,",
  "zz",
  opts,
  "Center Window",
  "win_center",
  "Center Window Vertical"
)
Mapper.map(
  "n",
  "N",
  "Nzz",
  opts,
  "Search",
  "search_backwardcenter",
  "Search backward and Center"
)
Mapper.map(
  "n",
  "n",
  "nzz",
  opts,
  "Search",
  "search_forwardcenter",
  "Search Forward and Center"
)

--------------
-- Plugins
--------------
Mapper.map(
  "n",
  "<M-]>",
  ":BufferLineCycleNext<CR>",
  opts,
  "Buffers",
  "buf_next",
  "Next Buffer"
)
-- Previous Buffer
Mapper.map(
  "n",
  "<M-[>",
  ":BufferLineCyclePrev<CR>",
  opts,
  "Buffers",
  "buf_prev",
  "Previous Buffer"
)
