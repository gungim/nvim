local M = {}
local icons = require("gungim.icons")
local function diagnostics_indicator(_, _, diagnostics, _)
	local result = {}
	local symbols = {
		error = icons.diagnostics.Error,
		warning = icons.diagnostics.Warning,
		info = icons.diagnostics.Information,
	}
	for name, count in pairs(diagnostics) do
		if symbols[name] and count > 0 then
			table.insert(result, symbols[name] .. " " .. count)
		end
	end
	local r = table.concat(result, " ")
	return #r > 0 and r or ""
end

M.config = function()
	GG.builtin.bufferline = {
		on_config_done = nil,
		options = {
			mode = "buffers",
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "none", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			indicator = {
				icon = nil,
				style = "underline",
			},

			buffer_close_icon = icons.ui.BoldClose,
			modified_icon = icons.ui.BoldClose,
			close_icon = icons.ui.BoldClose,
			left_trunc_marker = icons.ui.ArrowCircleLeft,
			right_trunc_marker = icons.ui.ArrowCircleRight,

			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
			update_in_insert = true,
			diagnostics_indicator = diagnostics_indicator,
			offsets = {
				{
					filetype = "NvimTree",
					text = function()
						return vim.fn.getcwd()
					end,
					text_align = "center",
				},
			},
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = false,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
			enforce_regular_tabs = false,
			always_show_bufferline = true,
		},
	}
end

function M.setup()
	local status_ok, bufferline = pcall(require, "bufferline")
	if not status_ok then
		return
	end
	bufferline.setup(GG.builtin.bufferline)

	if GG.builtin.bufferline.on_config_done then
		GG.builtin.bufferline.on_config_done(bufferline)
	end
end

return M
