local colors = require("kanagawa.colors").setup()
local theme_colors = colors.theme
local palette_colors = colors.palette


return {
	fg = theme_colors.ui.fg,
	bg = theme_colors.ui.bg_m3,
	normal = palette_colors.katanaGray,
	visual = palette_colors.crystalBlue,
	command = palette_colors.autumnGreen,
	insert = palette_colors.roninYellow,
	replace = palette_colors.roninYellow,
	inactive = palette_colors.springBlue,
	search = palette_colors.springBlue,
	file = palette_colors.oniViolet,
	git = {
		add    = theme_colors.vcs.added,
		remove = theme_colors.vcs.removed,
		change = theme_colors.vcs.changed,
	},
	diag = {
		ok      = theme_colors.diag.ok,
		error   = theme_colors.diag.error,
		warning = theme_colors.diag.warning,
		info    = theme_colors.diag.info,
		hint    = theme_colors.diag.hint,
	}
}

