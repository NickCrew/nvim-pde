require('nvim-autopairs').setup({
  disable_in_macro = true,
  disable_in_visualblock = true,
  check_ts = true,
  disable_filetype = {"TelescopePrompt", "spectre_panel"},
  ts_config = {lua = {"string", "source"}, javascript = {"string","template_string"}}

})
