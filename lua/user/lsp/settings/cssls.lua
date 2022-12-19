local capabilities = require("user.lsp.lsp-config").capabilities
local lspconfig = require 'lspconfig'

return lspconfig.cssls.setup {
	capabilities = capabilities
}
