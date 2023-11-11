return {
  {
    -- Git Integration
    "tpope/vim-fugitive",
    lazy    = true,
    enabled = true,
    config  = true
  },
  {
    -- Get links to github
    "ruifm/gitlinker.nvim",
    config = true
  },
  {
    -- Git worktree support
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    enabled = false
  },
  {
    -- Github integration
    "pwntester/octo.nvim",
    cmd = "Octo",
    lazy = true,
    config = true
  },
  {
    -- git changes in sign column
    "lewis6991/gitsigns.nvim",
    lazy = false,
    keys = {
      { "<leader>gB",  "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame Line" },
      { "<leader>gb",  "<cmd>Gitsigns blame_line<cr>",                desc = "Show Commit Message" },
      { "<leader>gsh", "<cmd>Gitsigns stage_hunk<cr>",                desc = "Stage Hunk" },
      { "<leader>gsb", "<cmd>Gitsigns stage_buffer<cr>",              desc = "Stage Buffer" },
      { "<leader>gsH", "<cmd>Gitsigns undo_stage_hunk<cr>",           desc = "Undo Stage Hunk" },
      { "<leader>grh", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset Hunk" },
      { "<leader>grb", "<cmd>Gitsigns reset_buffer<cr>",              desc = "Reset Buffer" },
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


}
