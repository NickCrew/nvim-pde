
return {
  {
    "garymjr/nvim-snippets",
    lazy  = true,
    event = "InsertEnter",
    opts = {
      friendly_snippets = true,
    },
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "yetone/avante.nvim",
    enabled = false,
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    -- Lua-based snippet engine
    "L3MON4D3/LuaSnip",
    lazy = true,
    enabled = false,
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
        help = false,
      }
    },
  },
  { 'AndreM222/copilot-lualine', },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = true
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = true,
    branch = "canary",
    build = "make tiktoken",
    lazy = true,
    cmd = "CopilotChat",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        model = "gpt-4o",
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
      {
        "<leader>ad",
        function()
          require("CopilotChat.actions").pick("help")
        end,
        desc = "Diagnostic Help (CopilotChat)",
        mode = { "n", "v" }
      },
      -- Show prompts actions with telescope
      {
        "<leader>ap",
        function()
          require("CopilotChat.actions").pick("prompt")
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" }
      },
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
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
        ft = { "gitcommit", "octo", "NeogitCommitMessage" },
        event = "InsertEnter",
        config = true
      },
      {
        "lukas-reineke/cmp-rg",
        lazy = true,
        event = "InsertEnter"
      },

    },
    config = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local icons = require("settings").icons()
      local cmp = require('cmp')
      local defaults = require("cmp.config.default")()
      -- local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end
      local auto_select = true

      cmp.setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
              or require("cmp_dap").is_dap_buffer()
        end,
        snippet = {
          -- expand = function(args)
          --   luasnip.lsp_expand(args.body)
          -- end,
        },
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 100,
            preset = "default",
            symbol_map = icons.kind,
            before = function(entry, vim_item)
              -- vim_item.kind = lspkind.presets.default[vim_item.kind]
              vim_item.menu = icons.cmp_sources[entry.source.name]
              return vim_item
            end,
          }),
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
              vim.schedule(function()
                vim.snippet.jump(1)
              end)
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.snippet.active({ direction = -1 }) then
              vim.schedule(function()
                vim.snippet.jump(1)
              end)
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
          { name = "nvim_lsp_signature_help", group_index = 1, priority = 1000 },
          { name = "copilot",                 group_index = 2, priority = 1000 },
          { name = "nvim_lsp",                group_index = 3, priority = 800, max_item_count = 20, },
          { name = "nvim_lsp_document_symbol",group_index = 3, priority = 700 },
          { name = "nvim_lua",                group_index = 3, priority = 800, max_item_count = 20 },
          -- { name = "luasnip",                 group_index = 1 },
          { name = "path",                    group_index = 1 },
          { name = "treesitter",              group_index = 4, priority = 400, max_item_count = 20 },
          { name = "emoji",                   group_index = 3 },
          { name = "buffer",                  group_index = 4, priorty = 400.,  max_item_count = 20 },
          { name = "rg",                      group_index = 4, priority = 300, max_item_count = 20 },
          -- {
          --   name = "spell",
          --   option = {
          --       keep_all_entries = false,
          --       enable_in_context = function()
          --           return true
          --       end,
          --       preselect_correct_word = true,
          --   },
          --   group_index = 3,
          --   max_item_count = 5,
          -- }

        }, {}),
        experimental = {
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
          sorting = defaults.sorting
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
  {
    "VonHeikemen/fine-cmdline.nvim",
    enabled = true,
    lazy = true,
    event = "CmdlineEnter"
  },
}
