local lspconfig = require("lspconfig")
return {
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = { "vim", "system", "display" },
			},
			runtime = { version = "LuaJIT" },
			workspace = {
				library = vim.list_extend({ [vim.fn.expand("$VIMRUNTIME/lua")] = true }, {}),
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
	root_dir = lspconfig.util.root_pattern(
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git"
	),
	filetypes = { "lua" },
}
