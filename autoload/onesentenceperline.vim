function! OneSentencePerLine()
 if mode() =~# '^[iR]'
  return
 endif
 let start = v:lnum
 let end = start + v:count - 1
 execute start.','.end.'join'
 s/[.!?]\zs\s*\ze\S/\r/g
endfunction
