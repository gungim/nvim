local M = {}

function M:init()
	gungim = vim.deepcopy(require("gungim.config.defaults"))

	require("gungim.config.keymaps").load_defaults()

	local builtins = require("gungim.builtins")
	builtins.config()

	local lsp_config = require("gungim.lsp.config")
	gungim.lsp = vim.deepcopy(lsp_config)

	-- local autocmds = require "gungim.core.autocmds"
	-- autocmds.load_defaults()

	require("gungim.core").setup()
end

function M:load()
	vim.g.mapleader = ("space" and " ")

	local autocmds = require("gungim.core.autocmds")
	autocmds.define_autocmds(gungim.autocommands)

	require("gungim.config.options")
	require("gungim.lsp").setup()
end

return M
