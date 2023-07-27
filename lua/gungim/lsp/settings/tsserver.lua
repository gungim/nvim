local lspconfig = require 'lspconfig'

local opts = {
	root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json")
}

return opts
