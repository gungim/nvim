local lspconfig = require("lspconfig")

return {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
		"vue",
	},
}
