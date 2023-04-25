local dap_py = require("dap-python")
local py_path = os.getenv("HOME") .. "/.pyenv/versions/neovim/bin/python"
dap_py.setup(py_path)
dap_py.test_runner = "pytest"
