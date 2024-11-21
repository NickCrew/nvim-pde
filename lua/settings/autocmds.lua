
local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

local aucmd = vim.api.nvim_create_autocmd


-----------------------------------------
--  Set filetype based on file extennsion
-----------------------------------------
aucmd({ "BufNewFile", "BufRead" }, {
  group = augroup("filetype"),
  pattern = "*.tf",
  callback = function()
    vim.cmd("set ft=terraform")
  end,
})


-----------------------------------------------------
-- Check if we need to reload the file after changes
----------------------------------------------------
aucmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})


-----------------------------------------------------
-- Auto create parent directories when saving a file
-----------------------------------------------------
aucmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})


---------------------
-- Highlight on yank
--------------------
aucmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})


--------------------------------------
-- Resize splits if window got resized
--------------------------------------
aucmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})


----------------------------------
-- Terminal escaping improvements
----------------------------------
aucmd({ "TermOpen" }, {
  group = augroup("terminals"),
  callback = function()
    _G.set_terminal_keymaps()
  end,
})


------------------
-- User LSP Config
------------------
aucmd('LspAttach', {
  group = augroup('UserLspConfig'),
  callback = function(ev)
    _G.set_lsp_keymaps(ev.buf)
  end,
})

