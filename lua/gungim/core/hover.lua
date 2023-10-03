local M = {}
M.config = function()
	gg.builtin.hover = {
		init = function()
			require("hover.providers.lsp")
			require("hover.providers.gh")
			require("hover.providers.man")
			require("hover.providers.dictionary")
		end,
		preview_opts = {
			border = nil,
		},
		title = true,
	}
end
M.setup = function()
	local status_ok, hover = pcall(require, "hover")
	if not status_ok then
		return
	end

	hover.setup(gg.builtin.hover)
end

return M
