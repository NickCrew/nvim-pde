-- lua/configure/bufferline.lua
--

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    buffer_close_icon = "",
    modified_icon = "",
    indicator_icon = "▎",
    left_mouse_command = "buffer %d",
    close_icon = "",
    show_close_icon = true,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "bar",
    always_show_bufferline = true,
    diagnostics = false,
  },
})
