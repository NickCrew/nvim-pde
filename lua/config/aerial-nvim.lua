require("aerial").setup({
  backends = { "lsp", "treesitter", "markdown" },
  close_behavior = "auto",
  default_direction = "prefer_right",
  min_width = 30,
  max_width = 50,
  post_jump_cmd = "normal! zz",
  lsp = {
    diagnostics_trigger_update = true,
    update_when_errors = true,
  },
  treesitter = {
    update_delay = 300,
  },
  markdown = {
    update_delay = 300,
  },
})
require("telescope").load_extension("aerial")
