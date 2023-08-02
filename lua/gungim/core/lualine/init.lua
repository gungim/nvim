local M = {}

M.config = function()
	gungim.builtin.lualine = {
		active = true,
		setup = require("gungim.core.lualine.component")
	}
end

function M.setup()
	local active = gungim.builtin.lualine.active
	if not active then
		return
	end

	local status_ok, lualine = pcall(require, 'lualine')
	if not status_ok then
		local Log = require("gungim.log")
		Log:debug "Failed to load config lualine"
		return
	end
	-- Now don't forget to initialize lualine
	lualine.setup(gungim.builtin.lualine.setup)
end

return M
