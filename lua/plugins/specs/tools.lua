return {

  {
    -- RESTful API and HTTP Client
    "NTBBloodbath/rest.nvim",
    enabled = false,
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false, -- Open request results in a horizontal split
        skip_ssl_verification = true, -- Skip SSL verification, useful for unknown certificates
        highlight = {
          -- Highlight request on run
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        jump_to_request = false, -- Jump to request line on run
        env_file = ".envrc",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
  },


}
