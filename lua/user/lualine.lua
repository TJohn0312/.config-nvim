local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local colors = {
  innerbg = nil,
  outerbg = "#16161D", -- darkgrey
  darkgrey = "#16161d",
  grey = "#727169",

  normal = "#1cafc9", -- teal
  insert = "#DE07A7", -- pink
  visual = "#16C60C", -- green
  replace = "#fe0065",-- red
  command = "#f7c900",-- yellow
}

local mode = {
  "mode"
}

local branch = {
  "branch",
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filename = {
  "filename"
}

local encoding = {
  "encoding"
}

local fileformat = {
  "fileformat"
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  "location",
  -- padding = { left = 0, right = 0.5 },
  padding = { left = 0, right =1 },
  colored = false,
}

local progress = {
  "progress",
  colored = false,
  padding = { left = 0, right = 1 }
}

local filesize = {
  "filesize",
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
  options = {
    globalstatus = false,
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
    theme = {
      inactive = {
        a = { fg = colors.grey, bg = colors.innerbg, gui = "bold" },
        b = { fg = colors.grey, bg = colors.innerbg },
        c = { fg = colors.grey, bg = colors.innerbg },
        x = { fg = colors.grey, bg = colors.innerbg },
        y = { fg = colors.grey, bg = colors.innerbg },
        z = { fg = colors.grey, bg = colors.innerbg },
      },
      visual = {
        a = { fg = colors.darkgrey, bg = colors.visual,},
        b = { fg = colors.grey, bg = colors.innerbg },
        c = { fg = colors.grey, bg = colors.innerbg },
        x = { fg = colors.grey, bg = colors.innerbg },
        y = { fg = colors.grey, bg = colors.innerbg },
        z = { fg = colors.darkgrey, bg = colors.visual },
      },
      replace = {
        a = { fg = colors.darkgrey, bg = colors.replace,},
        b = { fg = colors.grey, bg = colors.innerbg },
        c = { fg = colors.grey, bg = colors.innerbg },
        x = { fg = colors.grey, bg = colors.innerbg },
        y = { fg = colors.grey, bg = colors.innerbg },
        z = { fg = colors.darkgrey, bg = colors.replace },
      },
      normal = {
        a = { fg = colors.darkgrey, bg = colors.normal,},
        b = { fg = colors.grey, bg = colors.innerbg },
        c = { fg = colors.grey, bg = colors.innerbg },
        x = { fg = colors.grey, bg = colors.innerbg },
        y = { fg = colors.grey, bg = colors.innerbg },
        z = { fg = colors.darkgrey, bg = colors.normal },
      },
      insert = {
        a = { fg = colors.darkgrey, bg = colors.insert,},
        b = { fg = colors.grey, bg = colors.innerbg },
        c = { fg = colors.grey, bg = colors.innerbg },
        x = { fg = colors.grey, bg = colors.innerbg },
        y = { fg = colors.grey, bg = colors.innerbg },
        z = { fg = colors.darkgrey, bg = colors.insert },
      },
      command = {
        a = { fg = colors.darkgrey, bg = colors.command,},
        b = { fg = colors.grey, bg = colors.innerbg },
        c = { fg = colors.grey, bg = colors.innerbg },
        x = { fg = colors.grey, bg = colors.innerbg },
        y = { fg = colors.grey, bg = colors.innerbg },
        z = { fg = colors.darkgrey, bg = colors.command },
      },
    },
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diff },
    lualine_c = {},
    lualine_x = { diagnostics },
    lualine_y = { filesize, filetype, filename },
    lualine_z = { location, progress },
  },
  inactive_sections = {
    lualine_a = { diagnostics },
    lualine_b = { filetype },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { filename },
    lualine_z = { location, progress },
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
