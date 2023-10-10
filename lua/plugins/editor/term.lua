return {
{
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    lazy = true,
    branch = "main",
    config = function()
      require("toggleterm").setup({

        on_config_done = nil,
        -- size can be a number or function which is passed the current terminal
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 3,     -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = "float",
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell,  -- change the default shell
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
          -- The border key is *almost* the same as 'nvim_win_open'
          -- see :h nvim_win_open for details on borders however
          -- the 'curved' border is a custom border type
          -- not natively supported but implemented in this plugin.
          -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
          border = "curved",
          width = 120,
          height = 30,
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
      function _G.set_terminal_keymaps()
        vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true, silent = true })
      end

      vim.api.nvim_create_augroup("floatterm", {})
      vim.api.nvim_create_autocmd("termopen", {
        group = "floatterm",
        pattern = "term://*",
        command = "lua _G.set_terminal_keymaps()",
      })
    end
  },
}
