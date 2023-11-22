local M = {}

M.config = function()
	GG.builtin.lualine = require("gungim.core.lualine.component")
end

function M.setup()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		local Log = require("gungim.log")
		Log:debug("Failed to load config lualine")
		return
	end
	-- Now don't forget to initialize lualine
	lualine.setup(GG.builtin.lualine)
end

return M
