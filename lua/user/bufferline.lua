local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end
local icons = require("user.icons")

bufferline.setup {
	options = {
		numbers = "none",          -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "none",    -- can be a string | function, see "Mouse actions"
		left_mouse_command = "none", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator = {
			style = 'underline'
		},
		buffer_close_icon = icons.ui.BoldClose,
		modified_icon = icons.ui.BoldClose,
		close_icon = icons.ui.BoldClose,
		left_trunc_marker = icons.ui.ArrowCircleLeft,
		right_trunc_marker = icons.ui.ArrowCircleRight,
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and icons.diagnostics.BoldWarning or icons.diagnostics.BoldError
			return icon .. " " .. count
		end,
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center", } },
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = false,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
}
