local M = {}

M.config = function()
	local util = require("formatter.util")

	GG.builtin.formatter = {
		on_config_done = nil,
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			cpp = {
				require("formatter.filetypes.cpp").clangformat,
			},
			vue = {
				require("formatter.filetypes.vue").prettier,
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
			less = {
				require("formatter.filetypes.css").prettier,
			},
			scss = {
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
			svelte = {
				require("formatter.filetypes.svelte").prettier,
			},
			rust = {
				require("formatter.filetypes.rust").rustfmt(),
			},
			sh = {
				require("formatter.filetypes.sh").shfmt(),
			},
			["zsh"] = {
				require("formatter.filetypes.sh").shfmt(),
			},
			gdscript = {

				function()
					return {
						exe = "gdformat",
						args = {
							util.escape_path(util.get_current_buffer_file_path()),
						},
						stdin = false,
						ignore_exitcode = true,
					}
				end,
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
	formatter.setup(GG.builtin.formatter)

	if GG.builtin.formatter.on_config_done then
		GG.builtin.formatter.on_config_done(formatter)
	end
end
return M
