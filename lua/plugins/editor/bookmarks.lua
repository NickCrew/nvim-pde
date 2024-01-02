return {
{
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    event = "BufReadPre",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
      vim.keymap.set("n", "<C-a>", function() harpoon:list():append() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", ";a", function() harpoon:list():select(1) end)
      vim.keymap.set("n", ";s", function() harpoon:list():select(2) end)
      vim.keymap.set("n", ";d", function() harpoon:list():select(3) end)
      vim.keymap.set("n", ";f", function() harpoon:list():select(4) end)
      vim.keymap.set("n", "<C-g>[", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-g>]", function() harpoon:list():next() end)

      require("telescope").load_extension("harpoon")

    end

  }
}
