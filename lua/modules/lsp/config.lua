local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"tailwindcss",
		"lua_ls",
		"clangd",
		"diagnosticls",
		"eslint",
		"html",
		"jsonls",
		"lemminx",
		"cssls",
		"svelte",
		"rust_analyzer",
		"bashls",
		"volar",
		"angularls",
		"cmake",
		"prismals",
		"jdtls",
	},
})

lspconfig.bashls.setup({
	filetypes = { "zsh", "sh" },
})
lspconfig.clangd.setup({
	cmd = { "clangd", "--offset-encoding=utf-16" },
})
lspconfig.cmake.setup({
	root_dir = util.root_pattern("CMakeLists.txt"),
	filetypes = { "cmake" },
})

lspconfig.cssls.setup({
	filetypes = { "css", "scss", "less", "postcss" },
})
lspconfig.emmet_ls.setup({
	settings = {
		filetypes = { "hbs", "html" },
	},
})
lspconfig.eslint.setup({
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
})
lspconfig.lua_ls.setup({
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
})
lspconfig.gdscript.setup({
	cmd = { "nc", "localhost", "6005" },
})
lspconfig.stylelint_lsp.setup({
	filetypes = {
		"css",
		"less",
		"scss",
	},
})
lspconfig.svelte.setup({
	filetype = { "svelte" },
	root_dir = util.root_pattern("svelte.config.js"),
	plugin = {
		html = { completions = true }, -- Enable HTML completions
	},
})
lspconfig.tailwindcss = {
	root_dir = util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "tailwind.config.ts"),
}
lspconfig.ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
				languages = { "vue" },
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
})
lspconfig.volar.setup({
	filetypes = { "vue" },
})

local servers = {
	"jdtls",
	"prismals",
	"angularls",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end
