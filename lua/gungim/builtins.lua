local M = {}
local builtins = {
	"gungim.core.alpha",
	"gungim.core.whichkey",
	"gungim.core.aerial",
	"gungim.core.bufferline",
	"gungim.core.illuminate",
	"gungim.core.mason",
	"gungim.core.color_picker",
	"gungim.core.treesitter",
	"gungim.core.toggleterm",
	"gungim.core.hover",
	"gungim.core.autopairs",
	"gungim.core.telescope",
	"gungim.core.gitsigns",
	"gungim.core.colorizer",
	"gungim.core.indentline",
	"gungim.core.cmake",
	"gungim.core.lualine",
	"gungim.core.formatter",
	"gungim.core.nvim_tree",
	"gungim.core.smoothcursor",
	"gungim.core.noice",
	"gungim.core.navic",
	"gungim.core.prettier",
	"gungim.core.nvim-cmp",
	"gungim.core.mini",
	"gungim.core.gitblame",
}

M.config = function()
	for _, path in ipairs(builtins) do
		local builtin = require(path)
		builtin.config(builtin.config)
	end
end

M.setup = function()
	for _, path in ipairs(builtins) do
		local builtin = require(path)
		builtin.setup(builtin.setup)
	end
	require("gungim.core.devicons")
end

return M
