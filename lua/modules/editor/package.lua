local conf = require("modules.editor.config")
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

packadd({ "folke/which-key.nvim", config = conf.whichkey })

packadd({
	"nvim-treesitter/nvim-treesitter",
	event = { "BufRead", "BufNewFile" },
	build = ":TSUpdate",
	config = conf.nvim_treesitter,
})

packadd({
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = conf.ibl,
})

packadd({
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup()
	end,
})

packadd({ "akinsho/toggleterm.nvim", version = "*", config = conf.toggleterm })

packadd({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
})

packadd({
	"hiphish/rainbow-delimiters.nvim",
	config = function()
		require("rainbow-delimiters.setup").setup({})
	end,
})

-- packadd({
-- 	"Civitasv/cmake-tools.nvim",
-- 	config = function()
-- 		require("cmake-tools").setup()
-- 	end,
-- })

packadd({ "famiu/bufdelete.nvim" })
