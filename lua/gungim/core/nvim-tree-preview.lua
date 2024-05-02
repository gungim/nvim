local M = {}
M.config = function()
	GG.builtin.nvim_tree_preview = {
		on_config_done = nil,
	}
end
M.setup = function()
	local status_ok, preview = pcall(require, "nvim-tree-preview")
	if not status_ok then
		return
	end

	preview.setup(GG.builtin.nvim_tree_preview)

	if GG.builtin.nvim_tree_preview.on_config_done then
		GG.builtin.nvim_tree_preview.on_config_done(preview)
	end
end
return M
