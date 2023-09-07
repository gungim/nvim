local M = {}
M.config = function()
	gungim.builtin.theme = {
		name = "kanagawa",
		kanagawa = {
			options = {}
		},
		horizon = {
			options = {
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = { italic = true },
				}
			}
		},
		["rose-pine"] = {
			options = {
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = 'main',
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = 'dawn',
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,
			},
			highlight_groups = {
				IndentBlanklineChar = {
					fg = "gold"
				},
			}
		},
		["github-theme"] = {
			options = {},
		},
		catppuccin = {
			options = {
				highlight_overrides = {},
				custom_highlights = function(colors)
					return {}
				end
			}
		},
		tokyonight = {
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
				transparent = gungim.transparent_window,
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
				on_colors = function(colors)
					-- colors.bg = "#0d1117"
					-- colors.bg = "#010409"
				end,
			},
		}
	}
end
M.colors = function()
	local colors = {
		none = "NONE",
		bg_dark = "#16161e",
		bg = "#1a1b26",
		bg_highlight = "#292e42",
		terminal_black = "#414868",
		fg = "#c0caf5",
		fg_dark = "#a9b1d6",
		fg_gutter = "#3b4261",
		dark3 = "#545c7e",
		comment = "#565f89",
		dark5 = "#737aa2",
		blue0 = "#3d59a1",
		blue = "#7aa2f7",
		cyan = "#7dcfff",
		blue1 = "#2ac3de",
		blue2 = "#0db9d7",
		blue5 = "#89ddff",
		blue6 = "#b4f9f8",
		blue7 = "#394b70",
		magenta = "#bb9af7",
		magenta2 = "#ff007c",
		purple = "#9d7cd8",
		orange = "#ff9e64",
		yellow = "#e0af68",
		green = "#9ece6a",
		green1 = "#73daca",
		green2 = "#41a6b5",
		teal = "#1abc9c",
		red = "#f7768e",
		red1 = "#db4b4b",
		git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
		gitSigns = {
			add = "#266d6a",
			change = "#536c9e",
			delete = "#b2555b",
		},
	}
	return colors
end

M.setup = function()
	local selected_theme = gungim.builtin.theme.name
	if vim.startswith(gungim.colorscheme, selected_theme) then
		local status_ok, plugin = pcall(require, selected_theme)
		if not status_ok then
			return
		end
		pcall(function()
			plugin.setup(gungim.builtin.theme[selected_theme].options)
		end)
	end

	vim.g.colors_name = gungim.colorscheme
	vim.cmd("colorscheme " .. gungim.colorscheme)
end
return M
