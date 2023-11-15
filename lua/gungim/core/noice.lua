local M = {}
M.config = function()
	gg.builtin.noice = {
		on_config_done = nil,
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			signature = { enabled = false },
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		views = {
			cmdline_popup = {
				position = {
					row = "40%",
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
		},
	}
end
M.setup = function()
	local status_ok, noice = pcall(require, "noice")
	if not status_ok then
		return
	end
	noice.setup(gg.builtin.noice)
	if gg.builtin.noice.on_config_done then
		gg.builtin.noice.on_config_done(noice)
	end
end
return M
