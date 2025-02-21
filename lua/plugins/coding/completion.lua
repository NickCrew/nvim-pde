return {
  {
    -- Completion and Snippets
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      {
        "f3fora/cmp-spell",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        enabled = false,
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-buffer",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-cmdline",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lua",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-emoji",
        enabled = false,
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-path",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "onsails/lspkind-nvim",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "ray-x/cmp-treesitter",
        enabled = false,
        lazy = true,
        event = "InsertEnter"
      },
      {
        "rcarriga/cmp-dap",
        lazy = true,
        ft = { "dap-repl", "dapui_watches", "dapui_hover" },
        event = "InsertEnter"
      },
      {
        "saadparwaiz1/cmp_luasnip",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "petertriho/cmp-git",
        lazy = true,
        ft = { "gitcommit", "octo", "NeogitCommitMessage" },
        event = "InsertEnter",
        config = true
      },
      {
        "lukas-reineke/cmp-rg",
        enabled = false,
        lazy = true,
        event = "InsertEnter"
      },

    },
    config = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

      local cmp = require('cmp')
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      local icons = vim.g.ICONS
      local auto_select = true

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
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 100,
            preset = "default",
            symbol_map = icons.kind,
            before = function(entry, vim_item)
              vim_item.menu = icons.completion.plain[entry.source.name]
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
          ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-q>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          -- { name = "copilot" },
          { name = "codeium" },
          { name = "path" },
          { name = "luasnip" },
          { name = "buffer",  keyword_length = 5, max_item_count = 20 },
        }, {}),
        experimental = {
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
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

      -- DAP
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" }
        },
      })

      -- Git
      cmp.setup.filetype({ "gitcommit", "octo", "NeogitCommitMessage" }, {
        sources = cmp.config.sources({
          { name = "git" },
          { name = "buffer" },
        })
      })
    end,
  },
}
