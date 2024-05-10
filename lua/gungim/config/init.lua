local M = {}

function M:init()
	GG = vim.deepcopy(require("gungim.config.defaults"))

	require("gungim.config.keymaps").load_defaults()
	require("gungim.config.options")
	require("gungim.config.autocmds")
	require("gungim.config.theme").setup()

	local builtins = require("gungim.builtins")
	builtins.config()

	local lsp_config = require("gungim.lsp.config")
	GG.lsp = vim.deepcopy(lsp_config)
end

function M:load()
	vim.g.mapleader = (GG.leader and " ")

	require("gungim.builtins").setup()
	require("gungim.lsp").setup()
end

return M
