local util= require("lspconfig.util")

local tsdk = function()
	return vim.fn.getcwd() .. "/node_modules/typescript/lib"
end

return {
	angularls = {},
	bashls = {
		filetypes = { "zsh", "sh" },
	},
	clangd = {
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		capabilities = {
			offsetEncoding = "utf-8",
		},
	},
	cmake = {
		--root_dir = util.root_patter("CMakeLists.txt"),
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
		-- root_dir = util.root_pattern(
		--	".eslintrc.js",
		--	".eslintrc.cjs",
		--	".eslintrc.yaml",
		--	".eslintrc.yml",
		--	".eslintrc.json",
		--	".eslintrc"
		--),
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					enable = true,
					globals = { "vim", "system", "display" },
				},
				runtime = { version = "LuaJIT" },
				workspace = {
					library = vim.list_extend({ [vim.fn.expand("$VIMRUNTIME/lua")] = true }, {}),
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
		--root_dir = util.root_pattern(
		--	".luarc.json",
		--	".luarc.jsonc",
		--	".luacheckrc",
		--	".stylua.toml",
		--	"stylua.toml",
		--	"selene.toml",
		--	"selene.yml",
		--	".git"
		--),
		filetypes = { "lua" },
	},
	gdscript = {},
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
		--root_dir = util.root_pattern("package.json", ".git"),
	},
	tailwindcss = {
		--root_dir = util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "tailwind.config.ts"),
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
		--root_dir = util.root_pattern("tsconfig.json", "jsconfig.json"),
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
				hybridMode = false,
			},
			typescript = {
				tsdk = tsdk(),
			},
		},
	},
}
