local M = {}

local function reslove_config(server_name, ...)
	local defaults = require("gungim.lsp").get_common_opts()

	local has_custom_setting, custom_config = pcall(require, "gungim/lsp/settings/" .. server_name)
	if has_custom_setting then
		defaults = vim.tbl_deep_extend("force", defaults, custom_config)
	end

	defaults = vim.tbl_deep_extend("force", defaults, ...)

	return defaults
end

local function lauch_server(server_name, config)
	require("lspconfig")[server_name].setup(config)
end

M.setup = function()
	local mason_servers = GG.lsp.automatic_configuration.mason_servers
	local other_servers = GG.lsp.automatic_configuration.other_servers

	--- Lauch config for mason server
	for _, server in ipairs(mason_servers) do
		local config = reslove_config(server, {})
		lauch_server(server, config)
	end

	--- Lauch config for other server
	for _, server in ipairs(other_servers) do
		local config = reslove_config(server, {})
		lauch_server(server, config)
	end
end

return M
