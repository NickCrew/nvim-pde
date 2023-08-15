--
-- confi/cmompletion.lua
--

local vim = vim

local kind_symbols = {
  Text = "",
  Copilot = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}


local source_symbols = {
  buffer = " 👀 BUF",
  nvim_lsp = " 👐 LSP",
  nvim_lua = " 🌙 LUA ",
  path = " 📁 PATH",
  luasnip = " ✂️  SNIP",
  treesitter = " 🌲 TS",
  rg = " 🔍 RG",
  cmdline = " 📢 CMD",
  dap = " 🐛 DAP",
  cmp_git = " ✅ GIT",
  nvim_lsp_document_symbol = " 📃 DOC"
}


local lspkind = require("lspkind")
local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
      :sub(col, col)
      :match("%s")
      == nil
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
)


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
      symbol_map = kind_symbols,
      before = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        local menu = source_symbols[entry.source.name]
        vim_item.menu = menu
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
            name = 'luasnip'
          }
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
    { name = 'nvim_lsp_signature_help' },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path",                   max_item_count = 10 },
    { name = "treesitter",             max_item_count = 10 },
    { name = "buffer",                 max_item_count = 10 },
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

require("copilot_cmp").setup()
