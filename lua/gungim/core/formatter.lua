local M = {}

M.config = function()
	local util = require("formatter.util")

	gg.builtin.formatter = {
		on_config_done = nil,
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
				function()
					if util.get_current_buffer_file_name() == "special.lua" then
						return nil
					end
					return {
						exe = "stylua",
						args = {
							"--search-parent-directories",
							"--stdin-filepath",
							util.escape_path(util.get_current_buffer_file_path()),
							"--",
							"-",
						},
						stdin = true,
					}
				end,
			},
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			typescript = {
				require("formatter.filetypes.typescript").prettier,
			},
			typescriptreact = {
				require("formatter.filetypes.typescriptreact").prettier,
			},
			html = {
				require("formatter.filetypes.html").prettier,
			},
			css = {
				require("formatter.filetypes.css").prettier,
			},
			json = {
				require("formatter.filetypes.json").prettier,
			},
			javascript = {
				require("formatter.filetypes.javascript").prettier,
			},
			javascriptreact = {
				require("formatter.filetypes.javascriptreact").prettier,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	}
end

M.setup = function()
	local status_ok, formatter = pcall(require, "formatter")
	if not status_ok then
		return
	end
	formatter.setup(gg.builtin.formatter)

	if gg.builtin.formatter.on_config_done then
		gg.builtin.which_key.on_config_done(formatter)
	end
end
return M
