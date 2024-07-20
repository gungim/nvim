local M = {}

local function lauch_server(server_name, config)
	require("lspconfig")[server_name].setup(config)
end

M.setup = function()

	local mason_servers = GG.lsp.automatic_configuration.mason_servers
	local other_servers = GG.lsp.automatic_configuration.other_servers
	local lsp_config = require("gungim.lsp.lsp-servers")
	local server_default_config = require("gungim.lsp.server-config")

	--- Lauch config for mason server
	for _, server in ipairs(mason_servers) do
		local opts = {
			on_attach = lsp_config.on_attach,
			capabilities = lsp_config.common_capabilities(),
		}
		local server_config = server_default_config[server] or {}
		vim.tbl_deep_extend("force", opts, server_config)
		lauch_server(server, opts)
	end

	--- Lauch config for other server
	-- for _, server in ipairs(other_servers) do
	-- local config = reslove_config(server, {})
	-- lauch_server(server, config)
	-- end
end

return M
