packadd({
	"neovim/nvim-lspconfig",
	config = function()
		require("modules.lsp.config")
	end,
})

packadd({
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
})
packadd({
	"mason-org/mason.nvim",
	version = "^1.0.0",
	config = function()
		require("mason").setup()
	end,
})

packadd({
	"mason-org/mason-lspconfig.nvim",
	version = "^1.0.0",
	config = function()
		require("mason-lspconfig").setup({
			automatic_enable = true,
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
				"emmet_language_server",
				"intelephense",
			},
		})
	end,
})
