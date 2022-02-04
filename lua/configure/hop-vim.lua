return {
  'phaazon/hop.nvim',
  config = function()
    require('hop').setup({
       case_insensitive = true,
       char2_fallback_key = '<CR>',
    })
  end
}
