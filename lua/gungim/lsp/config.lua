local skipped_servers = {
	"pyright",
	"tsserver",
	-- "tailwindcss",
	"lua_ls",
	"clangd",
	"diagnosticls",
	"eslint",
	"html",
	"jsonls",
	"lemminx",
	"cssls",
	"svelte",
	"rust_analyzer",
	"bashls",
	"volar",
	"cmake",
	"angularls",
}

local skipped_filetypes = { "markdown", "rst", "plaintext", "toml", "proto" }

return {
	on_attach_callback = nil,
	document_highlight = false,
	automatic_configuration = {
		---@usage list of servers that the automatic installer will skip
		skipped_servers = skipped_servers,
		---@usage list of filetypes that the automatic installer will skip
		skipped_filetypes = skipped_filetypes,
	},
	buffer_options = {
		--- enable completion triggered by <c-x><c-o>
		omnifunc = "v:lua.vim.lsp.omnifunc",
		--- use gq for formatting
		formatexpr = "v:lua.vim.lsp.formatexpr(#{timeout_ms:500})",
	},

	installer = {
		setup = {
			ensure_installed = {},
			automatic_installation = {
				exclude = {},
			},
		},
	},
}
