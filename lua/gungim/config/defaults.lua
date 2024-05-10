local colorscheme = {
	tokyonight = {
		night = "tokyonight-night",
		storm = "tokyonight-storm",
		day = "tokyonight-day",
		moon = "tokyonight-moon",
	},
	catppuccin = {
		latte = "catppuccin-latte",
		frappe = "catppuccin-frappe",
		macchiato = "catppuccin-macchiato",
		mocha = "catppuccin-mocha",
	},
	github = {
		dark = "github_dark",
		dark_dimmed = "github_dark_dimmed",
		dark_high_contrast = "github_dark_high_contrast",
		dark_colorblind = "github_dark_colorblind",
		dark_tritanopia = "github_dark_tritanopia",
		light = "github_light",
		light_high_contrast = "github_light_high_contrast",
		colorblind = "github_light_colorblind",
		light_tritanopia = "github_light_tritanopia",
	},
	rose = {
		pine = "rose-pine",
		pine_dawn = "rose-pine-dawn",
		pine_moon = "rose-pine-moon",
	},
	horizon = "horizon",
	kanagawa = {
		wave = "kanagawa-wave",
		dragon = "kanagawa-dragon",
		lotus = "kanagawa-lotus",
	},
}

return {
	leader = "space",
	colorscheme = colorscheme.catppuccin.mocha,
	theme = "catppuccin",
	builtin = {},
	colors = {},
	transparent_window = false,
}
