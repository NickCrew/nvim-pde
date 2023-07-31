return {
  {
    -- Debug adapter protocol support
    "mfussenegger/nvim-dap",
    enabled = true,
  },


  {
    -- Debug UI
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("config.dap_utils")
    end,
  },

  {
    -- Debugger virtual text
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("config.dap_virtual_text")
    end,
  },

  {
    -- python debuggin
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("config.dap_python")
    end,
  },

  {
    -- GDB
    "sakhnik/nvim-gdb",
    enabled = false,
    build = "bash ./install.sh",
  },

}
