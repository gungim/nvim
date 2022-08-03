local status_ok, lspinstaller = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end
local lspconfig = require 'lspconfig'
local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities



lspinstaller.setup {}

local opts = {}
for _, server in ipairs(lspinstaller.get_installed_servers()) do
  opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if server == "jsonls" then
    local jsonls_opts = require "user.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end
  if server.name == 'sumneko_lua' then
    local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  if server.name == 'tsserver' then
    local tsserver_opts = require "user.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
  end
  if server.name == 'emmet_ls' then
    local emmet_opts = require "user.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend('force', emmet_opts, opts)
  end
  if server.name == 'tailwindcss' then
    local tailwindcss_opts = require "user.lsp.settings.tailwindcss"
    opts = vim.tbl_deep_extend('force', tailwindcss_opts, opts)
  end
  lspconfig[server.name].setup(opts)
end
