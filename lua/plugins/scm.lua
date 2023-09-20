return {
  {
    -- Git Integration
    "tpope/vim-fugitive",
    lazy = true,
    enabled = true,
  },
  {
    -- Github integration
    "pwntester/octo.nvim",
    cmd = "Octo",
    opts = {
      default_remote = { "upstream", "origin" }, -- order to try remotes
      reaction_viewer_hint_icon = "",    -- marker for user reactions
      user_icon = " ",                   -- user icon
      timeline_marker = "",              -- timeline marker
      timeline_indent = "2",                -- timeline indentation
      right_bubble_delimiter = "",       -- Bubble delimiter
      left_bubble_delimiter = "",        -- Bubble delimiter
      snippet_context_lines = 4,            -- number or lines around commented lines
      file_panel = {
        size = 10,                          -- changed files panel rows
        use_icons = true,                   -- use web-devicons in file panel
      },
      mappings = {
        file_panel_mappings = {
          next_entry = "j",    -- move to next changed file
          prev_entry = "k",    -- move to previous changed file
          select_entry = "<cr>", -- show selected changed file diffs
          refresh_files = "R", -- refresh changed files panel
          focus_files = ",e",  -- move focus to changed file panel
          toggle_files = ",b", -- hide/show changed files panel
          select_next_entry = "]q", -- move to previous changed file
          select_prev_entry = "[q", -- move to next changed file
          close_review_tab = "<C-c>", -- close review tab
          toggle_viewed = ",,", -- toggle viewer viewed state
        },
        review_diff_mappings = {
          add_review_comment = ",ca", -- add a new review comment
          add_review_suggestion = ",sa", -- add a new review suggestion
          focus_files = ",e",     -- move focus to changed file panel
          toggle_files = ",b",    -- hide/show changed files panel
          next_thread = "]t",     -- move to next thread
          prev_thread = "[t",     -- move to previous thread
          select_next_entry = "]q", -- move to previous changed file
          select_prev_entry = "[q", -- move to next changed file
          close_review_tab = "<C-c>", -- close review tab
          toggle_viewed = ",,",   -- toggle viewer viewed state
        },
        submit_mappings = {
          approve_review = "<C-a>", -- approve review
          comment_review = "<C-m>", -- comment review
          request_changes = "<C-r>", -- request changes review
          close_review_tab = "<C-c>", -- close review tab
        },
        review_mappings = {
          goto_issue = ",gi",  -- navigate to a M.repo issue
          add_comment = ",ca", -- add comment
          add_suggestion = ",sa", -- add suggestion
          delete_comment = ",cd", -- delete comment
          next_comment = "]c", -- go to next comment
          prev_comment = "[c", -- go to previous comment
          select_next_entry = "]q", -- move to previous changed file
          select_prev_entry = "[q", -- move to next changed file
          close_review_tab = "<C-c>", -- close review tab
          react_hooray = ",rp", -- add/remove 🎉 reaction
          react_heart = ",rh", -- add/remove ❤️ reaction
          react_eyes = ",re",  -- add/remove 👀 reaction
          react_thumbs_up = ",r+", -- add/remove 👍 reaction
          react_thumbs_down = ",r-", -- add/remove 👎 reaction
          react_rocket = ",rr", -- add/remove 🚀 reaction
          react_laugh = ",rl", -- add/remove 😄 reaction
          react_confused = ",rc", -- add/remove 😕 reaction
        },
        pr_mappings = {
          checkout_pr = ",po", -- checkout PR
          merge_pr = ",pm",    -- merge PR
          list_commits = ",pc", -- list PR commits
          list_changed_files = ",pf", -- list PR changed files
          show_pr_diff = ",pd", -- show PR diff
          add_reviewer = ",va", -- add reviewer
          remove_reviewer = ",vd", -- remove reviewer request
          close_issue = ",ic", -- close PR
          reopen_issue = ",io", -- reopen PR
          list_issues = ",il", -- list open issues on same repo
          reload = "<C-r>",    -- reload PR
          open_in_browser = "<C-b>", -- open PR in browser
          copy_url = "<C-y>",  -- copy url to system clipboard
          add_assignee = ",aa", -- add assignee
          remove_assignee = ",ad", -- remove assignee
          create_label = ",lc", -- create label
          add_label = ",la",   -- add label
          remove_label = ",ld", -- remove label
          goto_issue = ",gi",  -- navigate to a M.repo issue
          add_comment = ",ca", -- add comment
          delete_comment = ",cd", -- delete comment
          next_comment = "]c", -- go to next comment
          prev_comment = "[c", -- go to previous comment
          react_hooray = ",rp", -- add/remove 🎉 reaction
          react_heart = ",rh", -- add/remove ❤️ reaction
          react_eyes = ",re",  -- add/remove 👀 reaction
          react_thumbs_up = ",r+", -- add/remove 👍 reaction
          react_thumbs_down = ",r-", -- add/remove 👎 reaction
          react_rocket = ",rr", -- add/remove 🚀 reaction
          react_laugh = ",rl", -- add/remove 😄 reaction
          react_confused = ",rc", -- add/remove 😕 reaction
        },
        issue_mappings = {
          close_issue = ",ic", -- close issue
          reopen_issue = ",io", -- reopen issue
          list_issues = ",il", -- list open issues on same repo
          reload = "<C-r>",   -- reload issue
          open_in_browser = "<C-b>", -- open issue in browser
          copy_url = "<C-y>", -- copy url to system clipboard
          add_assignee = ",aa", -- add assignee
          remove_assignee = ",ad", -- remove assignee
          create_label = ",lc", -- create label
          add_label = ",la",  -- add label
          remove_label = ",ld", -- remove label
          goto_issue = ",gi", -- navigate to a M.repo issue
          add_comment = ",ca", -- add comment
          delete_comment = ",cd", -- delete comment
          next_comment = "]c", -- go to next comment
          prev_comment = "[c", -- go to previous comment
          react_hooray = ",rp", -- add/remove 🎉 reaction
          react_heart = ",rh", -- add/remove ❤️ reaction
          react_eyes = ",re", -- add/remove 👀 reaction
          react_thumbs_up = ",r+", -- add/remove 👍 reaction
          react_thumbs_down = ",r-", -- add/remove 👎 reaction
          react_rocket = ",rr", -- add/remove 🚀 reaction
          react_laugh = ",rl", -- add/remove 😄 reaction
          react_confused = ",rc", -- add/remove 😕 reaction
        },
      },
    },
    lazy = true,
  },
  {
    -- git changes in sign column
    "lewis6991/gitsigns.nvim",
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
    -- Get links to github
    "ruifm/gitlinker.nvim",
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
