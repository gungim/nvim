local options = {
	styles = {
		comments = "italic",
		keywords = "bold",
		types = "italic,bold",
		functions = "italic"
	}
}

local palettes = {
	all = {
		red = "#c94f6d",
	},
}

local specs = {
	all = {
		syntax = {
			keyword = "magenta",
			conditional = "magenta.bright",
			number = "orange.dim",
		},
		git = {
			changed = "#f4a261",
		},
	},
	nightfox = {
		syntax = {
			operator = "orange",
		},
	},
}

local groups = {
	all = {
		Whitespace = { link = "Comment" },
		IncSearch = { bg = "palette.cyan" },
	},
	nightfox = {
		PmenuSel = { bg = "#73daca", fg = "bg0" },
	},
}

require("nightfox").setup({ options = options, palettes = palettes, specs = specs, groups = groups })
