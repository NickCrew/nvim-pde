return {
  "Pocco81/DAPInstall.nvim",
  requires = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local di = require("dap-install")
    di.setup({
      installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    })
    di.config("jsnode", {}, "python", {})
  end,
}

