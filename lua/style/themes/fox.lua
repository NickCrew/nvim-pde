
local M = {}

function M.fox_setup(fox_style, is_transparent)
  if fox_style == nil then
    if os.getenv('ITERM_PROFILE') == nil then
      if os.getenv('KITTY_STYLE') == nil then
        fox_style = 'dark'
      else
        fox_style = os.getenv('KITTY_STYLE')
      end
    else
      fox_style = os.getenv('ITERM_PROFILE') 
    end
  end

  local fox_theme = ""
  if fox_style == 'Light' then
    fox_theme = 'dawnfox'
  else
    fox_theme = 'duskfox'
  end

  if is_transparent == nil then
    is_transparent = false
  elseif os.getenv("ITERM_PROFILE") == "Hotkey" then
    is_transparent = true
  end

  local nightfox = require("nightfox")
  nightfox.setup({
      fox = fox_theme, -- Which fox style should be applied
      transparent = is_transparent, -- Disable setting the background color
      alt_nc = false, -- Non current window bg to alt color see `hl-NormalNC`
      terminal_colors = true, -- Configure the colors used when opening :terminal
      styles = {
          comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
          functions = "italic,bold", -- Style that is applied to functions: see `highlight-args` for options
          keywords = "bold", -- Style that is applied to keywords: see `highlight-args` for options
          strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
          variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
      },
      inverse = {
          match_paren = false, -- Enable/Disable inverse highlighting for match parens
          visual = false, -- Enable/Disable inverse highlighting for visual selection
          search = false, -- Enable/Disable inverse highlights for search highlights
      },
      colors = {}, -- Override default colors
      hlgroups = {}, -- Override highlight groups
  })
  return nightfox

end

return M
