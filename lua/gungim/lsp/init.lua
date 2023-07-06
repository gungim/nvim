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

require("gungim.lsp.null-ls").setup()
--[[ require("gungim.lsp.lsp-signature") ]]
require("gungim.lsp.lsp-config").setup()
require("gungim.lsp.lsp-servers")
