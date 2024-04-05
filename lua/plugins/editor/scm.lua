return {
  {
    -- Get links to github
    "ruifm/gitlinker.nvim",
    config = true,
    lazy = true,
    event = "VeryLazy",

  },
  {
    -- Github integration
    "pwntester/octo.nvim",
    cmd = "Octo",
    lazy = true,
    config = true
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    lazy = true,
    config = true,
    cmd = "Neogit", 
    keys = {
      { "<leader>gg", mode = "n", "<cmd>Neogit<cr>", desc = "Neogit" },
    },

  },

  {
    -- git changes in sign column
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {

      { "<leader>gg",   mode = "n", "<esc><Cmd>Octo gist list<cr>",                     desc = "List Gists" },
      { "<leader>gbc",  mode = "n", "<esc><cmd>Gitsigns blame_line<cr>",                desc = "Show Commit Message" },
      { "<leader>gb1l", mode = "n", "<esc><cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame Line" },
      { "<leader>gd",   mode = "n", "<esc><cmd>Gitsigns diffthis<cr>",                  desc = "Diff This" },
      { "<leader>gf",   mode = "n", "<esc><cmd>Gitsigns setqflsit",                     desc = "Set QF List" },
      { "<leader>gl",   mode = "n", "<esc><cmd>Gitsigns setloclist",                    desc = "Set Location List" },
      { "<leader>ghn",  mode = "n", "<esc><cmd>Gitsigns next_hunk<cr>",                 desc = "Next Hunk" },
      { "<leader>ghp",  mode = "n", "<esc><cmd>Gitsigns next_hunk<cr>",                 desc = "Previous Hunk" },
      { "<leader>gsH",  mode = "n", "<esc><cmd>Gitsigns undo_stage_hunk<cr>",           desc = "Undo Stage Hunk" },
      { "<leader>gsb",  mode = "n", "<esc><cmd>Gitsigns stage_buffer<cr>",              desc = "Stage Buffer" },
      { "<leader>gsh",  mode = "n", "<esc><cmd>Gitsigns stage_hunk<cr>",                desc = "Stage Hunk" },
      { "<leader>grh",  mode = "n", "<esc><cmd>Gitsigns reset_hunk<cr>",                desc = "Reset Hunk" },
      { "<leader>grb",  mode = "n", "<esc><cmd>Gitsigns reset_buffer<cr>",              desc = "Reset Buffer" },
    },
    opts = {
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = {
          hl = "GitSignsDelete",
          text = "契",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = "▎",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = true,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = true,
      },
    }
  },
  {
    -- Git worktree support
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    enabled = false
  },
}
