local icons = require("core.icons")
require("core.options")
require("core.pack"):boot_strap()

-- read colorscheme from environment vairable COLORSCHEME
-- if vim.env.COLORSCHEME then
--   vim.cmd.colorscheme(vim.env.COLORSCHEME)
--   return
-- end
vim.cmd.colorscheme("catppuccin-mocha")

vim.diagnostic.config({

	virtual_lines = false,
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
			[vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
			[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
			[vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
		},
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
})
