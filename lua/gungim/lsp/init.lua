local M = {}

local Log = require("gungim.log")

local function add_lsp_buffer_options(bufnr)
	for k, v in pairs(GG.lsp.buffer_options) do
		vim.api.nvim_set_option_value(k, v, { buf = bufnr })
	end
end

function M.common_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
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
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local keymaps = {
		["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts },
		["gi"] = { "<cmd>Telescope lsp_implementations<CR>", bufopts },
		["gr"] = { "<cmd>Telescope lsp_references<CR>", bufopts },
		["gl"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts },
	}
	require("gungim.config.keymaps").load_mode("n", keymaps)
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

M.common_on_attach = function(client, bufnr)
	add_lsp_keymap(bufnr)
	add_lsp_buffer_options(bufnr)

	attach_navic(client, bufnr)
end
M.common_on_exit = function(_, _) end

function M.get_common_opts()
	return {
		on_attach = M.common_on_attach,
		capabilities = M.common_capabilities(),
	}
end

M.setup = function()
	require("gungim.lsp.lsp-servers").setup()
end

return M
