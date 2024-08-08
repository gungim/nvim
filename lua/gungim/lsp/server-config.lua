local util = require("lspconfig.util")

return {
	angularls = {
	},
	bashls = {
		filetypes = { "zsh", "sh" },
	},
	clangd = {
		cmd = { "clangd", "--offset-encoding=utf-16" },
	},
	cmake = {
		root_dir = util.root_pattern("CMakeLists.txt"),
		filetypes = { "cmake" },
	},
	cssls = {
		filetypes = { "css", "scss", "less", "postcss" },
	},
	emmet_ls = {
		settings = {
			filetypes = { "hbs", "html" },
		},
	},
	eslint = {
		settings = {
			codeAction = {
				disableRuleComment = {
					enable = true,
					location = "separateLine",
				},
				showDocumentation = {
					enable = true,
				},
			},
			codeActionOnSave = {
				enable = false,
				mode = "all",
			},
			format = true,
			nodePath = "",
			onIgnoredFiles = "off",
			packageManager = "npm",
			quiet = false,
			rulesCustomizations = {},
			run = "onType",
			useESLintClass = false,
			validate = "on",
			workingDirectory = {
				mode = "location",
			},
		},
		root_dir = util.root_pattern(
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json",
			".eslintrc"
		),
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.stdpath("config"),
					},
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	gdscript = {
		cmd = { "nc", "localhost", "6005" },
	},
	jdtls = {},
	prettier = {},
	prismals = {},
	stylelint_lsp = {
		filetypes = {
			"css",
			"less",
			"scss",
		},
	},
	svelte = {
		filetype = { "svelte" },
		root_dir = util.root_pattern("package.json", ".git"),
	},
	tailwindcss = {
		root_dir = util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "tailwind.config.ts"),
	},
	tsserver = {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
					languages = { "javascript", "typescript", "vue" },
				},
			},
		},
		root_dir = util.root_pattern("tsconfig.json", "jsconfig.json"),
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"vue",
		},
	},
	volar = {
		filetypes = { "vue" },
		init_options = {
			vue = {
				hybridMode = true,
			},
		},
	},
}
