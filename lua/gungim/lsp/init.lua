local M = {}

require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})

local Log = require("gungim.log")
local icons = require "gungim.icons"

local function add_lsp_buffer_options(bufnr)
	for k, v in pairs(gungim.lsp.buffer_options) do
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
		['gD'] = { "<cmd>Telescope lsp_declarations<CR>", bufopts },
		['gd'] = { "<cmd>Telescope lsp_definitions<CR>", bufopts },
		['gi'] = { "<cmd>Telescope lsp_implementations<CR>", bufopts },
		['gr'] = { "<cmd>Telescope lsp_references<CR>", bufopts },
		['gl'] = { "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts },
	}
	require("gungim.config.keymaps").load_mode("n", keymaps)
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end
	navic.attach(client, bufnr)
end

function M.common_on_init(client, bufnr)
	if gungim.lsp.on_init_callback then
		gungim.lsp.on_init_callback(client, bufnr)
		Log:debug "Called lsp.on_init_callback"
		return
	end
end

M.common_on_attach = function(client, bufnr)
	add_lsp_keymap(bufnr)
	local lu = require("gungim.lsp.utils")

	if gungim.lsp.on_attach_callback then
		gungim.lsp.on_attach_callback(client, bufnr)
		Log:debug "Called lsp.on_attach_callback"
	end

	if gungim.lsp.document_highlight then
		lu.setup_document_highlight(client, bufnr)
	end

	attach_navic(client, bufnr)
	add_lsp_buffer_options(bufnr)
end
M.common_on_exit = function(_, _)
	if gungim.lsp.document_highlight then
		gungim.clear_augroup "lsp_document_highlight"
	end
end

function M.get_common_opts()
	return {
		on_attach = M.common_on_attach,
		on_init = M.common_on_init,
		on_exit = M.common_on_exit,
		capabilities = M.common_capabilities(),
	}
end

M.setup = function()
	Log:debug "Setting up LSP"
	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	local config = {
		virtual_lines = false,
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "if_many", -- Or "always"
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
	require("gungim.lsp.lsp-servers").setup()
	require("gungim.lsp.lsp-signature")
end


return M
