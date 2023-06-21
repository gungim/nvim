local M = {}
local icons = require "gungim.icons"

function M.commont_capabilities()
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

local function lsp_keymap(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
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

M.common_on_attach = function(client, bufnr)
	lsp_keymap(bufnr)
	attach_navic(client, bufnr)
end

M.setup = function()
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
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded"
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		-- width = 60,
		-- height = 30,
	})
end


return M
