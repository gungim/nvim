local conf = require("modules.tools.config")
packadd({
	"mhartington/formatter.nvim",
	config = conf.formatter,
})

packadd({
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
	},
	config = conf.cmp,
})
