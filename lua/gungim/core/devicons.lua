local webpack = {
	color = "#75B2CF",
	icon = "ﰩ",
	cterm_color = "24",
	name = "Webpack",
}
local babel = {
	color = "#FFFB19",
	icon = "󰨥",
	cterm_color = "185",
	name = "Babelrc",
}
local eslint = {
	icon = "󰃠",
	color = "#A6A6ED",
	cterm_color = "24",
	name = "Eslint",
}
local node = {
	icon = "",
	name = "package",
	color = "#8fce00",
}

require("nvim-web-devicons").set_icon({
	zsh = {
		icon = "",
		color = "#428850",
		cterm_color = "65",
		name = "Zsh",
	},
	css = {
		icon = "",
		color = "#03A9F4",
		cterm_color = "39",
		name = "Css",
	},
	less = {
		icon = "",
		name = "Less",
		color = "#F64D27",
	},
	[".prettierrc"] = {
		icon = "󰰙",
		color = "#55B3B4",
		cterm_color = "113",
		name = "Prettier",
	},
	["tailwind.config.js"] = {
		icon = "",
		color = "#38BCF9",
		cterm_color = "113",
		name = "tailwindcss",
	},
	["package.json"] = node,
	["package-lock.json"] = node,
	[".env"] = {
		icon = "",
		color = "#faf743",
		cterm_color = "226",
		name = "Env",
	},
	[".gitignore"] = {
		icon = "",
		color = "#F64D27",
		cterm_color = "59",
		name = "GitIgnore",
	},
	["webpack.config.js"] = webpack,
	["webpack.config.dev.js"] = webpack,
	["webpack.config.prod.js"] = webpack,
	webpack = webpack,
	[".eslintrc"] = eslint,
	[".eslintignore"] = eslint,
	[".babelrc"] = babel,
	["*.d.ts"] = {
		icon = "",
		color = "#38BCF9",
		cterm_color = "113",
		name = "tsconfig",
	},
})
