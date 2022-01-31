return {
    "Pocco81/DAPInstall.nvim",
  requires = {
    "rcarriga/nvim-dap-ui",
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',
    "mfussenegger/nvim-dap",
    'nvim-telescope/telescope-dap.nvim',
  },
  config = function()

    local dap_install = require('dap-install')

    dap_install.setup({
        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    })
    dap_install.config(
      "jsnode", {},
      "python", {}
    )
    require('nvim-dap-virtual-text').setup()

    local python_path = os.getenv('HOME')..'/.pyenv/versions/debugpy/bin/python'
    require('dap-python').setup(python_path)
    require('dapui').setup()

    -- -- Dap UI will open automatically
    -- local dap, dapui = require("dap"), require("dapui")
    -- dap.listeners.after.event_initialized["dapui_config"] = function()
    --   dapui.open()
    -- end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end


    require('keymap').apply_dap_keymaps()

  end
}
