local M = {}

M.config = function()
	local webpack = {
		color = "#75B2CF",
		icon = "",
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
		name = "DevIconEslint",
	}
	local eslintrc = {
		icon = "󰃠",
		color = "#4b32c3",
		name = "DevIconEslintrc",
	}
	local node = {
		icon = "",
		name = "package",
		color = "#8fce00",
	}
	local prettier = {
		icon = "",
		name = "PrettierConfig",
	}
	GG.builtin.devicons = {
		on_config_done = nil,
		strict = true,
		-- by_file_name
		override_by_filename = {
			[".prettierrc"] = prettier,
			[".prettierignore"] = prettier,
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

			["webpack.config.js"] = webpack,
			["webpack.dev.js"] = webpack,
			["webpack.prod.js"] = webpack,

			[".eslintrc"] = eslint,
			[".eslintrc.cjs"] = eslint,
			[".eslintrc.js"] = eslint,
			[".eslintignore"] = eslint,

			["eslint.config.ts"] = eslintrc,
			["eslint.config.mjs"] = eslintrc,
			["eslint.config.js"] = eslintrc,
			["eslint.config.cjs"] = eslintrc,

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
				name = "ProjectBuild",
			},
			["build"] = {
				icon = "󰬉",
				color = "#89e051",
				name = "ProjectBuild",
			},
			[".vscode"] = {
				icon = "󰨞",
				color = "#0377f5",
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
			["scenes"] = {
				icon = "󱄤",
				name = "Movie",
				color = "#AA61E2",
			},
		},
		override = {},
		override_by_operating_system = {
			ubuntu = {
				icon = "󰕈",
				name = "Ubuntu",
				color = "#dd4814",
			},
		},
		override_by_extension = {
			webpack = webpack,
			app = {
				icon = "󱂵",
				name = "App",
				color = "#9F0500",
			},
			godot = {
				icon = "󰼀",
				name = "GodotProject",
				color = "#478CBF",
			},
			cfg = {
				icon = "",
				name = "Configuration",
				color = "#6d8086",
			},
			html = {
				icon = "",
				name = "Html",
				color = "#e44d26",
			},
			["d.ts"] = {
				icon = "󰛦",
				color = "#d59855",
				name = "DevIconTypeScriptDeclaration",
			},
			less = {
				icon = "",
				name = "Less",
				color = "#F64D27",
			},
			css = {
				icon = "",
				color = "#03A9F4",
				name = "Css",
			},
			zsh = {
				icon = "",
				name = "Zsh",
				color = "#89e051",
			},
			sh = {
				icon = "",
				color = "#4d5a5e",
				name = "Sh",
			},
			gd = {
				icon = "",
				color = "#478CBF",
				name = "GDScript",
			},

			tres = {
				icon = "",
				color = "#89e051",
				name = "DevIconGodotTextResource",
			},

			tscn = {
				icon = "",
				color = "#89e051",
				name = "DevIconGodotTextScene",
			},
			zip = {
				icon = "",
				color = "#ff3e00",
				name = "Zip",
			},
			tsx = {
				icon = "",
				name = "Tsx",
				color = "#1354bf",
			},
			bash = {
				icon = "",
				name = "Bash",
				color = "#89e051",
			},
			java = {
				icon = "",
				name = "Java",
				color = "#cc3e44",
			},
			[".git"] = {
				icon = "",
				color = "#F64D27",
				name = "GitFolder",
			},
		},
	}
end

M.setup = function()
	local status_ok, devicons = pcall(require, "nvim-web-devicons")
	if not status_ok then
		return
	end

	devicons.setup(GG.builtin.devicons)

	if GG.builtin.devicons.on_config_done then
		GG.builtin.devicons.on_config_done(devicons)
	end
end

return M
