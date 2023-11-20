local M = {}

M.config = function()
	local icons = require("gungim.icons")
	GG.builtin.navic = {
		on_config_done = nil,
		icons = icons.kind,
		highlight = true,
		separator = " " .. icons.ui.ChevronRight .. " ",
		depth_limit = 5,
		depth_limit_indicator = "..",
	}
end

M.setup = function()
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end

	navic.setup(GG.builtin.navic)
	if GG.builtin.navic.on_config_done then
		GG.builtin.navic.on_config_done(navic)
	end
end

return M
