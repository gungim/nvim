packadd({
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
})
packadd({
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end,
})

packadd({

	"williamboman/mason-lspconfig.nvim",
	config = function()
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
				"emmet_language_server",
			},
		})
	end,
})

packadd({
	"neovim/nvim-lspconfig",
	config = function()
		require("modules.lsp.config")
	end,
})
