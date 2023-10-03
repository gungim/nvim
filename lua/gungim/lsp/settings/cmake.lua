local lspconfig = require("lspconfig")

return {
	root_dir = lspconfig.util.root_patter("CMakeLists.txt"),
	filetypes = { "cmake" },
}
