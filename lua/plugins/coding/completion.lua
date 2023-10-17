return {
  {
    -- Docstring generator
    "danymat/neogen",
    cmd = "Neogen",
    lazy = true,
    opts = {
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings",
          },
        },
      },
    },
  },
  {
    -- Completion and Snippets
    "hrsh7th/nvim-cmp",
    -- lazy = true,
    dependencies = {
      "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "ray-x/cmp-treesitter",
      "rcarriga/cmp-dap",
      "saadparwaiz1/cmp_luasnip",
      "petertriho/cmp-git",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      -- "lukas-reineke/cmp-rg",
      {
        "zbirenbaum/copilot.lua",
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end
      },

    },
    config = function()
      local cmp = require('cmp')
      local icons = require("settings._icons")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
            :sub(col, col)
            :match("%s")
            == nil
      end

      cmp.setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
              or require("cmp_dap").is_dap_buffer()
        end,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 75,
            preset = "codicons",
            symbol_map = icons.kind,
            before = function(entry, vim_item)
              vim_item.kind = lspkind.presets.default[vim_item.kind]
              vim_item.menu = icons.lsp[entry.source.name]
              return vim_item
            end,
          }),
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          -- invoke completion with only snippets
          ["<C-S-s>"] = cmp.mapping(cmp.mapping.complete({
            config = {
              sources = {
                {
                  name = 'luasnip' }
              }
            },
          }), { "i", "c" }),
          -- invoke completion with only copilot
          ["<C-S-c>"] = cmp.mapping(cmp.mapping.complete({
            config = {
              sources = {
                name = 'copilot'
              }
            }
          }), { "i", "c" }),
          ["<C-q>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          -- { name = 'nvim_lsp_signature_help' },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "copilot" },
          { name = "path",       max_item_count = 10 },
          { name = "treesitter", max_item_count = 10 },
          { name = "buffer",     max_item_count = 10 },
        }, {}),
        experimental = {
          ghost_text = true,
        },
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "nvim_lsp_document_symbol" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })

      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" }
        },
      })

      cmp.setup.filetype({ "gitcommit" }, {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        })
      })
    end,
  },
  {
    -- AI chatbot
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    enabled = true,
    lazy = true,
    cmd = "ChatGPT",
    config = true
  },
  {
    -- AI code completion
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    enabled = true,
    lazy = true,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        python = true,
        ["*"] = false,
      },
    }
  },
  {
    -- Lua-based snippet engine
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
      {
        lazy = true,
        "benfowler/telescope-luasnip.nvim",
        config = function()
          require("telescope").load_extension("luasnip")
        end
      },

    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    }
  },
  {
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    keys = {
      {
        "e",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        desc =
        "Extract Function"
      },
      {
        "f",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        desc =
        "Extract Function To File"
      },
      {
        "v",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        desc =
        "Extract Variable"
      },
      {
        "i",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Inline Variable')<CR>",
        desc =
        "Extract Inline Variable"
      },
    },
    config = function()
      require("refactoring").setup()
      require("telescope").load_extension("refactoring")
    end,
  },
}