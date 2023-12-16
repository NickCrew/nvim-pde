-- Autocmds

local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end
local mk_aucmd = vim.api.nvim_create_autocmd

--------------------------------------
-- Check if we need to reload the file 
-- after changes
----------------------------------------
mk_aucmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})


--------------------------------------
-- Auto create parent directories when 
-- saving a file
--------------------------------------
mk_aucmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})


--------------------------------------
-- Highlight on yank
--------------------------------------
mk_aucmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})


--------------------------------------
-- Resize splits if window got resized
--------------------------------------
mk_aucmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})


