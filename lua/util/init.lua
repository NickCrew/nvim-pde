local M = {}

function M.mkabbrev(abr, cmd)
  vim.api.nvim_cmd({
    cmd = "cnoreabbrev",
    args = { abr, cmd }
  })

end


return M
