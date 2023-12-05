
local abbrevs = {
  { "W!",   "w!" },
  { "W1",   "w!" },
  { "w1",   "w!" },
  { "Q!",   "q!" },
  { "Q1",   "q!" },
  { "q1",   "q!" },
  { "Qa",   "! qa!" },
  { "Qall", "! qall!" },
  { "Wa",   " wa" },
  { "Wq",   " wq" },
  { "wQ",   " wq" },
  { "WQ",   " wq" },
  { "wq1",  " wq!" },
  { "Wq1",  " wq!" },
  { "wQ1",  " wq!" },
  { "WQ1",  " wq!" },
  { "W",    "w" },
  { "Q",    "q" },
  { "Qa",   "qa" },
  { "Qall", "qall" },
}

for abr, cmd in pairs(abbrevs) do
  require("settings._util").npde_mk_abbrev(abr, cmd)
end
