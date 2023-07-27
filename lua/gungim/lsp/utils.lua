local M = {}
---Get supported servers per filetype
---@param filter { filetype: string | string[] }?: (optional) Used to filter the list of server names.
---@return string[] list of names of supported servers
function M.get_supported_servers(filter)
	require("mason-registry").refresh()
	local _, supported_servers = pcall(function()
		return require("mason-lspconfig").get_available_servers(filter)
	end)
	return supported_servers or {}
end

return M
