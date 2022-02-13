local M = {}

M.features = {
      status = {
          indent_guides = true,
          buffer_bar = true,
          colorizer = true,
          status_bar = true,
          dashboard = true,
          git_integ = true,
          completion = true,
          autopairs = true,
          alt_debugger = false, -- vimspector
          debugger = true,
          snippets = true,
          lsp = true,
          treesitter = true,
          api_client = true,
          markdown_preview = true,
          enhanced_motion = true,
      },
}

return M
