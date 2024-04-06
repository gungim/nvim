local lspconfig = require("lspconfig")

local vue_language_server_path = "/Users/admin/.nvm/versions/node/v18.18.2/lib/node_modules/@vue/language-server"
local opts = {
	root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
	},
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
			},
		},
	},
}

return opts
