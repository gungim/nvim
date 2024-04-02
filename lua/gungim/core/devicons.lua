local M = {}

M.config = function()
	local webpack = {
		color = "#75B2CF",
		icon = "ﰩ",
		name = "Webpack",
	}
	local babel = {
		color = "#FFFB19",
		icon = "󰨥",
		name = "Babelrc",
	}
	local eslint = {
		icon = "󰃠",
		color = "#A6A6ED",
		name = "Eslint",
	}
	local node = {
		icon = "",
		name = "package",
		color = "#8fce00",
	}
	local prettier = {

		icon = "󰰙",
		color = "#55B3B4",
		name = "Prettier",
	}
	GG.builtin.devicons = {
		on_config_done = nil,

		[".prettierrc"] = prettier,
		[".prettierignore"] = prettier,
		["tailwind.config.js"] = {
			icon = "󱏿",
			color = "#38BCF9",
			name = "tailwindcss",
		},
		["package.json"] = node,
		["package-lock.json"] = node,
		[".env"] = {
			icon = "",
			color = "#faf743",
			name = "Env",
		},
		[".gitignore"] = {
			icon = "",
			color = "#F64D27",
			name = "GitIgnore",
		},
		[".git"] = {
			icon = "",
			color = "#F64D27",
			name = "GitFolder",
		},

		["webpack.config.js"] = webpack,
		["webpack.dev.js"] = webpack,
		["webpack.prod.js"] = webpack,
		[".eslintrc"] = eslint,
		[".eslintrc.cjs"] = eslint,
		[".eslintrc.js"] = eslint,
		[".eslintignore"] = eslint,
		[".babelrc"] = babel,
		["images"] = {
			icon = "󰉏",
			color = "#38BCF9",
			name = "Images",
		},

		["src"] = {
			icon = "󰚝",
			color = "#0aff42",
			name = "SourceFile",
		},
		["dist"] = {
			icon = "󰬉",
			color = "#89e051",
			cterm_color = "113",
			name = "ProjectBuild",
		},
		["build"] = {
			icon = "󰬉",
			color = "#89e051",
			cterm_color = "113",
			name = "ProjectBuild",
		},
		[".vscode"] = {
			icon = "󰨞",
			color = "#0377f5",
			cterm_color = "113",
			name = "VScode",
		},
		["lib"] = {
			icon = "",
			color = "#ff3e00",
			name = "Lib",
		},

		["browserslist"] = {
			icon = "",
			color = "#f59803",
			name = "Browser",
		},
		["routes"] = {
			icon = "󱧬",
			color = "#428850",
			name = "RouterF",
		},
		["home"] = {
			icon = "󱂵",
			color = "#ff420a",
			name = "HomeF",
		},
		["node_modules"] = {
			icon = "",
			color = "#8fce00",
			name = "NodeModules",
		},
		["vite.config.ts"] = {
			icon = "",
			color = "#ffbc0a",
			name = "ViteConf",
		},
		[".husky"] = {
			icon = "",
			color = "#d5d5d5",
			name = "HuskyConf",
		},
		["static"] = {
			icon = "󱋣",
			color = "#ffbc0a",
			name = "StaticF",
		},
		["config"] = {
			icon = "󱁿",
			color = "#0EBFCF",
			name = "ConfigF",
		},

		[".svelte-kit"] = {
			icon = "󱁿",
			color = "#ff3e00",
			name = "SvelteConf",
		},
		zip = {
			icon = "",
			color = "#ff3e00",
			name = "Zip",
		},
		gd = {
			icon = "",
			color = "#478CBF",
			name = "GDScript",
		},
		webpack = webpack,
		zsh = {
			icon = "",
			color = "#428850",
			name = "Zsh",
		},
		css = {
			icon = "",
			color = "#03A9F4",
			name = "Css",
		},
		less = {
			icon = "",
			name = "Less",
			color = "#F64D27",
		},
	}
end

M.setup = function()
	local status_ok, devicons = pcall(require, "nvim-web-devicons")
	if not status_ok then
		return
	end

	devicons.set_icon(GG.builtin.devicons)

	devicons.setup({
		strict = true,
		-- same as `override` but specifically for overrides by filename
		-- takes effect when `strict` is true
		override_by_filename = {
			["mada"] = {
				icon = "",
				color = "#f1502f",
				name = "Gitignore",
			},
		},
	})

	if GG.builtin.devicons.on_config_done then
		GG.builtin.devicons.on_config_done(devicons)
	end
end

return M
