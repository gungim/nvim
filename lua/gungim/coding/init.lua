local M = {}
M.setup = function()
	require("gungim.coding.nvim-cmp").setup()
	require("gungim.coding.mini").setup()
	require("gungim.coding.luasnip")
	require("gungim.coding.prettier")
	require("gungim.coding.cmake")
end
return M
