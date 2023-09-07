local M = {}
local Log = require("gungim.log")
local utils = require("gungim.lsp.utils")

local function reslove_config(server_name, ...)
	local defaults = require("gungim.lsp").get_common_opts()

	local has_custom_setting, custom_config = pcall(require, "gungim/lsp/settings/" .. server_name)
	if has_custom_setting then
		Log:debug("Using custom configuration for requested server: " .. server_name)
		defaults = vim.tbl_deep_extend("force", defaults, custom_config)
	end

	defaults = vim.tbl_deep_extend("force", defaults, ...)

	return defaults
end

local function lauch_server(server_name, config)
	require("lspconfig")[server_name].setup(config)
end

M.setup = function()
	local server_names = gungim.lsp.automatic_configuration.skipped_servers or utils.get_supported_servers()

	for _, server in ipairs(server_names) do
		local config = reslove_config(server, {})

		lauch_server(server, config)
	end
end

return M
