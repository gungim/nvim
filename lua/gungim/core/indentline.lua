local M = {}

function M.config()
	gungim.builtin.indentlines = {
		active = true,
		on_config_done = nil,
		options = {
			enabled = true,
			show_end_of_line = false,
			space_char_blankline = " ",
			show_current_context_start = true,
			show_current_context = true,
			use_treesitter = false,
			show_first_indent_level = true,
			show_trailing_blankline_indent = false,
			char = gungim.icons.ui.LineLeft,
			buftype_exclude = { "terminal", "nofile" },
			filetype_exclude = {
				"help",
				"startify",
				"dashboard",
				"lazy",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"text",
			},
		}
	}
end

M.setup = function()
	local status_ok, indent_blankline = pcall(require, "indent_blankline")
	if not status_ok then
		return
	end

	vim.opt.list = true
	vim.opt.listchars:append "space:⋅"
	indent_blankline.setup(gungim.builtin.indentlines.options)

	if gungim.builtin.indentlines.on_config_done then
		gungim.builtin.indentlines.on_config_done()
	end
end

return M
