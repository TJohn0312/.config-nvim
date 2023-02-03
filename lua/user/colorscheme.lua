require("tokyonight").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "dark",
  }
})
require("gruvbox").setup({
  transparent_mode = false,
  contrast = "hard", -- can be "hard", "soft" or empty string
})
require("darkplus").setup({})
require("poimandres").setup({
  disable_background = false,
  disable_float_background = false,
  color_scheme = "poimandres", --or "poimandres Storm/Light"
})

local colorscheme = "tokyonight-night"
-- local colorscheme = "gruvbox"
-- local colorscheme = "darkplus"
-- local colorscheme = "melange" --can't config
-- local colorscheme = "poimandres" --need to change blue2 value

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
