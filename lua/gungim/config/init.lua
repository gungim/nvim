local M = {}

function M:init()
	gungim = vim.deepcopy(require("gungim.config.defaults"))
	--[[ require("gungim.config.keymaps").load_defaults() ]]
end

function M:load()
	vim.g.mapleader = ("space" and " ")
	require("gungim.config.theme").setup()
	require("gungim.config.keymaps").load_defaults()
	require("gungim.config.autocommands")
	require("gungim.config.options")
end

return M
