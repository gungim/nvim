local lspconfig = require 'lspconfig'

return {
	--[[ root_dir = function(fname) ]]
	--[[ 	return lspconfig.util.root_pattern "package.json" (fname) or lspconfig.util.root_pattern "vue.config.js" (fname) or ]]
	--[[ 			vim.fn.getcwd() ]]
	--[[ end, ]]
}
