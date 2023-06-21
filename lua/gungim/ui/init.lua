local M = {}

function M.setup()
	require("gungim.ui.lualine").setup()
	require("gungim.ui.bufferline").setup()
	require("gungim.ui.barbecue").setup()
	require("gungim.ui.smooth_cursor").setup()
end

return M
