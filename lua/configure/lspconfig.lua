return {
  'neovim/nvim-lspconfig',
  requires = {
    'jubnzv/virtual-types.nvim',
    'ray-x/lsp_signature.nvim',
    'williamboman/nvim-lsp-installer',
    'simrat39/rust-tools.nvim',
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    'folke/lsp-colors.nvim',
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  },
  config = function()
    require('lsp')
  end
}
