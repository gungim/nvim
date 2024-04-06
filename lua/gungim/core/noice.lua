local M = {}
M.config = function()
	local icon = GG.icons
	GG.builtin.noice = {
		on_config_done = nil,
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			signature = { enabled = false },
			progress = {
				format_done = {
					{ icon.ui.Check .. " ", hl_group = "NoiceLspProgressSpinner" },
					{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
					{ "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
				},
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		popupmenu = {
			kind_icons = icon.kind,
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
	noice.setup(GG.builtin.noice)
	if GG.builtin.noice.on_config_done then
		GG.builtin.noice.on_config_done(noice)
	end
end
return M
