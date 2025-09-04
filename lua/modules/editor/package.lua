local conf = require("modules.editor.config")

packadd({ "folke/which-key.nvim", config = conf.whichkey })

packadd({
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	config = conf.nvim_treesitter,
})

packadd({
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = conf.ibl,
})

packadd({
	"echasnovski/mini.pairs",
	config = function()
		require("mini.pairs").setup({})
	end,
})

packadd({

	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup()
	end,
})

packadd({ "akinsho/toggleterm.nvim", config = conf.toggleterm })

packadd({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
})

packadd({
	"HiPhish/rainbow-delimiters.nvim",
	config = conf.ibl,
})

-- packadd({
-- 	"Civitasv/cmake-tools.nvim",
-- 	config = function()
-- 		require("cmake-tools").setup()
-- 	end,
-- })

packadd({
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "b0o/nvim-tree-preview.lua", "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },

	config = conf.nvim_tree,
})
