local M = {}
local Log = require("gungim.log")

function M.setup()
	local status_ok, null_ls = pcall(require, "null-ls")
	if not status_ok then
		Log:error("Missing null_ls dependency")
		return
	end

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettier,
			diagnostics.eslint.with {
				condition = function(utils)
					return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
				end,
				prefer_local = "node_modules/.bin",
			},

		},
	})
end

return M
