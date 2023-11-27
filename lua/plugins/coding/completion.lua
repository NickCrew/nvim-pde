return {
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
      "lukas-reineke/cmp-rg",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",

    },
    config = function()
      local cmp = require('cmp')
      local icons = require("settings._icons")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")


      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
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
            elseif luasnip.expand_or_jumpable(-1) then
              luasnip.expand_or_jump(-1)
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
          { name = "copilot", group_index = 2},
          { name = "nvim_lsp",  group_index = 2, max_item_count = 20 },
          { name = "luasnip", group_index = 2 , max_item_Count = 20 },
          { name = "path",  group_index = 2, max_item_count = 10 },
          { name = "treesitter", max_item_count = 10 },
          { name = "buffer",     max_item_count = 10 },
        }, {}),
        experimental = {
          ghost_text = true,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        sorting = {
          priority_weight = 2,
        }
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

      -- DAP
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" }
        },
      })

      -- Git
      cmp.setup.filetype({ "gitcommit" }, {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        })
      })
    end,
  }
}
