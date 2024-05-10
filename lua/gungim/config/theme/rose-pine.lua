local M = {}

M.config = function()
	return {
		options = {
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = false,
			disable_float_background = false,
			disable_italics = false,
		},
		highlight_groups = {
			IndentBlanklineChar = {
				fg = "gold",
			},
		},
	}
end

return M
