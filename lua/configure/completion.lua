-- lua/configure/completion.lua
--

local kind_symbols = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        --Variable = "",
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
        TypeParameter = ""
}
local lspkind = require("lspkind")
local source_mapping = {
  buffer      = "  ◉ BUFF",
  nvim_lsp    = " 👐  LSP",
  nvim_lua    = " 🌙  LUA",
  cmp_tabnine = " 💡 TAB9",
  path        = " 🚧 PATH",
  luasnip     = " 🌜 SNIP"
}

local cmp = require("cmp")

cmp.setup({

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
			-- vim.fn["vsnip#anonymous"](args.body)
		end,
	},

	formatting = {
		format = lspkind.cmp_format({
			-- mode options: 'text', 'text_symbol', 'symbol_text', 'symbol',
			mode = "symbol_text",
			-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			maxwidth = 75,
			-- preset options:
			-- 'codicons' requires npm package @vscode/codicons
			-- 'default' requires nerd fonts
			preset = "default",
			symbol_map = kind_symbols,
			before = function(entry, vim_item)
				vim_item.kind = lspkind.presets.default[vim_item.kind]
				local menu = source_mapping[entry.source.name]
				if entry.source.name == "cmp_tabnine" then
					if
						entry.completion_item.data ~= nil
						and entry.completion_item.data.detail ~= nil
					then
						menu = entry.completion_item.data.detail .. " " .. menu
					end
					vim_item.kind = ""
				end
				vim_item.menu = menu
				return vim_item
			end,
		}),
	},

	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "cmp_tabnine" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		--{ name = 'tags' },
		--{ name = 'treesitter' },
		-- { name = "rg" },
	}),
	experimental = {
		ghost_text = true,
	},
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})
