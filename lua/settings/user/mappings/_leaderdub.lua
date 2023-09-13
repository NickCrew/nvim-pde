local wk = require("which-key")

wk.register({
  {
    name = "+telescope",
    b = {
      "<cmd>Telescope buffers<cr>",
      "Find Buffer"
    },
    d = {
      name = "+dap",
      b = {
        "<cmd>Telescope dap list_breakpoints<cr>",
        "Find DAP Breakpoints",
      },
      c = {
        "<cmd>Telescope dap commands<cr>",
        "Find DAP Commands",
      },
      f = {
        "<cmd>Telescope dap frames<cr>",
        "Find DAP Frames",
      },
      v = {
        "<cmd>Telescope dap variables<cr>",
        "Find DAP Variables",
      },
      C = {
        "<cmd>Telescope dap configurations<cr>",
        "Find DAP Configs",
      },
    },
    f = {
      "<cmd>Telescope find_files<cr>",
      "Find File",
    },
    g = {
      "<cmd>Telescope live_grep<cr>",
      "Find String in Files",
    },
    h = {
      "<cmd>Telescope harpoon marks<cr>",
      "Find Harpooned Files",
    },
    j = {
      "<cmd>Telescope jumplist<cr>",
      "Find in Jumplist"
    },
    k = {
      "<cmd>Telescope keymaps<cr>",
      "Find Keymap",
    },
    l = {
      "<cmd>Telescope luasnip<cr>",
      "Find Snippet",
    },
    m = {
      "<cmd>Telescope marks<cr>",
      "Find in Marks",
    },
    o = {
      "<cmd>Telescope smart_open<cr>",
      "Smart Open",
    },
    r = {
      "<cmd>Telescope registers<cr>",
      "Find in Registers",
    },
    t = {
      "<cmd>Telescope toggleterm<cr>",
      "Find Terminal",
    },
    s = {
      "<cmd>Telescope aerial<cr>",
      "Find Symbols",
    },
    w = {
      "<cmd>ListGitWorktrees<cr>",
      "Git Worktrees",
    },
    B = {
      "<cmd>Telescope file_browser<cr>",
      "Browse Files",
    },
    R = {
      "<cmd>Telescope refactoring<cr>",
      "Refactoring",
    },
  }
}, { prefix = "<leader><leader>", mode = "n" })

