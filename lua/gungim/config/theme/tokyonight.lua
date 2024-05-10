local M = {}

M.config = function()
	return {

		options = {
			on_highlights = function(hl, c)
				hl.IndentBlanklineContextChar = {
					fg = c.yellow,
				}
				hl.TSConstructor = {
					fg = c.blue1,
				}
				hl.TSTagDelimiter = {
					fg = c.dark5,
				}
				hl.ColorColumn = {
					bg = c.dark3,
				}
			end,
			style = "night",
			transparent = GG.transparent_window,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = true },
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
			sidebars = {
				"qf",
				"vista_kind",
				"terminal",
				"packer",
				"spectre_panel",
				"NeogitStatus",
				"help",
			},
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = false,
			use_background = true,
			on_colors = function(_)
				-- colors.bg = "#0d1117"
				-- colors.bg = "#010409"
			end,
		},
	}
end

return M
