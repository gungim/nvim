local icons = require("core.icons")
require("core.pack"):boot_strap()
require("core.options")

-- read colorscheme from environment vairable COLORSCHEME
-- if vim.env.COLORSCHEME then
--   vim.cmd.colorscheme(vim.env.COLORSCHEME)
--   return
-- end
vim.cmd.colorscheme("catppuccin-mocha")

local signs = {
	{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
	{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
	{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
	{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
vim.diagnostic.config({

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
})
