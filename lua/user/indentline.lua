local M = {}

M.config = function()
	local status_ok, indent_blankline = pcall(require, "indent_blankline")
	if not status_ok then
		return
	end
	indent_blankline.setup({
		enabled = true,
		show_end_of_line = true,
		space_char_blankline = " ",
		show_current_context_start = true,
		show_current_context = true,
		use_treesitter = true,
		show_first_indent_level = true,
		show_trailing_blankline_indent = false,
		filetype_exclude = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		},
		char = "▏",
		context_patterns = {
			"class",
			"return",
			"function",
			"method",
			"^if",
			"^while",
			"jsx_element",
			"^for",
			"^object",
			"^table",
			"block",
			"arguments",
			"if_statement",
			"else_clause",
			"jsx_element",
			"jsx_self_closing_element",
			"try_statement",
			"catch_clause",
			"import_statement",
			"operation_type",
		},
		buftype_exclude = { "terminal", "nofile" }
	})
end
return M
