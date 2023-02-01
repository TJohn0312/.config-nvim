local servers = {
  "grammarly", --Dictonary
  "diagnosticls", --general purpose

  "quick_lint_js", --javascript
  "tsserver", --javascript / typescript
  "emmet_ls", --Emmit
  "jsonls", --JSON
  "sumneko_lua", --lua
  "dockerls", --Docker

  "arduino_language_server",
  "bashls",
  -- "csharp_ls", --dotnet err
  "omnisharp",
  "omnisharp_mono",
  "cssls",
  "cssmodules_ls",
  "eslint",--js
  "html",
  "jsonls",
  -- "vtsls",--js, need to update nvim-lspconfig, but can't(lspinfo err)
  "tailwindcss",
  "vimls",

  -- "jedi_language_server",--python
  -- "pyre",--python
  -- "pyright",--python
  -- "sourcery",--python
  -- "pylsp",--python
  -- "ruff_lsp",--python
}
-- List of servers @ https://github.com/williamboman/mason-ispconfig.nvim

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
