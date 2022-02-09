
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
