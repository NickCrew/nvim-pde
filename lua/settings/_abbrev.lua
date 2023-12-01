local mk_abbrev = function(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

mk_abbrev("W!",   "w!")
mk_abbrev("W1",   "w!")
mk_abbrev("w1",   "w!")
mk_abbrev("Q!",   "q!")
mk_abbrev("Q1",   "q!")
mk_abbrev("q1",   "q!")
mk_abbrev("Qa",   "! qa!")
mk_abbrev("Qall", "! qall!")
mk_abbrev("Wa",   " wa")
mk_abbrev("Wq",   " wq")
mk_abbrev("wQ",   " wq")
mk_abbrev("WQ",   " wq")
mk_abbrev("wq1",  " wq!")
mk_abbrev("Wq1",  " wq!")
mk_abbrev("wQ1",  " wq!")
mk_abbrev("WQ1",  " wq!")
mk_abbrev("W",    "w")
mk_abbrev("Q",    "q")
mk_abbrev("Qa",   "qa")
mk_abbrev("Qall", "qall")
