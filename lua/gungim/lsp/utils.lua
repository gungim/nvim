local Log = require("gungim.log")
local M = {}

local tbl = require("gungim.utils.table")

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

function M.setup_document_highlight(client, bufnr)
	if gg.builtin.illuminate.active then
		Log:debug("skipping setup for document_highlight, illuminate already active")
		return
	end
	local status_ok, highlight_supported = pcall(function()
		return client.supports_method("textDocument/documentHighlight")
	end)
	if not status_ok or not highlight_supported then
		return
	end
	local group = "lsp_document_highlight"
	local hl_events = { "CursorHold", "CursorHoldI" }

	local ok, hl_autocmds = pcall(vim.api.nvim_get_autocmds, {
		group = group,
		buffer = bufnr,
		event = hl_events,
	})

	if ok and #hl_autocmds > 0 then
		return
	end

	vim.api.nvim_create_augroup(group, { clear = false })
	vim.api.nvim_create_autocmd(hl_events, {
		group = group,
		buffer = bufnr,
		callback = vim.lsp.buf.document_highlight,
	})
	vim.api.nvim_create_autocmd("CursorMoved", {
		group = group,
		buffer = bufnr,
		callback = vim.lsp.buf.clear_references,
	})
end

return M
