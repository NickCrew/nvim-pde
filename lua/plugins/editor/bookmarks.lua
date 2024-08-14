return {

{
"chentoast/marks.nvim",
enabled = false,
lazy = "VeryLazy",
config = function()
  require("marks").setup({
    default_mappings = true,
    builtin_marks = true,
    cyclic = true,
    force_write_shada = false,
  })
  end
},
{
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    enabled = true,
    lazy = true,
    branch = "harpoon2",
    event = "BufReadPre",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
      vim.keymap.set("n", "<leader><leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader><leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<A-a>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<A-s>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<A-d>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<A-f>", function() harpoon:list():select(4) end)
      vim.keymap.set("n", "<A-[>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<A-]>", function() harpoon:list():next() end)
      require("telescope").load_extension("harpoon")

    end

  }
}
