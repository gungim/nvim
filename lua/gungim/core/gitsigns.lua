local M = {}
M.config = function()
	gg.builtin.gitsigns = {
		on_config_done = nil,
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = gg.icons.ui.BoldLineLeft,
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = gg.icons.ui.BoldLineLeft,
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = gg.icons.ui.BoldLineLeft,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = gg.icons.ui.BoldLineLeft,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = gg.icons.ui.BoldLineLeft,
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

	gitsigns.setup(gg.builtin.gitsigns)
	if gg.builtin.gitsigns.on_config_done then
		gg.builtin.gitsigns.on_config_done(gitsigns)
	end
end

return M
