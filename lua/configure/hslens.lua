return {
  'kevinhwang91/nvim-hlslens',
  branch = 'main',
  keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
  config = function ()
    require('hlslens').setup({
        calm_down = true,
        nearest_only = true,
    })
    require('keymap').apply_hslens_keymaps()
  end
}
