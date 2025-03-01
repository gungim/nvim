local conf = require("modules.ui.config")

packadd({
	"nvim-tree/nvim-web-devicons",
	config = function()
		local config = require("modules.ui.devicon")
		require("nvim-web-devicons").setup(config)
	end,
})

packadd({ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = conf.theme })


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

packadd({
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = conf.noice,
})
