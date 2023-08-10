return {
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      -- require("telescope").load_extension("yaml_schema")
    end,
  },
  {
    "mfussenegger/nvim-ansible",
    ft = {"yaml", "yaml.ansible"},
    lazy = true
  },


}
