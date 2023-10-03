local M = {}

function M:init()
	gg= vim.deepcopy(require("gungim.config.defaults"))

	require("gungim.config.keymaps").load_defaults()
	require("gungim.config.theme").setup()

	local builtins = require("gungim.builtins")
	builtins.config()

	local lsp_config = require("gungim.lsp.config")
	gg.lsp = vim.deepcopy(lsp_config)

	-- local autocmds = require "gungim.core.autocmds"
	-- autocmds.load_defaults()

	require("gungim.core").setup()
	require("gungim.core.gitblame")
end

function M:load()
	vim.g.mapleader = ("space" and " ")

	local autocmds = require("gungim.core.autocmds")
	autocmds.define_autocmds(gg.autocommands)

	require("gungim.config.options")
	require("gungim.lsp").setup()
end

return M
