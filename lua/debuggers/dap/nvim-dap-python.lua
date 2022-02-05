return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  requires = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local python_path = os.getenv("HOME") .. "/.pyenv/versions/debugpy/bin/python"
    require("dap-python").setup(python_path)
  end,
}
