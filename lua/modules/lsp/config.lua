local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local keymap = require("core.keymap")

local au = vim.api.nvim_create_autocmd

local capabilities = require("cmp_nvim_lsp").default_capabilities()

au("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_clients({ id = args.data.client_id })[1]
		local bufnr = args.buf

		client.server_capabilities.semanticTokensProvider = nil
		require("lsp_signature").on_attach({
			floating_window = false,

			fix_pos = true,
			hint_prefix = "🐼" .. " ",
			hint_scheme = "String",
			close_timeout = 1000,
			hi_parameter = "LspSignatureActiveParameter",

			-- handler_opts = { border = "single" },

			auto_close_after = 3,
			transparency = 50,
		}, bufnr)

		keymap.load({
			normal_mode = {
				["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
				["gi"] = "<cmd>lua vim.lsp.buf.implementations()<CR>",
				["gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
				["gl"] = "<cmd>lua vim.diagnostic.open_float()<CR>",
			},
		})
	end,
})
au("CursorHold", {
	callback = function()
		local float_opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		}

		if not vim.b.diagnostics_pos then
			vim.b.diagnostics_pos = { nil, nil }
		end

		local cursor_pos = vim.api.nvim_win_get_cursor(0)
		if
			(cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
			and #vim.diagnostic.get() > 0
		then
			vim.diagnostic.open_float(nil, float_opts)
		end

		vim.b.diagnostics_pos = cursor_pos
	end,
})

-- au("CursorHold", {
-- 	callback = function()
-- 		vim.lsp.buf.hover()
-- 	end,
-- })

lspconfig.bashls.setup({
	capabilities = capabilities,
	filetypes = { "zsh", "sh" },
})
lspconfig.clangd.setup({
	capabilities = capabilities,
	cmd = { "clangd", "--offset-encoding=utf-16" },
})
lspconfig.cmake.setup({
	capabilities = capabilities,
	root_dir = util.root_pattern("CMakeLists.txt"),
	filetypes = { "cmake" },
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	filetypes = { "css", "scss", "less", "postcss" },
})
lspconfig.emmet_language_server.setup({
	capabilities = capabilities,
	settings = {
		filetypes = { "hbs", "html" },
	},
})
lspconfig.eslint.setup({
	capabilities = capabilities,
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
	capabilities = capabilities,
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
	capabilities = capabilities,
	cmd = { "nc", "localhost", "6005" },
})
lspconfig.stylelint_lsp.setup({
	capabilities = capabilities,
	filetypes = {
		"css",
		"less",
		"scss",
	},
})
lspconfig.svelte.setup({
	capabilities = capabilities,
	filetype = { "svelte" },
	root_dir = util.root_pattern("svelte.config.js"),
	plugin = {
		html = { completions = true }, -- Enable HTML completions
	},
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	root_dir = util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "tailwind.config.ts"),
})
lspconfig.ts_ls.setup({
	capabilities = capabilities,
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
	"rust_analyzer",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end
