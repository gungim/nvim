local lspconfig = require 'lspconfig'
return {
	settings = {

		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine"
			},
			showDocumentation = {
				enable = true
			}
		},
		codeActionOnSave = {
			enable = false,
			mode = "all"
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
			mode = "location"
		}
	},
	root_dir = lspconfig.util.root_pattern('.eslintrc.js', ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml",
		".eslintrc.json", ".eslintrc")
}
