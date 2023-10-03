local M = {}
M.config = function()
	gg.themes = {
		kanagawa = {
			options = {},
			colors = {}
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
				transparent = gg.transparent_window,
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

M.setup = function()
	local selected_theme = gg.theme
	if vim.startswith(gg.colorscheme, selected_theme) then
		local status_ok, plugin = pcall(require, selected_theme)
		if not status_ok then
			return
		end
		pcall(function()
			plugin.setup(gg.themes[selected_theme].options)
		end)
	end

	vim.g.colors_name = gg.colorscheme
	vim.cmd("colorscheme " .. gg.colorscheme)
end
return M
