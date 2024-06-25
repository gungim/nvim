local lspconfig = require("lspconfig")

return {
	root_dir = lspconfig.util.root_pattern(
		"tailwind.config.cjs",
		"tailwind.config.js",
		"tailwind.config.ts"
	),
}
