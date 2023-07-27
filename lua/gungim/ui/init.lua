local M = {}

function M.setup()
	require("gungim.ui.lualine").setup()
	require("gungim.ui.bufferline").setup()
	require("gungim.ui.barbecue").setup()
	require("gungim.ui.smooth_cursor").setup()
	require("gungim.ui.indentline").setup()
	require("gungim.ui.whichkey")
	require("gungim.ui.alpha").setup()
	-- require("gungim.ui.mini").setup()
	require("gungim.ui.illuminate")
	require("gungim.ui.mason").setup()
	require("gungim.ui.aerial").setup()
	require "gungim.ui.navic"
	require("gungim.ui.noice").setup()
	require("gungim.ui.nvim_tree")
end

return M
