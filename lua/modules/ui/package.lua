local conf = require("modules.ui.config")

packadd({ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = conf.theme })

packadd({
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "b0o/nvim-tree-preview.lua", "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },

	config = conf.nvim_tree,
})

packadd({
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = conf.bufferline,
})

packadd({
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = conf.telescope,
})

packadd({
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = conf.lualine,
})

packadd({
	"lewis6991/gitsigns.nvim",
	config = conf.gitsigns,
})
