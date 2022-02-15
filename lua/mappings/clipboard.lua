local opts = { noremap = true, silent = true }

  Mapper.map(
      "n",
      "<leader>dx",
      '"_dd',
      opts,
      "Copy & Paste",
      "clip_yanktovoid",
      "Delete to Void Register"
  )

  Mapper.map(
      "v",
      "<leader>y",
      '"*y',
      opts,
      "Copy & Paste",
      "clip_yanktosys",
      "Yank to System Clipboard"
  )

  Mapper.map(
      "n",
      "<leader>P",
      "0p",
      opts,
      "Copy & Paste",
      "clip_paste0buf",
      "Paste from buffer 0"
  )

