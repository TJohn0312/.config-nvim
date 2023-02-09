local StartingTransparent = false
local StartingColorscheme = "melange"
-- "tokyonight" "tokyonight-night" "darkplus" "melange" "gruvbox" "poimandres" "habamax"


--colorschemes
require("tokyonight").setup({
  -- transparent = true,
  styles = { sidebars = "transparent", floats = "dark", }
})
require("gruvbox").setup({
  contrast = "", -- can be "hard", "soft" or empty string
  -- transparent_mode = false,
})
require("darkplus").setup({})
require("poimandres").setup({
  -- color_scheme = "poimandres", --or "poimandres Storm/Light"
  -- disable_background = false,
  -- disable_float_background = false,
})


local colorscheme = StartingColorscheme
local color_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not color_status_ok then
  return
end

local transparent_status_ok, transparent = pcall(require, "transparent")
if not transparent_status_ok then
  return
end

transparent.setup({
  enable = StartingTransparent, -- startup value
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    "NvimTreeNormal",
    -- 'NvimTreeStatuslineNc',

    --BufferLine
    "BufferLineFill",--background
    -- "BufferLineTabClose",--X on right (I think)
    -- "BufferLineSeparator", --gap between tabs
    -- "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
