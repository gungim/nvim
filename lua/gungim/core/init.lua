local M = {}

function M.setup()
	require("gungim.core.theme").setup()
	require("gungim.core.whichkey").setup()
	require("gungim.core.lualine").setup()
	require("gungim.core.bufferline").setup()
	require("gungim.core.smooth_cursor").setup()
	require("gungim.core.indentline").setup()
	require("gungim.core.alpha").setup()
	-- require("gungim.core.mini").setup()
	require("gungim.core.illuminate")
	require("gungim.core.mason").setup()
	require("gungim.core.aerial").setup()
	require "gungim.core.navic"
	require("gungim.core.noice").setup()
	require("gungim.core.nvim_tree")
	require("gungim.core.devicons")
	require("gungim.core.color_picker").setup()
	require("gungim.core.treesitter").setup()
	require("gungim.core.toggleterm").setup()
	require("gungim.core.hover").setup()
	require("gungim.core.autopairs").setup()
	require("gungim.core.telescope").setup()
	require("gungim.core.gitsigns").setup()
	require("gungim.core.colorizer").setup()
	require("gungim.core.cmake").setup()
end

return M
