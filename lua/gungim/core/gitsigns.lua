local M = {}
local icons = require("gungim.icons")

M.config = function()
	GG.builtin.gitsigns = {
		on_config_done = nil,
		signs = {
			add = {
				text = icons.ui.BoldLineLeft,
			},
			change = {
				text = icons.ui.BoldLineLeft,
			},
			delete = {
				text = icons.ui.BoldLineLeft,
			},
			topdelete = {
				text = icons.ui.BoldLineLeft,
			},
			changedelete = {
				text = icons.ui.BoldLineLeft,
			},
		},
		update_debounce = 200,
		current_line_blame = true,
	}
end

M.setup = function()
	local status_ok, gitsigns = pcall(require, "gitsigns")
	if not status_ok then
		return
	end

	gitsigns.setup(GG.builtin.gitsigns)
	if GG.builtin.gitsigns.on_config_done then
		GG.builtin.gitsigns.on_config_done(gitsigns)
	end
end

return M
