local M = {}
local icons = require("gungim.icons")
local Log = require("gungim.log")

M.config = function()
	gungim.builtin.barbecue = {
		active = true,
		setup = {
			kinds = icons.kind,
			theme = "tokyonight"
		}
	}
end

M.setup = function()
	local status_ok, barbecue = pcall(require, "barbecue")
	if not status_ok then
		Log:debug "Failed to load config Barbecue"
		return
	end
	barbecue.setup(gungim.builtin.barbecue.setup)
end

return M
