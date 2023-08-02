local M = {}

function M:init()
	gungim = vim.deepcopy(require("gungim.config.defaults"))
	--[[ require("gungim.config.keymaps").load_defaults() ]]
	local builtins = require("gungim.builtins")
	builtins.config()

	local lsp_config = require("gungim.lsp.config")
	gungim.lsp = vim.deepcopy(lsp_config)
end

function M:load()
	vim.g.mapleader = ("space" and " ")

	require("gungim.config.keymaps").load_defaults()
	require("gungim.config.autocommands")
	require("gungim.config.options")
	require("gungim.lsp").setup()

end

return M
