require("neoclip").setup({
  history = 1000,
  enable_persistent_history = true,
  continuous_sync = false,
})
require("telescope").load_extension("neoclip")
