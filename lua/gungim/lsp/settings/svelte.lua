local lspconfig = require("lspconfig")

return {
	filetype = { "svelte" },
	root_dir = lspconfig.util.root_pattern("package.json", ".git"),
}
