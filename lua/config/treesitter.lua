-- lua/configure/treesitter.lua
--
  -- Treesitter Parsers
  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
  parser_configs.markdown.filetype_to_parsername = "octo"
  -- Treesitter Config
  require("nvim-treesitter.configs").setup({
      ensure_installed = {
          "cpp",
          "dockerfile",
          "fennel",
          "go",
          "hcl",
          "html",
          "gitignore",
          "gitcommit",
          "http",
          "javascript",
          "json",
          "lua",
          "markdown",
          "python",
          "rust",
          "scss",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
      },
      highlight = {
          enable = true,
      },
      playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
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
      rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1500,
      },
      textsubjects = {
          enable = true,
          prev_selection = ',', -- (Optional) keymap to select the previous selection
          keymaps = {
              ['.'] = 'textsubjects-smart',
              ['I;'] = 'textsubjects-container-outer',
              ['i;'] = 'textsubjects-container-inner',
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
                  ["<leader>if"] = "@function.outer",
                  ["<leader>of"] = "@function.inner",
                  ["<leader>oc"] = "@class.outer",
                  ["<leader>ic"] = "@class.inner",
              },
          },
      },
  })
  
