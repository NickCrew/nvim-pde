local icons = {
    stopped     = "",
    normal      = "",
    conditional = "",
    rejected    = "ﰸ",
    log         = "",
}

for type, icon in pairs({
  -- DAP
  DapBreakpoint             = icons.normal,
  DapBreakpointCondition    = icons.conditional,
  DapBreakpointRejected     = icons.rejected,
  DapLogPoint               = icons.log,
  DapStopped                = icons.stopped,
}) do
  vim.fn.sign_define(type, {
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end

