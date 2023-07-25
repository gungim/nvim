local M = {}

function M.setup()
	local status_ok, barbecue = pcall(require, "barbecue")
	if not status_ok then
		return
	end
	local icons = require("gungim.icons")
	barbecue.setup({
		kinds = icons.kind,
		theme = 'tokyonight',
	})
end

return M
