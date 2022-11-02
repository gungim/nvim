return {
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = { 'vim', 'system', 'display' },
			},
			runtime = { version = 'LuaJIT' },
			workspace = {
				library = vim.list_extend({ [vim.fn.expand('$VIMRUNTIME/lua')] = true }, {}),
			},
			completion = {
				callSnippet = "Replace"
			}
		},
	},
}
