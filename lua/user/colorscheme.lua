require("tokyonight").setup({
  transparent = true,

  styles = {
  sidebars = "transparent",
  floats = "dark",
  }
})

local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- Colorpen()
