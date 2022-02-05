return {
  'hrsh7th/nvim-cmp',
  requires = {
    'onsails/lspkind-nvim',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua'
  },
  config = function()
  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
    ['<C-p>'] = require('cmp').mapping.select_prev_item(),
    ['<C-n>'] = require('cmp').mapping.select_next_item(),
    ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
    ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
    ['<C-Space'] = require('cmp').mapping.complete({'i','c'}),
    ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
      --}, {
        { name = 'buffer' },
        --{ name = 'tags' },
        --{ name = 'treesitter' },
        -- { name = "rg" },
        { name = "nvim_lua" }
      }),
      formatting = {
         format = require('lspkind').cmp_format({ with_text = true }),
      },
      experimental = {
        ghost_text = true,
      },
  })
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  vim.g.vsnip_snippet_dir = vim.fn.stdpath('config')..'/vsnip'

  end,
}
