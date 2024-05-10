local Log = require("gungim.log")

local M = {}

M.setup = function()
	local selected_theme = GG.theme

	if vim.startswith(GG.colorscheme, selected_theme) then
		local status_ok, plugin = pcall(require, selected_theme)
		if not status_ok then
			Log:error("Cannot find " .. selected_theme)
			return
		end

		pcall(function()
			local theme_config = require("gungim.core.theme." .. selected_theme)
			if not theme_config then
				Log:error("Cannot find " .. selected_theme .. " config")
				return
			end

			GG.colors = theme_config.colors
			plugin.setup(theme_config.config)
		end)
	end

	vim.g.colors_name = GG.colorscheme
	vim.cmd("colorscheme " .. GG.colorscheme)
end

return M
