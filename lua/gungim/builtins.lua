local M = {}
local builtins = {
	"gungim.core.noice",
	"gungim.core.mason",
	"gungim.core.alpha",
	"gungim.core.aerial",

	"gungim.core.devicons",
	"gungim.core.nvim-tree-preview",
	"gungim.core.nvim-tree",
	"gungim.core.bufferline",
	-- "gungim.core.cokeline",

	"gungim.core.illuminate",
	"gungim.core.color-picker",
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
	"gungim.core.vue-goto-definition",

	"gungim.core.luasnip",
	"gungim.core.formatter",
	"gungim.core.smoothcursor",
	"gungim.core.navic",
	"gungim.core.nvim-cmp",

	"gungim.core.autotag",
	"gungim.core.context-commentstring",
	"gungim.core.mini",

	"gungim.core.gitblame",
	"gungim.core.lsp-signature",
	"gungim.core.barbecue",
	"gungim.core.diagnostic",
	"gungim.core.whichkey",
	"gungim.core.todo",
	-- "gungim.core.ufo"
	--
	"gungim.core.neoai",
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
end

return M
