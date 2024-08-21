return {
{
    -- Lua-based snippet engine
    "L3MON4D3/LuaSnip",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    }
  },
{
    -- AI code completion
    "zbirenbaum/copilot.lua",
    enabled = true,
    lazy = true,
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
        hcl = true,
        terraform = true
      }
    },
  },
  { 'AndreM222/copilot-lualine' ,
 },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = true
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    lazy = true,
    cmd = "CopilotChat",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        model = "gpt-4",
        auto_insert_mode = true,
        show_help = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },
        selection = function(source)
          local select = require("CopilotChat.select")
          return select.visual(source) or select.buffer(source)
        end,
      }
    end,
    keys = {
      { "<c-s>",     "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "",     desc = "+ai",        mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
      -- Show help actions with telescope
      -- { "<leader>ad", M.pick("help"),   desc = "Diagnostic Help (CopilotChat)", mode = { "n", "v" } },
      -- Show prompts actions with telescope
      -- { "<leader>ap", M.pick("prompt"), desc = "Prompt Actions (CopilotChat)",  mode = { "n", "v" } },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      require("CopilotChat.integrations.cmp").setup()

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    enabled = true,
    lazy = true,
    event = "InsertEnter",
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-;>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = { cpp = true },
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      log_level = "info",           -- set to "off" to disable logging completely
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false       -- disables built in keymaps for more manual control
    },
  },

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
        lazy = true,
        event = "InsertEnter"
      },
      {
        "rcarriga/cmp-dap",
        lazy = true,
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
        event = "InsertEnter"
      },
      {
        "lukas-reineke/cmp-rg",
        lazy = true,
        event = "InsertEnter"
      },

    },
    config = function()
      local icons = require("settings.icons")
      local cmp = require('cmp')
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

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
            maxwidth = 100,
            preset = "default",
            symbol_map = icons.kind,
            before = function(entry, vim_item)
              -- vim_item.kind = lspkind.presets.default[vim_item.kind]
              vim_item.menu = icons.alt.source[entry.source.name]
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
          { name = "nvim_lsp_signature_help", group_index = 1 },
          { name = "copilot",    group_index = 1 },
          { name = "nvim_lsp",   group_index = 1 },
          { name = "nvim_lua",   group_index = 2 },
          { name = "luasnip",    group_index = 2 },
          { name = "path",       group_index = 1 },
          { name = "treesitter", group_index = 3 },
          { name = "emoji",      group_index = 3 },
          { name = "buffer",     group_index = 3 },
          { name = "rg",         group_index = 3 }

        }, {}),
        experimental = {
          ghost_text = true,
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
    "VonHeikemen/fine-cmdline.nvim",
    enabled = true,
    lazy = true,
    event = "CmdlineEnter"
  },
}
