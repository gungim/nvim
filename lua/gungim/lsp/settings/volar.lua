local tsdk = function()
	return vim.fn.getcwd() .. "/node_modules/typescript/lib"
end

return {
	filetypes = { "vue" },
	init_options = {
		vue = {
			hybridMode = false,
		},
		typescript = {
			tsdk = tsdk(),
		},
	},
}
