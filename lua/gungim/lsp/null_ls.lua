local M = {}
local Log = require("gungim.log")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local on_attack = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false    -- 0.7 and earlier
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

function M.setup()
	local status_ok, null_ls = pcall(require, "null-ls")
	if not status_ok then
		Log:error "Missing null-ls dependency"
		return
	end

	local default_opts = require("gungim.lsp").get_common_opts()
	local opts = {
		sources = {
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.rustfmt.with({
				extra_args = { "--edition=2021" }
			}),
			null_ls.builtins.diagnostics.eslint.with({
				condition = function(utils)
					return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
				end,
				prefer_local = "node_modules/.bin",
			}),
		},
		on_attack = on_attack
	}
	-- null_ls.setup(vim.tbl_deep_extend("force", default_opts, gungim.lsp.null_ls.setup))
	null_ls.setup(vim.tbl_deep_extend("force", default_opts, opts))
end

return M
