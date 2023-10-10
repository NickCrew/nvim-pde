--[[
Group: Syntax Awareness

  - nvim-treehopper
  - nvim-colorizer
  - nvim-treesitter
--]]
return {
  {
    "mfussenegger/nvim-treehopper",
    dependencies = {
      "phaazon/hop.nvim"
    },
    enabled = false,
  },
  { -- highlight color codes
    "norcalli/nvim-colorizer.lua",
    enabled = false
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local parser_configs =
          require("nvim-treesitter.parsers").get_parser_configs()
      parser_configs.markdown.filetype_to_parsername = "octo"

      require("nvim-dap-repl-highlights").setup()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          'dap_repl'
        },
        auto_install = false,
        sync_install = false,
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ["<leader>as"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>aS"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = "shadow",
            peek_definition_code = {
              ["<leader><leader>d"] = "@function.outer",
              ["<leader><leader>D"] = "@class.outer",
            },
          },
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["<leader>of"] = "@function.outer",
              ["<leader>if"] = "@function.inner",
              ["<leader>oc"] = "@class.outer",
              ["<leader>ic"] = "@class.inner",
            },
          },
        },
      })
    end,
  },
  {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {},
},
  {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "gza", -- Add surrounding in Normal and Visual modes
      delete = "gzd", -- Delete surrounding
      find = "gzf", -- Find surrounding (to the right)
      find_left = "gzF", -- Find surrounding (to the left)
      highlight = "gzh", -- Highlight surrounding
      replace = "gzr", -- Replace surrounding
      update_n_lines = "gzn", -- Update `n_lines`
    },
  },
},
  {
    "echasnovski/mini.ai",
    -- keys = {
    --   { "a", mode = { "x", "o" } },
    --   { "i", mode = { "x", "o" } },
    -- },
    event = "VeryLazy",
    dependencies = { "nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
      -- register all text objects with which-key
              ---@type table<string, string|table>
        local i = {
          [" "] = "Whitespace",
          ['"'] = 'Balanced "',
          ["'"] = "Balanced '",
          ["`"] = "Balanced `",
          ["("] = "Balanced (",
          [")"] = "Balanced ) including white-space",
          [">"] = "Balanced > including white-space",
          ["<lt>"] = "Balanced <",
          ["]"] = "Balanced ] including white-space",
          ["["] = "Balanced [",
          ["}"] = "Balanced } including white-space",
          ["{"] = "Balanced {",
          ["?"] = "User Prompt",
          _ = "Underscore",
          a = "Argument",
          b = "Balanced ), ], }",
          c = "Class",
          f = "Function",
          o = "Block, conditional, loop",
          q = "Quote `, \", '",
          t = "Tag",
        }
        local a = vim.deepcopy(i)
        for k, v in pairs(a) do
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(i)
        local ac = vim.deepcopy(a)
        for key, name in pairs({ n = "Next", l = "Last" }) do
          i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
          a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
        end
        require("which-key").register({
          mode = { "o", "x" },
          i = i,
          a = a,
        })
      end
  },
{
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  }, 
  {
    'echasnovski/mini.bracketed',
    version = false
  },
  {
    -- Syntax-aware commenting
    "tpope/vim-commentary",
    enabled = true,
  },

}
