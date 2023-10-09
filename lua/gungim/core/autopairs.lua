local M = {}

function M.config()
	gg.builtin.autopairs = {
		active = true,
		on_config_done = nil,
		---@usage  modifies the function or method delimiter by filetypes
		map_char = {
			all = "(",
			tex = "{",
		},
		---@usage check bracket in same line
		enable_check_bracket_line = false,
		---@usage check treesitter
		check_ts = true,
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
			java = false,
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
		ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
		enable_moveright = true,
		---@usage disable when recording or executing a macro
		disable_in_macro = false,
		---@usage add bracket pairs after quote
		enable_afterquote = true,
		---@usage map the <BS> key
		map_bs = true,
		---@usage map <c-w> to delete a pair if possible
		map_c_w = false,
		---@usage disable when insert after visual block mode
		disable_in_visualblock = false,
		---@usage  change default fast_wrap
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			offset = 0, -- Offset from pattern match
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "Search",
			highlight_grey = "Comment",
		},
	}
end

M.setup = function()
	local status_ok, autopairs = pcall(require, "nvim-autopairs")
	if not status_ok then
		return
	end

	autopairs.setup(gg.builtin.autopairs)

	if gg.builtin.autopairs.on_config_done then
		gg.builtin.autopairs.on_config_done(autopairs)
	end

	pcall(function()
		local function on_confirm_done(...)
			require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
		end
		require("cmp").event:off("confirm_done", on_confirm_done)
		require("cmp").event:on("confirm_done", on_confirm_done)
	end)
end

return M
