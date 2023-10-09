local M = {}

M.config = function()
	gg.builtin.prettier = {
		on_config_done = nil,
		bin = "prettier", -- or `'prettierd'` (v0.22+)
		filetypes = {
			"css",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"less",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"yaml",
		},
		cli_options = {},
	}
end

M.setup = function()
	local status_ok, prettier = pcall(require, "prettier")
	if not status_ok then
		return
	end
	prettier.setup(gg.builtin.prettier)
	if gg.builtin.prettier.on_config_done then
		gg.builtin.prettier.on_config_done(prettier)
	end
end
return M
