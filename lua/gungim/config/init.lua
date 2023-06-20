local M = {}

function M:init()
	gungim = vim.deepcopy(require("gungim.config.defaults"))
	--[[ require("gungim.config.keymaps").load_defaults() ]]
end

function M:load()
	vim.g.mapleader = ("space" and " ")
	require("gungim.config.keymaps").load_defaults()
end

return M
