local M = {}

local tbl = require "gungim.utils.table"

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

function M.is_client_active(name)
  local clients = vim.lsp.get_active_clients()
  return tbl.find_first(clients, function(client)
    return client.name == name
  end)
end

return M
