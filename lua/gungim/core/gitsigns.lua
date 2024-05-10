local M = {}
local icons = require("gungim.icons")

M.config = function()
	GG.builtin.gitsigns = {
		on_config_done = nil,
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = icons.ui.BoldLineLeft,
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = icons.ui.BoldLineLeft,
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = icons.ui.BoldLineLeft,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = icons.ui.BoldLineLeft,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = icons.ui.BoldLineLeft,
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		update_debounce = 200,
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
