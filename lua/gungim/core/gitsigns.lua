local M  = {}
M.config = function()
	gungim.builtin.gitsigns = {
		active = true,
		on_config_done = nil,
		opts = {
			signs = {
				add = {
					hl = "GitSignsAdd",
					text = gungim.icons.ui.BoldLineLeft,
					numhl = "GitSignsAddNr",
					linehl = "GitSignsAddLn",
				},
				change = {
					hl = "GitSignsChange",
					text = gungim.icons.ui.BoldLineLeft,
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {
					hl = "GitSignsDelete",
					text = gungim.icons.ui.BoldLineLeft,
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = gungim.icons.ui.BoldLineLeft,
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = gungim.icons.ui.BoldLineLeft,
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			status_formatter = nil, -- Use default
			update_debounce = 200,
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = { enable = false },
		}
	}
end

M.setup  = function()
	local status_ok, gitsigns = pcall(require, "gitsigns")
	if not status_ok then
		return
	end

	gitsigns.setup(gungim.builtin.gitsigns.opts)
	if gungim.builtin.gitsigns.on_config_done then
		gungim.builtin.gitsigns.on_config_done(gitsigns)
	end
end

return M
