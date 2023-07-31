local M = {}
local Log = require("gungim.log")
local fmt = string.format
local utils = require("gungim.lsp.utils")


local function buf_try_add(server_name, bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	require("lspconfig")[server_name].manager.try_add_wrapper(bufnr)
end

local function reslove_config(server_name, ...)
	local defaults = {
		on_attack = require("gungim.lsp").common_on_attach,
		on_init = require("gungim.lsp").common_on_init,
		on_exit = require("gungim.lsp").common_on_exit,
		capabilities = require("gungim.lsp").common_capabilities(),
	}

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
	buf_try_add(server_name)
end

local function reslove_mason_config(server_name)
	local found, mason_config = pcall(require, ("mason-lspconfig.server_configurations.%s"):format(server_name))
	if not found then
		Log:debug("mason-lspconfig not found for: " .. server_name)
		return {}
	end
	local server_mapping = require "mason-lspconfig.mappings.server"
	local path = require "mason-core.path"
	local pkg_name = server_mapping.lspconfig_to_package[server_name]
	local install_dir = path.package_prefix(pkg_name)
	local conf = mason_config(install_dir)
	Log:debug(fmt("resolved mason configuration for %s, got %s", server_name, vim.inspect(conf)))
	return conf or {}
end

M.setup = function()
	local server_names = gungim.lsp.automatic_configuration.skipped_servers or utils.get_supported_servers()

	for _, server in ipairs(server_names) do
		-- local config = reslove_config(server, reslove_mason_config(server))
		local config = reslove_config(server, {})

		lauch_server(server, config)
	end
end

return M
