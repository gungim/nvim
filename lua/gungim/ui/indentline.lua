local M = {}

function M.config()
	return {
		enabled = true,
		show_end_of_line = false,
		space_char_blankline = " ",
		show_current_context_start = true,
		show_current_context = true,
		use_treesitter = false,
		show_first_indent_level = true,
		show_trailing_blankline_indent = false,
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
		buftype_exclude = { "terminal", "nofile", "NvimTree", "Telescope" }
	}
end

M.setup = function()
	local status_ok, indent_blankline = pcall(require, "indent_blankline")
	if not status_ok then
		return
	end
	if false then
		vim.opt.list = true
		vim.opt.listchars:append "eol:↴"
	end
	indent_blankline.setup(M.config())
end

return M
