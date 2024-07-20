local M = {}

local Log = require("gungim.log")
local bufopts = { noremap = true, silent = true }

local function add_lsp_buffer_options(bufnr)
	for k, v in pairs(GG.lsp.buffer_options) do
		vim.api.nvim_set_option_value(k, v, { buf = bufnr })
	end
end

function M.common_capabilities()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local caps = vim.lsp.protocol.make_client_capabilities()
	local capabilities = cmp_nvim_lsp.default_capabilities(caps)

	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	return capabilities
end

local function add_lsp_keymap(bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", bufopts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", bufopts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end

	client.server_capabilities["documentSymbolProvider"] = true
	navic.attach(client, bufnr)
end

M.on_attach = function(client, bufnr)
	add_lsp_keymap(bufnr)
	add_lsp_buffer_options(bufnr)

	attach_navic(client, bufnr)
end
M.common_on_exit = function(_, _) end

return M
