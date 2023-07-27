local M = {}
local builtins = {
	"gungim.ui.alpha",
	"gungim.ui.barbecue",
	"gungim.ui.lualine",
	"gungim.ui.aerial",
	"gungim.ui.bufferline",
	"gungim.ui.illuminate",
	"gungim.ui.mason"
}

M.config = function()
	for _, path in ipairs(builtins) do
		local builtin = require(path)
		builtin.config(builtin.config)
	end
end

return M
