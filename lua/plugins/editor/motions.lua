local select_any_word = function()
  require("flash").jump({
    pattern = ".", -- initialize pattern with any char
    search = {
      mode = function(pattern)
        -- remove leading dot
        if pattern:sub(1, 1) == "." then
          pattern = pattern:sub(2)
        end
        -- return word pattern and proper skip pattern
        return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
      end,
    },
    -- select the range
    jump = { pos = "range" },
  })
end


local jump_to_line = function()
  require("flash").jump({
    search = { mode = "search", max_length = 0 },
    label = { after = { 0, 0 } },
    pattern = "^"
  })
end

local jump_to_word_under_cursor = function()
  require("flash").jump({
    pattern = vim.fn.expand("<cword>"),
  })
end


return {
  {
    "otavioschwanck/arrow.nvim",
    lazy = true,
    cmd = "Arrow",
    event = "BufEnter",
    opts = {
      show_icons = true,
      leader_key = '\\',           -- Recommended to be a single key
      buffer_leader_key = 'm',    -- Per Buffer Mappings
      always_show_path = false,
      separate_by_branch = false, -- Bookmarks will be separated by git branch
      hide_handbook = false,      -- set to true to hide the shortcuts on menu.
      save_path = function()
        return vim.fn.stdpath("cache") .. "/arrow"
      end,
      mappings = {
        edit = "e",
        delete_mode = "d",
        clear_all_items = "C",
        toggle = "s", -- used as save if separate_save_and_remove is true
        open_vertical = "v",
        open_horizontal = "-",
        quit = "q",
        remove = "x", -- only used if separate_save_and_remove is true
        next_item = "]",
        prev_item = "["
      },
      custom_actions = {
        open = function(target_file_name, current_file_name) end, -- target_file_name = file selected to be open, current_file_name = filename from where this was called
        split_vertical = function(target_file_name, current_file_name) end,
        split_horizontal = function(target_file_name, current_file_name) end,
      },
      window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
        width = "auto",
        height = "auto",
        row = "auto",
        col = "auto",
        border = "double",
      },
      per_buffer_config = {
        lines = 4,                 -- Number of lines showed on preview.
        sort_automatically = true, -- Auto sort buffer marks.
        satellite = {              -- defualt to nil, display arrow index in scrollbar at every update
          enable = false,
          overlap = true,
          priority = 1000,
        },
        zindex = 10,                                                       --default 50
        treesitter_context = nil,                                          -- it can be { line_shift_down = 2 }, currently not usable, for detail see https://github.com/otavioschwanck/arrow.nvim/pull/43#issue-2236320268
      },
      separate_save_and_remove = false,                                    -- if true, will remove the toggle and create the save/remove keymaps.
      save_key = "cwd",                                                    -- what will be used as root to save the bookmarks. Can be also `git_root`.
      global_bookmarks = true,                                            -- if true, arrow will save files globally (ignores separate_by_branch)
      index_keys = "asdfhjklASDFHJKLweruio", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
      full_path_list = { "update_stuff" }                                  -- filenames on this list will ALWAYS show the file path too.

    }
  },
  {
    'echasnovski/mini.bracketed',
    version = false,
    lazy = true,
    opts = {},
    event = "VeryLazy"
  },
  {
    -- Quick movements
    "phaazon/hop.nvim",
    enabled = false,
    branch = 'v2',
    opts = {
      case_insensitive = true
    }
  },
  {
    "folke/flash.nvim",
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          jump_labels = true
        },
      },
      jump = {
        nohlsearch = true,
        autojump = true
      },
      search = {
        multi_window = true
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function() require("flash").jump() end,
        desc = "Flash"
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search"
      },
      {
        "<leader>*",
        mode = { "n" },
        jump_to_word_under_cursor,
        desc = "Jump To Word Under Cursor"
      },
      {
        "<leader>ll",
        mode = { "n" },
        jump_to_line,
        desc = "Jump To Line"
      },
      {
        "<leader>ww",
        mode = { "n" },
        select_any_word,
        desc = "Select Any Word"
      },
    },
  }
}
