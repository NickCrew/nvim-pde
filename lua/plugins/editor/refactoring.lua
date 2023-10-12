--[[
module: plugins.editor.core

--]]
return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    keys = {
      {
        "e",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        desc =
        "Extract Function"
      },
      {
        "f",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        desc =
        "Extract Function To File"
      },
      {
        "v",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        desc =
        "Extract Variable"
      },
      {
        "i",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Inline Variable')<CR>",
        desc =
        "Extract Inline Variable"
      },
    },
    config = function()
      require("refactoring").setup()
      require("telescope").load_extension("refactoring")
    end,
  },
}
