local Log = require("gungim.log")
local M = {}
M.setup = function()
	Log:info("hello")
	require("gungim.coding.cmp").setup()
	require("gungim.coding.mini").setup()
	require("gungim.coding.colorizer").setup()
	require("gungim.coding.luasnip")
end
return M
