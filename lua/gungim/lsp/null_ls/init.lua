local M = {}
local Log = require("gungim.log")

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
			null_ls.builtins.diagnostics.eslint.with({
				condition = function(utils)
					return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
				end,
				prefer_local = "node_modules/.bin",
			}),
		},
	}
	-- null_ls.setup(vim.tbl_deep_extend("force", default_opts, gungim.lsp.null_ls.setup))
	null_ls.setup(vim.tbl_deep_extend("force", default_opts, opts))
end

return M
