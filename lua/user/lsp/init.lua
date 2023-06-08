require("nvim-lsp-installer").setup({
	automatic_installation = true,   -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})

require("user.lsp.null-ls")
require("user.lsp.lsp-signature")
require("user.lsp.lsp-config").setup()
require("user.lsp.lsp-servers")
