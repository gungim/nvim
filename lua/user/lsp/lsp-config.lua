local M = {}
local api = vim.api
local icons = require "user.icons"

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = require('cmp_nvim_lsp').update_capabilities(M.capabilities)


local function lsp_keymap(bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', "<cmd>Telescope lsp_declarations<CR>", bufopts)
	vim.keymap.set('n', 'gd', "<cmd>Telescope lsp_definitions<CR>", bufopts)
	vim.keymap.set('n', 'gi', "<cmd>Telescope lsp_implementations<CR>", bufopts)
	vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>", bufopts)
	vim.keymap.set('n', 'gl', "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
end

M.on_attach = function(client, bufnr)
	lsp_keymap(bufnr)
	if client.server_capabilities.documentFormattingProvider then
		api.nvim_create_autocmd('BufWritePre', {
			pattern = client.config.filetypes,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					async = true,
				})
			end,
		})
	end
end

M.setup = function()

	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
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
