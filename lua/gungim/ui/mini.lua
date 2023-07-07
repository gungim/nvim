local M = {}
M.starter = function()
	local status_ok, starter = pcall(require, "mini.starter")
	if not status_ok then
		return
	end
	local dashboard = require("gungim.alpha_das")

	starter.setup(
		{
			autoopen = true,
			evaluate_single = false,
			header = dashboard.hero,
			items = {
				{ name = "  Find file",           action = ":Telescope find_files <CR>",      section = "item" },
				{ name = "  New file",            action = ":ene <BAR> startinsert <CR>",     section = "item" },
				{ name = "  Find project",        action = ":Telescope projects <CR>",        section = "item" },
				{ name = "  Recently used files", action = ":Telescope oldfiles <CR>",        section = "item" },
				{ name = "  Find text",           action = ":Telescope live_grep <CR>",       section = "item" },
				{ name = "  Configuration",       action = ":e ~/.config/nvim/init.lua <CR>", section = "item" },
				{ name = "  Quit Neovim",         action = ":qa<CR>",                         section = "item" },
			},
			footer = "GUNGIM LOVE GUNGIM",

			content_hooks = nil,
			query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
			silent = false,
		}
	) -- No need to copy this inside `setup()`. Will be used automatically.
end

M.setup = function()
	M.starter()
end
return M
