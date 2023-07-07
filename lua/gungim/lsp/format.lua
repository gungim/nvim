local Log = require("gungim.log")
local M = {}

---@type PluginLspOpts
M.opts = nil

function M.enabled()
	return M.opts.autoformat
end

function M.toggle()
	if vim.b.autoformat == false then
		vim.b.autoformat = nil
		M.opts.autoformat = true
	else
		M.opts.autoformat = not M.opts.autoformat
	end
	if M.opts.autoformat then
		Log:info("Enabled format on save", { title = "Format" })
	else
		Log:warn("Disabled format on save", { title = "Format" })
	end
end

---@param opts? {force?:boolean}
function M.format(opts)
	local buf = vim.api.nvim_get_current_buf()
	if vim.b.autoformat == false and not (opts and opts.force) then
		return
	end

	local formatters = M.get_formatters(buf)
	local client_ids = vim.tbl_map(function(client)
		return client.id
	end, formatters.active)

	if #client_ids == 0 then
		return
	end

	if M.opts.format_notify then
		M.notify(formatters)
	end

	vim.lsp.buf.format(vim.tbl_deep_extend("force", {
		bufnr = buf,
		filter = function(client)
			return vim.tbl_contains(client_ids, client.id)
		end,
	}, require("nvim-lspconfig").format or {}))
end

function M.get_formatters(bufnr)
	local ft = vim.bo[bufnr].filetype
	-- check if we have any null-ls formatters for the current filetype
	local null_ls = package.loaded["null-ls"] and require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") or {}

	---@class LazyVimFormatters
	local ret = {
		---@type lsp.Client[]
		active = {},
		---@type lsp.Client[]
		available = {},
		null_ls = null_ls,
	}

	---@type lsp.Client[]
	local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
	for _, client in ipairs(clients) do
		if M.supports_format(client) then
			if (#null_ls > 0 and client.name == "null-ls") or #null_ls == 0 then
				table.insert(ret.active, client)
			else
				table.insert(ret.available, client)
			end
		end
	end

	return ret
end

return M
