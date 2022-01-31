-- lua/configure/sniprun.lua
--

return {
 'michaelb/sniprun', 
  run = 'bash ./install.sh',
  config = function ()
    require('sniprun').setup({
      selected_interpreters = { 'Python' },
      repl_enable = { 'Python' }
    })
  end

}
