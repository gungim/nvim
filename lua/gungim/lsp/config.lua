return {
	automatic_configuration = {
		---@usage list of servers that the automatic installer will skip
		mason_servers = {

			"tsserver",
			"tailwindcss",
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
			"angularls",
			"cmake",
			"prismals",
			"jdtls",
		},
		---@usage list of servers if mason does not support
		other_servers = { "gdscript" },
	},
	buffer_options = {
		--- enable completion triggered by <c-x><c-o>
		omnifunc = "v:lua.vim.lsp.omnifunc",
		--- use gq for formatting
		formatexpr = "v:lua.vim.lsp.formatexpr(#{timeout_ms:500})",
	},
}
-- skipped_servers
