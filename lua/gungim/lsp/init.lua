local M = {}

local Log = require("gungim.log")

local function add_lsp_buffer_options(bufnr)
	for k, v in pairs(GG.lsp.buffer_options) do
		vim.api.nvim_buf_set_option(bufnr, k, v)
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
		["gd"] = { "<cmd>Telescope lsp_definitions<CR>", bufopts },
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

function M.common_on_init(client, bufnr)
	if GG.lsp.on_init_callback then
		GG.lsp.on_init_callback(client, bufnr)
		Log:debug("Called lsp.on_init_callback")
		return
	end
end

M.common_on_attach = function(client, bufnr)
	add_lsp_keymap(bufnr)
	add_lsp_buffer_options(bufnr)

	if GG.lsp.on_attach_callback then
		GG.lsp.on_attach_callback(client, bufnr)
		Log:debug("Called lsp.on_attach_callback")
	end

	attach_navic(client, bufnr)
end
M.common_on_exit = function(_, _) end

function M.get_common_opts()
	return {
		on_attach = M.common_on_attach,
		on_init = M.common_on_init,
		on_exit = M.common_on_exit,
		capabilities = M.common_capabilities(),
	}
end

M.setup = function()
	require("gungim.lsp.lsp-servers").setup()
end

return M
