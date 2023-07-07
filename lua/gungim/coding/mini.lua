local M = {}

M.surround = function()
	local status_ok, surround = pcall(require, "mini.surround")
	if not status_ok then
		return
	end
	surround.setup({
		custom_surroundings = nil,
		highlight_duration = 500,
		mappings = {
			add = 'sa',         -- Add surrounding in Normal and Visual modes
			delete = 'sd',      -- Delete surrounding
			find = 'sf',        -- Find surrounding (to the right)
			find_left = 'sF',   -- Find surrounding (to the left)
			highlight = 'sh',   -- Highlight surrounding
			replace = 'sr',     -- Replace surrounding
			update_n_lines = 'sn', -- Update `n_lines`

			suffix_last = 'l',  -- Suffix to search with "prev" method
			suffix_next = 'n',  -- Suffix to search with "next" method
		},
		n_lines = 20,
		respect_selection_type = false,
		search_method = 'cover',
		silent = false,
	})
end

M.comment = function()
	local status_ok, comment = pcall(require, "mini.comment")
	if not status_ok then
		return
	end
	comment.setup({
		options = {
			custom_commentstring = function()
				return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
			end,
		},
		mappings = {
			comment = 'gc',
			comment_line = 'gcc',
			textobject = 'gc',
		},
	})
end

M.setup = function()
	M.surround()
	M.comment()
end

return M
