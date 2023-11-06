local wk = require("which-key")
wk.register({
    --
    -- LSP
    --
    g = {
      name = "+lsp",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Type Definition" },
      k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show References" },
      w = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbol" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
      I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
      R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      W = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbol" },
    },

    ["<leader>"] = {

      g = {
        name = "+scm",
        B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame Line" },
        b = { "<cmd>Gitsigns blame_line<cr>", "Show Commit Message" },
        s = {
          name = "+stage",
          h = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
          b = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
          H = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
        },
        r = {
          name = "+reset",
          h = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
          b = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
        }
      },
      ["<leader>"] = {
        name = "+harpoon",
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Mark" },
        h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu" },
        ["["] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon Previous" },
        ["]"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon Next" },
        ["j"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1" },
        ["k"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2" },
        ["l"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3" },
        [";"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon 4" },
        ["s"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon 6" },
        ["d"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Harpoon 7" },
        ["f"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Harpoon 8" },
      },
    },
  },
  {
    mode = "n"
  })

wk.register({
    u = {
      name = "+user",
      f = {
        name = "+format",
        b = { "<cmd>FormatBuffer<cr>", "Format Buffer" }
      },
      r = {
        name = "+reload",
        l = { "<cmd>ReloadLuaFile<cr>", "Reload Lua File" },
        t = { "<cmd>lua require('utils').update_theme()<cr>", "Reload Theme" },
      },

    },
  },
  {
    mode = "n",
    prefix = "<leader>"
  })

  wk.register({
  ["<C-g>"] = {
      name = "+quick_toggle",
      g = { "<cmd>Telescope<cr>", "Open Telescope" },
      b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
      a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
      t = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
    },
  })
