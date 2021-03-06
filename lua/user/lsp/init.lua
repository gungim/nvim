local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.lsp-colors"

lspconfig.emmet_ls.setup({
  filetypes = { 'html', '*.js', '*.jsx', '*.ts', '*.tsx', 'css', 'sass', 'scss', 'less' },
})
