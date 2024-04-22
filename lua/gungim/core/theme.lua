local M = {}
M.config = function()
	GG.builtin.themes = {
		kanagawa = {
			options = {},
			colors = {},
		},
		horizon = {
			options = {
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = { italic = true },
				},
			},
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
					fg = "gold",
				},
			},
		},
		["github-theme"] = {
			options = {},
		},
		catppuccin = {
			options = {
				highlight_overrides = {},
				custom_highlights = function(colors)
					-- more options https://github.com/catppuccin/nvim#integrations
					return {
						NvimTreeWinSeparator = { fg = colors.teal },
						BufferLineBufferSelected = { sp = colors.teal },
						WinSeparator = { fg = colors.teal },
						Search = { bg = "#89dceb", fg="#313244" },
					}
				end,
			},
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
		},
	}
end

M.setup = function()
	local selected_theme = GG.theme
	if vim.startswith(GG.colorscheme, selected_theme) then
		local status_ok, plugin = pcall(require, selected_theme)
		if not status_ok then
			return
		end
		pcall(function()
			plugin.setup(GG.builtin.themes[selected_theme].options)
		end)
	end

	vim.g.colors_name = GG.colorscheme
	vim.cmd("colorscheme " .. GG.colorscheme)
end
return M
